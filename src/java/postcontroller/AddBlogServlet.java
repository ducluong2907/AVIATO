/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package postcontroller;

//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;

import dal.MKTDAO;
import java.io.IOException;
import java.io.*;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Blog;
import model.CategoryBlog;


/**
 *
 * @author Admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class AddBlogServlet extends HttpServlet {
    
    private static final long SerialVersionUID = 1L;
    private static final String  UPLOAD_DIR = "images/img_blog";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("addBlog.jsp"); 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter pr = response.getWriter();
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String authorName = request.getParameter("authorName");
            //String createDate = request.getParameter("createDate");
            String status = request.getParameter("status");
            boolean xstatus;
            if (status.equals("1")) xstatus = true;
                else xstatus = false;
            String cateBlogID = request.getParameter("cateBlogID");
            int xCateBlogID = Integer.parseInt(cateBlogID);
            String blogImg = uploadFile(request);
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date(System.currentTimeMillis());
            String createDate = sdf.format(date);
            Blog b = new Blog(1,1,title,content,blogImg,authorName,createDate, xstatus, 
                    new CategoryBlog(xCateBlogID, "") );
            MKTDAO mkt = new MKTDAO();
            mkt.insert(b); 
            response.sendRedirect("lstpost"); 
        }
        
    private String uploadFile(HttpServletRequest request) throws IOException, ServletException{
        String fileName="";
        try{
            Part filePart = request.getPart("blogImg");
            fileName = (String) getFileName(filePart);
            String applicationPath = request.getServletContext().getRealPath("");
            String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;
            InputStream inputStream = null;
            OutputStream outputStream = null;
            try {
                File outputFilePath = new  File(basePath + fileName);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes =  new  byte[1024];
                while((read = inputStream.read(bytes)) != -1){
                    outputStream.write(bytes, 0, read);
                }
            } catch (Exception e) {
                e.printStackTrace();
                fileName = "";
            }finally{
                if(inputStream != null){
                    inputStream.close();
                }
                if(outputStream != null){
                    outputStream.close();
                }
            }
            
        }catch(Exception e){
            fileName = "";
        }
        return fileName;
    }
    private String  getFileName(Part part){
        final String  partHeader = part.getHeader("content-disposition");
        System.out.println("*****partHeader :"+ partHeader);
        for(String content : part.getHeader("content-disposition").split(";")){
            if(content.trim().startsWith("filename")){
                return content.substring(content.indexOf('=')+1).trim().replace("\"", "" );
            }
        }
        
        return null;
    }

        
}

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */


