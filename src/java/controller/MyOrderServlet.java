/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.order.MyOrder;
import model.order.Order;
import model.order.OrderDetail;
import model.product.Product;

/**
 *
 * @author HP
 */
@WebServlet(name = "MyOrderServlet", urlPatterns = {"/myorder"})
public class MyOrderServlet extends HttpServlet {

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
            out.println("<title>Servlet MyOrdersServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyOrdersServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User U = (User) session.getAttribute("user");
        try {
            String indexPage = request.getParameter("index");
            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);
            OrderDAO dao = new OrderDAO();
            ProductDAO Pdao = new ProductDAO();
            List<Product> listP = Pdao.getAll();
            int count = dao.getTotalOrderByUserID(U.getId());
            int endPage = count / 6;
            if (count % 6 != 0) {
                endPage++;
            }
            request.setAttribute("tag", index);
            request.setAttribute("endP", endPage);
            List<Order> list = dao.pagingOrders(U.getId(), index);
            PrintWriter out = response.getWriter();
//            out.print(U.getId());
            request.setAttribute("listO", list);
            request.setAttribute("listP", listP);
//            for (int i = 0; i < list.size(); i++) {
//                out.println("================");
//                for (OrderDetail object : list.get(i).getListOfOrder()) {
//                    out.println(object.toString());
//                }
//            }
            request.getRequestDispatcher("order.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(MyOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
//        try {
//            String text = request.getParameter("search");
//            String indexPage = request.getParameter("index");
//            if (indexPage == null) {
//                indexPage = "1";
//            }
//            int index = Integer.parseInt(indexPage);
//            MyOrderDAO dao = new MyOrderDAO();
//            ProductDAO Pdao = new ProductDAO();
//            List<Product> listP = Pdao.getAll();
//            int count = dao.getTotalOrder();
//            int endPage = count / 6;
//            if (count % 6 != 0) {
//                endPage++;
//            }
//            request.setAttribute("tag", index);
//            request.setAttribute("endP", endPage);
//            HttpSession session = request.getSession();
//            User U = (User) session.getAttribute("user");
//            //String id = U.getId() + "";
//            List<MyOrder> list = dao.getAllName(text);
//            request.setAttribute("listO", list);
//            request.setAttribute("listP", listP);
//            request.getRequestDispatcher("myorder.jsp").forward(request, response);
//        } catch (SQLException ex) {
//            Logger.getLogger(MyOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
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
