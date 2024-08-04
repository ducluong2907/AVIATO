    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AdminDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.product.ProductDetail;

/**
 *
 * @author hophu
 */
public class CompleteCartServlet extends HttpServlet {

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
            out.println("<title>Servlet CompleteCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CompleteCartServlet at " + request.getContextPath() + "</h1>");
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
        AdminDAO ad = new AdminDAO();
        Cookie arr[] = request.getCookies();
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        List<ProductDetail> list = new ArrayList<>();
        String fname = request.getParameter("fullname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        ProductDAO dao = new ProductDAO();
        for (Cookie o : arr) {
            if (o.getName().equals("id")) {
                String txt[] = o.getValue().split(",");
                for (String s : txt) {
                    if (!s.isEmpty()) {
                        try {
                            int id = Integer.parseInt(s);
                            list.add(dao.getProductDetailByID(id));
                        } catch (NumberFormatException e) {
                            e.getMessage();
                        }
                    }
                }
            }
        }
        for (int i = 0; i < list.size(); i++) {
            int count = 0;
            for (int j = i + 1; j < list.size(); j++) {
                if (list.get(i).getId() == list.get(j).getId()) {
                    count++;
                    list.remove(j);
                    j--;
                    list.get(i).getProduct().setAmount(count);
                }
            }
        }
        double fee = 0;
        for (ProductDetail o : list) {
            fee = fee + o.getProduct().getAmount() * (o.getProduct().getProductPrice() - o.getProduct().getProductPrice() * o.getProduct().getDiscount());
        }
        OrderDAO od = new OrderDAO();
        int a = od.addOrder(u.getId(), fee, list);
        ad.sendEmail(u);
        Cookie c = new Cookie("id", "");
        c.setMaxAge(0);
        response.addCookie(c);

//list.clear();
        response.sendRedirect("confirmPage.jsp");
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
