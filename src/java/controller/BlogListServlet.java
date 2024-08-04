/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Blog;
import model.CategoryBlog;

/**
 *
 * @author hophu
 */
public class BlogListServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BlogListServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogListServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        AdminDAO d= new AdminDAO();
        List<Blog> list = d.getListBlog();
        request.setAttribute("listBlog", list);
        int countPage = d.getNumberPage();
        request.setAttribute("countPage", countPage);
        
        
        String index = request.getParameter("index");
        if(index == null){
            index ="1";
        }
        List<Blog> list_latest = d.getPostLatest();
        int indexPage = Integer.parseInt(index);
        List<Blog> listPaged = d.getPaging(indexPage);
        
        List<CategoryBlog> listCateBlog = d.getCateBlog();
        
        request.setAttribute("listPaged", listPaged);
        request.setAttribute("listCateBlog", listCateBlog);
        request.setAttribute("latestPost", list_latest);
        request.setAttribute("indexPage", indexPage);
        request.getRequestDispatcher("blog-left-sidebar.jsp").forward(request, response);
//        response.sendRedirect("blog-left-sidebar.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
