/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.SendEmail;
import model.User;

/**
 *
 * @author HP
 */
@WebServlet(name = "ResetServlet", urlPatterns = {"/reset"})
public class ResetServlet extends HttpServlet {

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
            out.println("<title>Servlet ResetServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetServlet at " + request.getContextPath() + "</h1>");
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
        String email = request.getParameter("email");
        UsersDAO dao = new UsersDAO();
        List<User> list = dao.getAll();
        for (User users : list) {
            if (users.getEmail().equalsIgnoreCase(email)) {
                try {
                    SendEmail SE = new SendEmail();
                    String otp = SE.sendEmail(email);
                    UsersDAO udao = new UsersDAO();
                    udao.resetPassword(otp, email);
                    HttpSession session = request.getSession();
                    session.setAttribute("email", email);
                    response.sendRedirect("login.jsp");
                    return;
                } catch (MessagingException ex) {
                    Logger.getLogger(ResetServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        String text = "Your email doesn't exits";
        request.setAttribute("alert", text);
        request.getRequestDispatcher("reset.jsp").forward(request, response);
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
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        if (!password.equalsIgnoreCase(repassword)) {
            String alert = "The password and repassword doesn't match";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("confirm_reset.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");
            UsersDAO dao = new UsersDAO();
            dao.resetPassword(password, email);
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
