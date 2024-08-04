/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.controll.user;

import dal.ControllUser;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Role;
import model.User;

public class EditUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String x = request.getParameter("id");
        ControllUser d = new ControllUser();
        if (x != null) {
            User user = d.getUser(Integer.parseInt(x));
            if (user.getRole().getRoleID() == 1) {
                request.setAttribute("mess", "Can't not edit Admin");
                List<Role> lr = d.getRole();
                request.setAttribute("user", user);
                request.setAttribute("listRole", lr);
                request.getRequestDispatcher("admin/controll_User/editUser.jsp").forward(request, response);
            } else {
                List<Role> lr = d.getRole();
                request.setAttribute("user", user);
                request.setAttribute("listRole", lr);
                request.getRequestDispatcher("admin/controll_User/editUser.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
