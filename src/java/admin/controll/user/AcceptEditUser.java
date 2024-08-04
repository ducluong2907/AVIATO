/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.controll.user;

import dal.ControllUser;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author phung
 */
public class AcceptEditUser extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AcceptEditUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AcceptEditUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        ControllUser d = new ControllUser();
        String id = request.getParameter("id");
        String role = request.getParameter("role");
        String status = request.getParameter("status");
        PrintWriter out = response.getWriter();
        if (id != null && role != null && status != null) {
            int idReal = Integer.parseInt(id);
            int roleReal=Integer.parseInt(role);
            int statusReal=Integer.parseInt(status);
            d.UpdateUser(idReal, roleReal, statusReal);
            User x=d.getUser(idReal);
            String mess="Update Successfull";
            request.setAttribute("account", x);
            request.setAttribute("id", idReal);
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("admin/controll_User/adminEditProfile.jsp").forward(request, response);
        } else {
            out.print("HAHA");
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
