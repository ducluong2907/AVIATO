/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.OrderDAO;
import dal.SaleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import model.order.Order;

/**
 *
 * @author hophu
 */
public class SaleDashboardServlet extends HttpServlet {

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
            out.println("<title>Servlet SaleDashboardServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaleDashboardServlet at " + request.getContextPath() + "</h1>");
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
        OrderDAO od = new OrderDAO();
        SaleDAO sd = new SaleDAO();
        List<User> listU = sd.getAllSale();
        request.setAttribute("listU", listU);
        request.getRequestDispatcher("Sale_Dashboard.jsp").forward(request, response);
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
//        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        OrderDAO od = new OrderDAO();
        SaleDAO sd = new SaleDAO();
        
        String year_raw = request.getParameter("year");
        String month_raw = request.getParameter("month");
        String startDay_raw = request.getParameter("from");
        String endDay_raw = request.getParameter("to");
        String id_raw = request.getParameter("idSale");
        
        int year = 0, month = 0, startDay = 0, endDay = 0;
        int id = 0;
        try {
            id = Integer.parseInt(id_raw);
            year = Integer.parseInt(year_raw);
            month = Integer.parseInt(month_raw);
            startDay = Integer.parseInt(startDay_raw);
            endDay = Integer.parseInt(endDay_raw);
        } catch (Exception e) {
        }
        int total = 0;
        int totalSuccess = 0;

        List<Order> listO = new ArrayList<>();
        List<Order> listSortO = new ArrayList<>();
        List<Double> listAmount = new ArrayList<>();
        List<String> listDay = new ArrayList<>();
        double sumTotal = 0;

        if (id == 0) {
            total = sd.getTotalOrder(year,month,startDay,endDay);
            totalSuccess = sd.getTotalSuccess(year,month,startDay,endDay);

            listO = sd.getListOrder(year,month,startDay,endDay);
            for (Order o : listO) {
                sumTotal = sumTotal + o.getAmount();
            }
            
            listAmount = sd.sortListOrder(year,month,startDay,endDay);
            listDay = sd.getDayLatest(year, month, startDay, endDay);

        } else {
            total = sd.getTotalOrderByID(id,year,month,startDay,endDay);
            totalSuccess = sd.getTotalSuccessByUserID(id,year,month,startDay,endDay);
            
            listO = sd.getListOrderByUserID(id,year,month,startDay,endDay);
            for (Order o : listO) {
                sumTotal = sumTotal + o.getAmount();
            }
            
            listAmount = sd.sortListOrderByUserID(id,year,month,startDay,endDay);
            listDay= sd.getDayLatestByID(id, year, month, startDay, endDay);
        }
        List<User> listU = sd.getAllSale();

        request.setAttribute("year", year);
        request.setAttribute("month", month);
        request.setAttribute("startDay", startDay);
        request.setAttribute("endDay", endDay);
        
        
        request.setAttribute("sumTotal", sumTotal);
        request.setAttribute("listAmount", listAmount);
        request.setAttribute("listDay", listDay);
        request.setAttribute("listU", listU);
        request.setAttribute("total", total);
        request.setAttribute("totalS", totalSuccess);
//        PrintWriter out = response.getWriter();
//        out.print(id);
        
        request.getRequestDispatcher("Sale_Dashboard.jsp").forward(request, response);
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
