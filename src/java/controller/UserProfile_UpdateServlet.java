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
import model.Role;
import model.User;

/**
 *
 * @author hophu
 */
public class UserProfile_UpdateServlet extends HttpServlet {

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
            out.println("<title>Servlet UserProfile_UpdateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserProfile_UpdateServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public String checkString(String value, String regex) {
        if (!value.matches(regex)) {
            return null;
        }
        return value;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO d = new AdminDAO();
        HttpSession session = request.getSession();
        User u1 = (User) session.getAttribute("user");
        String id_raw = (String) request.getAttribute("iduser");
        int id = 0;
        try {
            id = Integer.parseInt(id_raw);
        } catch (NumberFormatException e) {
            e.getMessage();
        }
        User u = d.getUserByID(u1.getId());
        request.setAttribute("UserTemp", u);
//        PrintWriter out = response.getWriter();
//        out.print(id);
        request.getRequestDispatcher("infor.jsp").forward(request, response);
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
        AdminDAO d = new AdminDAO();
        String fname = request.getParameter("fname");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String name = request.getParameter("uname");

        HttpSession session = request.getSession();
        User u1 = (User) session.getAttribute("UserTemp");
        String avatar = request.getParameter("photo");
        if (avatar == null || avatar.trim().length() == 0) {
            avatar = u1.getAvatar();
        }
        User u = new User(u1.getId(), name, u1.getPass(), fname, avatar, address, dob, u1.isGender(), email, phone, u1.getRole(), u1.getUstatusId());
        d.update(u);
        session.setAttribute("UserTemp", u);
        request.getRequestDispatcher("user_profile_detail.jsp").forward(request, response);
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
