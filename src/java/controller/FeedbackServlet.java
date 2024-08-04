/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.FeedbackDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.order.OrderDetail;
import model.product.ProductDetail;

/**
 *
 * @author hophu
 */
public class FeedbackServlet extends HttpServlet {

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
            out.println("<title>Servlet FeedbackServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedbackServlet at " + request.getContextPath() + "</h1>");
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
        //vietnamesse
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        //vietnamese
        HttpSession session = request.getSession();
        String detail_raw = request.getParameter("id");
        String od=request.getParameter("od");
        User U = (User) session.getAttribute("user");
        int detailID = 0;
        if (detail_raw != null) {
            detailID = Integer.parseInt(detail_raw);
        }
        OrderDAO ode=new OrderDAO();
        OrderDetail detail=ode.getOrderDetailByID(Integer.parseInt(od));
        ProductDAO d = new ProductDAO();
        ProductDetail dt = d.getProductDetailByID(detailID);
        request.setAttribute("detail", detail);
        request.setAttribute("detailID", dt);
        request.getRequestDispatcher("feedback.jsp").forward(request, response);
//        SendEmail SE = new SendEmail();
//        try {
//            SE.sendEmail(U.getEmail());
//            response.sendRedirect("thankyou.jsp");
//        } catch (MessagingException ex) {
//            Logger.getLogger(FeedbackServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
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
        //vietnamesse
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        //vietnamese
        HttpSession session = request.getSession();
        User U = (User) session.getAttribute("user");
        String detailID = request.getParameter("detailID");
        String detail_raw = request.getParameter("id");
        String comment = request.getParameter("comment");
        String rate = request.getParameter("star");
        
        FeedbackDAO dao = new FeedbackDAO();
        if (detailID != null && comment != null && rate != null && detail_raw!=null) {
            dao.insert(U, Integer.parseInt(detailID), comment, Integer.parseInt(rate),Integer.parseInt(detail_raw));
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    
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
