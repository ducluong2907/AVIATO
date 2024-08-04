/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AdminDAO;
import dal.MKTDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Blog;
import model.CategoryBlog;
import model.Slider;

/**
 *
 * @author hophu
 */
public class lstSliderServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet lstSliderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet lstSliderServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter pr = response.getWriter();
        MKTDAO mkt = new MKTDAO();
        AdminDAO ad = new AdminDAO();
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        session.setAttribute("action", action);
        String id = request.getParameter("id");
        int idPage = 1;
        try {
            idPage = Integer.parseInt(id);
        } catch (Exception e) {
        }

        //int numberPage = 2;
//        if (numberPage % 5 != 0) numberPage = (numberPage/5) +1;
//        else numberPage = numberPage/5;
        List<Slider> lstSlider = mkt.getPageSlider(idPage);

        ///
        int numberPage = mkt.getNumberOfSlider();
        if (numberPage % 5 != 0) {
            numberPage = (numberPage / 5) + 1;
        } else {
            numberPage = numberPage / 5;
        }
        ///

        request.setAttribute("idPage", idPage);
        request.setAttribute("action", "lstslider");
        request.setAttribute("numberPage", numberPage);
        request.setAttribute("lstSlider", lstSlider);
        request.getRequestDispatcher("manageslider.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter pr = response.getWriter();
        MKTDAO mkt = new MKTDAO();
        AdminDAO ad = new AdminDAO();
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        session.setAttribute("action", action);
        String id = request.getParameter("id");
        int idPage = 1;
        try {
            idPage = Integer.parseInt(id);
        } catch (Exception e) {
        }

        int numberPage = 2;
//        if (numberPage % 5 != 0) numberPage = (numberPage/5) +1;
//        else numberPage = numberPage/5;
        List<Slider> lstSlider = mkt.getPageSlider(idPage);
//        pr.print(lstPost.get(0).toString());
//        List<CategoryBlog> listCateBlog = mkt.getAllCateBlog();
//        pr.println();
//        pr.print(listCateBlog.get(0).toString());

        request.setAttribute("idPage", idPage);
        request.setAttribute("numberPage", numberPage);
        request.setAttribute("lstSlider", lstSlider);
//        request.setAttribute("listCateBlog", listCateBlog);
//        request.getRequestDispatcher("listpost.jsp").forward(request, response);
        request.getRequestDispatcher("manageslider.jsp").forward(request, response);
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
