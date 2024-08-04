package admin.controll.user;

import dal.ControllUser;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Role;
import model.User;

public class ListUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListUser at " + request.getContextPath() + "</h1>");
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
        //xu li phan trang
        ControllUser d = new ControllUser();
        List<Role> listRole = d.getRole();
        int page = 1;//default
        String pageGet = request.getParameter("page");
        if (pageGet != null) {
            page = Integer.parseInt(pageGet);
        }
        int pageSize = 6;

        //xu li filter
        int gender = -1, roleName = -1, isActive = -1;
        String gender_raw = request.getParameter("gender");
        String roleName_raw = request.getParameter("roleName");
        String isActive_raw = request.getParameter("status");

        if (gender_raw != null || roleName_raw != null || isActive_raw != null) {
            gender = Integer.parseInt(gender_raw);
            roleName = Integer.parseInt(roleName_raw);
            isActive = Integer.parseInt(isActive_raw);
        }
        int[] ar = {gender, roleName, isActive};
        String key = "";
        if (request.getParameter("key") != null) {
            key = request.getParameter("key");
        }
        //dieu kien sort
        String method = request.getParameter("upOrDown");
        int sort = 0;
        if (method != null) {
            sort = Integer.parseInt(method);
        } else {
            sort = 1;
        }
        List<User> takeAmmountList = d.forGetList(ar, sort,key);
        int totalUser = d.amountUser(takeAmmountList);
        int totalPage = totalUser / pageSize;
        if (totalUser % pageSize != 0 && totalUser > 6) {
            totalPage += 1;
        } else if (totalUser <= 6) {
            totalPage = 1;
        }
        
        List<User> list = d.getList(ar, sort, page, pageSize, key);

        request.setAttribute("gender", gender);
        request.setAttribute("roleName", roleName);
        request.setAttribute("status", isActive);//status
        request.setAttribute("upOrDown", sort);
        request.setAttribute("listUser", list);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("listRole", listRole);
        request.setAttribute("key", key);
        request.setAttribute("page", page);
        request.getRequestDispatcher("admin/controll_User/listuser2.jsp").forward(request, response);
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
