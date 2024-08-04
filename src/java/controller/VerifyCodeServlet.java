/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author hophu
 */
public class VerifyCodeServlet extends HttpServlet {

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
             HttpSession session = request.getSession();
             
            User user= (User) session.getAttribute("authcode");
            String verifyCode =(String) session.getAttribute("verifyCode");
            String code = request.getParameter("authcode");
            
            String fname =(String) session.getAttribute("fullname");
            String uname =(String) session.getAttribute("username");
            String email = (String) session.getAttribute("email");
            String pass =(String) session.getAttribute("password");
            
            if(code.equals(verifyCode)){
                AdminDAO d = new AdminDAO();
                d.registerAccount(fname, uname, email, pass);
//                String pass = (String)session.getAttribute("password");
//                String username = (String)session.getAttribute("username");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }else{
                out.println("Incorrect verification code");
            }
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
