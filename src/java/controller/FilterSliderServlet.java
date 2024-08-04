/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.MKTDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Blog;
import model.CategoryBlog;
import model.Slider;

/**
 *
 * @author Admin
 */
public class FilterSliderServlet extends HttpServlet {

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
            out.println("<title>Servlet FilterSliderServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterSliderServlet at " + request.getContextPath() + "</h1>");
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
        String status = request.getParameter("status");
        String key = request.getParameter("key");
        PrintWriter pr = response.getWriter();
        MKTDAO mkt = new MKTDAO();
        String id = request.getParameter("id");
        int idPage = 1;
        try {
            idPage = Integer.parseInt(id);
        } catch (Exception e) {
        }
        Boolean xStatus = null;
        if (status.equals("0")) xStatus = false;
        else if (status.equals("1")) xStatus = true; 
        List <Slider> lstSlider = mkt.getSliderByStatus(xStatus, idPage);  
        
//        List<Slider> lstSlider = mkt.getPageSlider(idPage);
        
        ///
        int numberPage = mkt.getNumberOfSliderByStatus(xStatus);   
        
        if (numberPage % 5 != 0) numberPage = (numberPage/5) +1;
        else numberPage = numberPage/5;
       
        
        request.setAttribute("idPage", idPage);
        request.setAttribute("action", "filterslider");
        request.setAttribute("status", Integer.parseInt(status));
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
