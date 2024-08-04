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
import model.Feedback;
import model.product.Color;
import model.product.ImgOfProduct;
import model.product.Product;
import model.product.ProductDetail;
import model.product.Size;

/**
 *
 * @author phung
 */
public class DetailProductServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DetailProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailProductServlet at " + request.getContextPath() + "</h1>");
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
        
        String getIDProduct = request.getParameter("productID");
        PrintWriter out = response.getWriter();
        ProductDAO d = new ProductDAO();
        //Handle
        int productID = -1;
        if (getIDProduct != null) {
            productID = Integer.parseInt(getIDProduct);
        }
        String getIDColor = request.getParameter("colorID");
        int colorID = 0;
        String getIDSize = request.getParameter("sizeID");
        //toan bo sp match productID
        List<ProductDetail> list = d.getAllProductDetailByID(productID);
        int quantityProduct = 0;
        if (getIDColor != null && getIDSize != null) {
            colorID = Integer.parseInt(getIDColor);
            int size = Integer.parseInt(getIDSize);
            ProductDetail showPage = d.getProductDetailScreen(productID, colorID, size);
            quantityProduct = showPage.getQuantity();
            List<Product> recommendedProduct=d.getTop4Product();
            List<Color> listCL = d.getListColorOfProduct(showPage.getProduct().getProductID());
            List<Size> listSZ = d.getListSizeOfProduct(productID, showPage.getColor().getColorID());
            List<Feedback> listFB = d.getAllFeedbackByID(showPage.getProduct().getProductID());
            List<ImgOfProduct> listIMG = d.getAllImgOfProductDetail(productID, colorID);
            request.setAttribute("showPage", showPage);
            request.setAttribute("recommendedProduct", recommendedProduct);
            request.setAttribute("quantityProduct", quantityProduct);
            request.setAttribute("sizeSendID", size);
            request.setAttribute("productID", productID);
            request.setAttribute("listSZ", listSZ);
            request.setAttribute("listIMG", listIMG);
            request.setAttribute("colorID", colorID);
            request.setAttribute("listFB", listFB);
            request.setAttribute("listCL", listCL);
            request.getRequestDispatcher("detailProduct.jsp").forward(request, response);
        }else{
            ProductDetail showPage = list.get(0);
            int size = showPage.getSize().getSizeID();
            colorID = showPage.getColor().getColorID();
            List<Product> recommendedProduct=d.getTop4Product();
            List<Color> listCL = d.getListColorOfProduct(showPage.getProduct().getProductID());
            List<Size> listSZ = d.getListSizeOfProduct(productID, showPage.getColor().getColorID());
            List<Feedback> listFB = d.getAllFeedbackByID(showPage.getProduct().getProductID());
            List<ImgOfProduct> listIMG = d.getAllImgOfProductDetail(productID, showPage.getColor().getColorID());
            quantityProduct = showPage.getQuantity();
            request.setAttribute("showPage", showPage);
            request.setAttribute("recommendedProduct", recommendedProduct);
            request.setAttribute("quantityProduct", quantityProduct);
            request.setAttribute("sizeSendID", size);
            request.setAttribute("productID", productID);
            request.setAttribute("listSZ", listSZ);
            request.setAttribute("listIMG", listIMG);
            request.setAttribute("colorID", showPage.getColor().getColorID());
            request.setAttribute("listFB", listFB);
            request.setAttribute("listCL", listCL);
            request.getRequestDispatcher("detailProduct.jsp").forward(request, response);
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
    }// </editor-fold>

}
