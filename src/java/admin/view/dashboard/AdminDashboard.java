/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.view.dashboard;

import dal.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import model.order.Order;
import model.product.Product;
import model.product.ProductDetail;

public class AdminDashboard extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminDashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminDashboard at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //vietnamesse
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        //vietnamese
        MarketingDAO m = new MarketingDAO();
        OrderDAO d = new OrderDAO();
        ProductDAO pd = new ProductDAO();

        //xi li date
        String realFrom = "";
        String realTo = "";
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        if ((checkNull(from_raw) && checkNull(to_raw) == false) || (checkNull(from_raw) == false && checkNull(to_raw))) {
            request.setAttribute("mess", "Need to fill both From and To Date");
            request.getRequestDispatcher("admin/controll_User/dashboard2.jsp").forward(request, response);
        } else if (from_raw != null && to_raw != null) {
            if (checkDate(from_raw, to_raw)) {
                request.setAttribute("mess", "From Date must less than To Date");
                request.getRequestDispatcher("admin/controll_User/dashboard2.jsp").forward(request, response);
            } else {
                realFrom = from_raw;
                realTo = to_raw;
                List<Product> listProduct = pd.getTop5Product(realFrom, realTo);
                request.setAttribute("ListProduct", listProduct);

                //user
                List<User> listUser = d.TopCustomerBuyMost(realFrom, realTo);
                List<Integer> forListUser = d.ListIntForChartCus(realFrom, realTo);
                int totalSuccess = d.TotalOrderSuccess(realFrom, realTo);
                int totalShop = d.TotalOrderShop(realFrom, realTo);
                request.setAttribute("Forfrom", from_raw);
                request.setAttribute("Forto", to_raw);
                request.setAttribute("totalSuccess", totalSuccess);
                request.setAttribute("totalShop", totalShop);
                request.setAttribute("listUser", listUser);
                request.setAttribute("chartForCus", forListUser);
                request.getRequestDispatcher("admin/controll_User/dashboard2.jsp").forward(request, response);
            }
        }
        List<Product> listProduct = pd.getTop5Product(realFrom, realTo);
        request.setAttribute("ListProduct", listProduct);

        //user
        List<User> listUser = d.TopCustomerBuyMost(realFrom, realTo);
        List<Integer> forListUser = d.ListIntForChartCus(realFrom, realTo);
        int totalSuccess = d.TotalOrderSuccess(realFrom, realTo);
        int totalShop = d.TotalOrderShop(realFrom, realTo);
        request.setAttribute("totalSuccess", totalSuccess);
        request.setAttribute("totalShop", totalShop);
        request.setAttribute("listUser", listUser);
        request.setAttribute("chartForCus", forListUser);
        request.getRequestDispatcher("admin/controll_User/dashboard2.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    boolean checkDate(String x, String y) {
        try {
            Date now = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date cp = df.parse(x);
            Date pc = df.parse(y);
            if (cp.compareTo(pc) > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    boolean checkNull(String x) {
        try {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date cp = df.parse(x);
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
