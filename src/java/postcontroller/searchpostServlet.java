/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package postcontroller;

import dal.MKTDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Blog;
import model.CategoryBlog;

/**
 *
 * @author Admin
 */
public class searchpostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet searchpostServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchpostServlet at " + request.getContextPath() + "</h1>");
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
        PrintWriter pr = response.getWriter();
        MKTDAO mkt = new MKTDAO();
        String key = request.getParameter("key");
        String id = request.getParameter("id");
        int idPage = 1;
        try {
            idPage = Integer.parseInt(id);
        } catch (Exception e) {
        }
        List<Blog> lst = mkt.getBlogByTitle(key);
        int numberPage = lst.size();
        if (numberPage % 5 != 0) numberPage = (numberPage/5) +1;
        else numberPage = numberPage/5;
        int cc = Math.min((idPage-1)*5 + 5, lst.size()-1);
        List <Blog> lstB = new ArrayList<>();
        for (int i = (idPage-1)*5+1; i <= cc; i++) {
            lstB.add(lst.get(i));
        }
        List<CategoryBlog> listCateBlog = mkt.getAllCateBlog();
        request.setAttribute("idPage", idPage);
        request.setAttribute("action", "searchpost");
        request.setAttribute("numberPage", numberPage);
        request.setAttribute("lstPost", lstB);
        request.setAttribute("key", key);
        request.setAttribute("listCateBlog", listCateBlog);
        request.getRequestDispatcher("managepost.jsp").forward(request, response);
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
        String key = request.getParameter("key");
        MKTDAO mkt = new MKTDAO();
        String id = request.getParameter("id");
        int idPage = 1;
        try {
            idPage = Integer.parseInt(id);
        } catch (Exception e) {
        }
        List<Blog> lst = mkt.getBlogByTitle(key);
        int numberPage = lst.size();
        if (numberPage % 5 != 0) numberPage = (numberPage/5) +1;
        else numberPage = numberPage/5;
        int cc = Math.min((idPage-1)*5 + 5, lst.size()-1);
        List <Blog> lstB = new ArrayList<>();
        for (int i = (idPage-1)*5+1; i <= cc; i++) {
            lstB.add(lst.get(i));
        }
        List<CategoryBlog> listCateBlog = mkt.getAllCateBlog();
        
        request.setAttribute("action", "searchpost");
        request.setAttribute("numberPage", numberPage);
        request.setAttribute("lstPost", lstB);
        request.setAttribute("key", key);
        request.setAttribute("listCateBlog", listCateBlog);
        request.getRequestDispatcher("managepost.jsp").forward(request, response);
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
