///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package controller;
//
////import dal.MyOrderDAO;
//import dal.ProductDAO;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.SQLException;
//import java.util.List;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import model.User;
//import model.order.MyOrder;
//import model.product.Product;
//
///**
// *
// * @author dungc
// */
//@WebServlet(name = "DeleteOrderServlet", urlPatterns = {"/delete"})
//public class DeleteOrderServlet extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet DeleteOrderServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet DeleteOrderServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            String ID = request.getParameter("id");
//            MyOrderDAO dao = new MyOrderDAO();
//            dao.delete(ID);
//            String indexPage = request.getParameter("index");
//            if (indexPage == null) {
//                indexPage = "1";
//            }
//            int index = Integer.parseInt(indexPage);
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
//            String id = U.getId() + "";
//            List<MyOrder> list = dao.pagingOrders(id,index);
//            request.setAttribute("listO", list);
//            request.setAttribute("listP", listP);
//            request.getRequestDispatcher("order.jsp").forward(request, response);
//        } catch (SQLException ex) {
//            Logger.getLogger(DeleteOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
