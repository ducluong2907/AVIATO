
package controller;

import dal.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String r = request.getParameter("rem");
        AdminDAO d = new AdminDAO();
        User u = d.getUser(email, pass);
        if (u == null) {
            String er = "username: " + email + " and password: " + pass + " don't exsited!";
            request.setAttribute("error", er);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession(true);
            int role = u.getRole().getRoleID();

            session.setAttribute("user", u);
            Cookie cu = new Cookie("email", email);
            Cookie cp = new Cookie("pass", pass);
            Cookie cr = new Cookie("rem", r);
            if (r == null) {
                cu.setMaxAge(0);
                cp.setMaxAge(0);
                cr.setMaxAge(0);
            } else {
                cu.setMaxAge(24 * 60 * 60);
                cp.setMaxAge(24 * 60 * 60);
                cr.setMaxAge(24 * 60 * 60);
            }
            response.addCookie(cu);
            response.addCookie(cp);
            response.addCookie(cr);
            if (role == 1) {
//                response.sendRedirect("AdminDashboard");
                response.sendRedirect("AdminDashboard");
            } else if(role==2){
                response.sendRedirect("salemng_listorder");
            }
            else if(role == 3){
                response.sendRedirect("saledashboard");
            }
            else if(role ==4){
                response.sendRedirect("listproduct");
            }else {
                response.sendRedirect("home");
            }

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
