/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AdminDAO;
import dal.MarketingDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import model.product.Product;

public class MKTDashBoardServlet extends HttpServlet {

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
            out.println("<title>Servlet MKTDashBoardServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MKTDashBoardServlet at " + request.getContextPath() + "</h1>");
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
        MarketingDAO m = new MarketingDAO();
        AdminDAO d = new AdminDAO();
        List<Integer> list = m.getTop5UserBuyMost();
        List<User> listUser = new ArrayList<>();
        PrintWriter out = response.getWriter();
        try {
            for (int i = 0; i < list.size(); i++) {
                User u = d.getUserByID(list.get(i));
                listUser.add(u);
            }
        } catch (Exception e) {
        }
        List<Double> listRevenueByWeek = m.getTopRevenueByWeek();
        List<String> listDayRevenueByWeek = m.getDayTopRevenueByWeek();
        ProductDAO pd = new ProductDAO();
        List<Product> listProduct = pd.getTop4Product();
        int total = m.getTotalPost();
        
        request.setAttribute("totalPost", total);
        request.setAttribute("listRevenueByWeek", listRevenueByWeek);
        request.setAttribute("listDayRevenueByWeek", listDayRevenueByWeek);
        request.setAttribute("ListProduct", listProduct);
        request.setAttribute("listUser", listUser);
        request.getRequestDispatcher("MKT_Dashboard.jsp").forward(request, response);
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
        MarketingDAO m = new MarketingDAO();
        AdminDAO d = new AdminDAO();
        String month_raw = request.getParameter("month");
        String year_raw = request.getParameter("year");
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        int month=0,year=0,from=0,to=0;
        try {
            month = Integer.parseInt(month_raw);
            year = Integer.parseInt(year_raw);
            from = Integer.parseInt(from_raw);
            to = Integer.parseInt(to_raw);
        } catch (Exception e) {
        }
        List<Double> listRevenue = m.getRevenueByDay(from, to, month, year);
        List<Integer> listDay = new ArrayList<>();
        for (int i = from; i <= to; i++) {
            listDay.add(i);
        }
        
        ProductDAO pd = new ProductDAO();
        List<Product> listProduct = pd.getTop4Product();
        request.setAttribute("year", year);
        request.setAttribute("month", month);
        request.setAttribute("startDay", from);
        request.setAttribute("endDay", to);
        
        
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listRevenue", listRevenue);
        request.setAttribute("listDay", listDay);
        request.getRequestDispatcher("MKT_Dashboard_Chart.jsp").forward(request, response);
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
