/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.product.Product;

/**
 *
 * @author hophu
 */
public class InsertProductServlet extends HttpServlet {

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
            out.println("<title>Servlet InsertProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertProductServlet at " + request.getContextPath() + "</h1>");
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
        //response.sendRedirect("insertproduct.jsp");
        request.getRequestDispatcher("insertproduct.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String image = request.getParameter("image");
        String desc = request.getParameter("desc");
        String cate = request.getParameter("cate");
        String create = request.getParameter("create");
        String isActive_raw = request.getParameter("isActive");
        String isSale_raw = request.getParameter("isSale");
        String discount = request.getParameter("discount");
        ProductDAO pd = new ProductDAO();

        Product p = pd.productID();
        int id = p.getProductID();
        String size38 = request.getParameter("size38");
        String size39 = request.getParameter("size39");
        String size40 = request.getParameter("size40");
        String size41 = request.getParameter("size41");
        String size42 = request.getParameter("size42");
        String size43 = request.getParameter("size43");
        String color = request.getParameter("color");

        if (size38.split("").length > 1) {
                    if (Integer.parseInt(size38) > 0) {
                        pd.insertProductDetail(id, 1, Integer.parseInt(size38), Integer.parseInt(color));
//                    out.println();
//                    out.println(id);
//                    out.println(Integer.parseInt(size38));
//                    out.println(Integer.parseInt(color));
                    }
                }

                if (size39.split("").length > 1) {
                    if (Integer.parseInt(size39) > 0) {
                        pd.insertProductDetail(id, 2, Integer.parseInt(size39), Integer.parseInt(color));
//                    out.println();
//                    out.println(id);
//                    out.println(Integer.parseInt(size39));
//                    out.println(Integer.parseInt(color));
                    }

                }
//
                if (size40.split("").length > 1) {
                    if (Integer.parseInt(size40) > 0) {
                        pd.insertProductDetail(id, 3, Integer.parseInt(size40), Integer.parseInt(color));
//                    out.println();
//                    out.println(id);
//                    out.println(Integer.parseInt(size40));
//                    out.println(Integer.parseInt(color));
                    }
                }
////            
                if (size41.split("").length > 1) {
                    if (Integer.parseInt(size41) > 0) {
                        pd.insertProductDetail(id, 4, Integer.parseInt(size41), Integer.parseInt(color));
//                    out.println();
//                    out.println(id);
//                    out.println(Integer.parseInt(size41));
//                    out.println(Integer.parseInt(color));
                    }
                }

                if (size42.split("").length > 1) {
                    if (Integer.parseInt(size42) > 0) {
                        pd.insertProductDetail(id, 5, Integer.parseInt(size42), Integer.parseInt(color));
//                    out.println();
//                    out.println(id);
//                    out.println(Integer.parseInt(size42));
//                    out.println(Integer.parseInt(color));
                    }
                }
////            
                if (size43.split("").length > 1) {
                    if (Integer.parseInt(size43) > 0) {
                        pd.insertProductDetail(id, 6, Integer.parseInt(size43), Integer.parseInt(color));
//                    out.println();
//                    out.println(id);
//                    out.println(Integer.parseInt(size43));
//                    out.println(Integer.parseInt(color));
                    }
                }
                double sum = Double.parseDouble(size38)+Double.parseDouble(size39)+
                Double.parseDouble(size40)+Double.parseDouble(size41)+
                Double.parseDouble(size42)+Double.parseDouble(size43);
        if (name.split("").length > 1 && Double.parseDouble(price) > 0 && image.split("").length > 1
                && desc.split("").length > 1 && Double.parseDouble(discount) >= 0 && Double.parseDouble(discount) <= 1) //Có giá trị

        try {
            PrintWriter out = response.getWriter();
            double discount1 = Double.parseDouble(discount);
            if (name.split("").length > 1 && Double.parseDouble(price) > 0 && image.split("").length > 1
                    && desc.split("").length > 1 && discount1 >= 0 && discount1 <= 1) //Có giá trị
            {
                pd.insertProduct(name, Double.parseDouble(price), image, desc, cate, sum, discount, create, isActive_raw, isSale_raw);

                

                response.sendRedirect("listproduct");
            } else {
            request.setAttribute("errorProduct", "Please complete all information");
            request.getRequestDispatcher("insertproduct.jsp").forward(request, response);
            }

        } catch (Exception e) {
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
