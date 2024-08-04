/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.product.Product;
import model.product.ProductDetailX;

/**
 *
 * @author hophu
 */
public class UpdateProductServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductServlet at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("productID");
        ProductDAO pd = new ProductDAO();

        List<ProductDetailX> list = pd.getProductDetail(Integer.parseInt(id));
        int s38 = 0, s39 = 0, s40 = 0, s41 = 0, s42 = 0, s43 = 0;
        for (ProductDetailX px : list) {
            if (px.getSizeID() == 1) {
                s38 = px.getQuantity();
            } else if (px.getSizeID() == 2) {
                s39 = px.getQuantity();
            } else if (px.getSizeID() == 3) {
                s40 = px.getQuantity();
            } else if (px.getSizeID() == 4) {
                s41 = px.getQuantity();
            } else if (px.getSizeID() == 5) {
                s42 = px.getQuantity();
            } else if (px.getSizeID() == 6) {
                s43 = px.getQuantity();
            }
        }
        Product product = pd.getProductByIDIter3(id);
        request.setAttribute("product", product);
        request.setAttribute("s38", s38);
        request.setAttribute("s39", s39);
        request.setAttribute("s40", s40);
        request.setAttribute("s41", s41);
        request.setAttribute("s42", s42);
        request.setAttribute("s43", s43);
        request.getRequestDispatcher("updateproduct.jsp").forward(request, response);
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
        String id = request.getParameter("productID");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String image = request.getParameter("image");
        String des = request.getParameter("des");
        String cate = request.getParameter("cate");
        String quantity = request.getParameter("quantity");
        String isActive = request.getParameter("isActive");
        String isSale = request.getParameter("isSale");
        String discount = request.getParameter("discount");
        String size38 = request.getParameter("size38");
        String size39 = request.getParameter("size39");
        String size40 = request.getParameter("size40");
        String size41 = request.getParameter("size41");
        String size42 = request.getParameter("size42");
        String size43 = request.getParameter("size43");
        double price1 = Double.parseDouble(price);
        int sum = Integer.parseInt(size38) + Integer.parseInt(size39) + Integer.parseInt(size40)
                + Integer.parseInt(size41) + Integer.parseInt(size42) + Integer.parseInt(size43);
        ProductDAO pd = new ProductDAO();
        if (size38.split("").length > 1) {
            if (Integer.parseInt(size38) > 0) {
                pd.updateProductDetailX(id, "1", size38);
            } else {
                request.getRequestDispatcher("listproduct").forward(request, response);
            }
        }
        if (size39.split("").length > 1) {
            if (Integer.parseInt(size38) > 0) {
                pd.updateProductDetailX(id, "2", size39);
            } else {
                request.getRequestDispatcher("listproduct").forward(request, response);
            }
        }

        if (size40.split("").length > 1) {
            if (Integer.parseInt(size38) > 0) {
                pd.updateProductDetailX(id, "3", size40);
            } else {
                request.getRequestDispatcher("listproduct").forward(request, response);
            }

        }

        if (size41.split("").length > 1) {
            if (Integer.parseInt(size38) > 0) {
                pd.updateProductDetailX(id, "4", size41);
            } else {
                request.getRequestDispatcher("listproduct").forward(request, response);
            }

        }
        if (size42.split("").length > 1) {
            if (Integer.parseInt(size38) > 0) {
                pd.updateProductDetailX(id, "5", size42);
            } else {
                request.getRequestDispatcher("listproduct").forward(request, response);
            }

        }
        if (size43.split("").length > 1) {
            if (Integer.parseInt(size38) > 0) {
                pd.updateProductDetailX(id, "6", size43);
            } else {
                request.getRequestDispatcher("listproduct").forward(request, response);
            }

        }

        if (name.split("").length > 1 || price1 > 0  || image.split("").length > 1
                || des.split("").length > 1 || Double.parseDouble(discount) > 0 ||  Double.parseDouble(discount) < 1) {
            pd.updateProduct(id, name, price, image, des, cate, sum, isActive, isSale, discount);
        } else {
            response.sendRedirect("listproduct");
        }

        response.sendRedirect("listproduct");
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
