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
import model.product.Category;
import model.product.Product;

/**
 *
 * @author hophu
 */
public class ListProductServlet extends HttpServlet {

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
            out.println("<title>Servlet ListProductServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListProductServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        String txt = request.getParameter("txt");
        String type_raw = request.getParameter("type");
        String cate_raw = request.getParameter("cateID");
        ProductDAO pd = new ProductDAO();
        
        List<Category> list = pd.getAllCate();
        request.setAttribute("listC", list);
        
        if (txt == null && type_raw == null && cate_raw == null) {
            List<Product> list1 = pd.listProductIter3();
            int page, size, num;
            int numberpage = 5;
            size = list1.size();
            num = (size % 5 == 0 ? (size / 5) : ((size / 5)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numberpage;
            end = Math.min(page * numberpage, size);
            List<Product> listIter3 = pd.getListByPage(list1, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("listIter3", listIter3);
        }

        if (txt != null) {
            List<Product> list2 = pd.searchProductIter3(txt);
            int page, size, num;
            int numberpage = 5;
            size = list2.size();
            num = (size % 5 == 0 ? (size / 5) : ((size / 5)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start1, end1;
            start1 = (page - 1) * numberpage;
            end1 = Math.min(page * numberpage, size);
            List<Product> listsearch = pd.getListByPage(list2, start1, end1);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("txt", txt);
            request.setAttribute("listIter3", listsearch);
        }
        
        if (cate_raw != null) {
            try {
                int cate = Integer.parseInt(cate_raw);
                List<Category> listC = pd.getAllCate();
                List<Product> list3 = pd.getProductByCateIDIter3(cate);
                int page, size, num;
                int numberpage = 5;
                size = list3.size();
                num = (size % 5 == 0 ? (size / 5) : ((size / 5)) + 1);
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start1, end1;
                start1 = (page - 1) * numberpage;
                end1 = Math.min(page * numberpage, size);
                List<Product> listcate = pd.getListByPage(list3, start1, end1);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("cateID", cate);
                request.setAttribute("listIter3", listcate);  
            } catch (Exception e) {
            }   
        }

        if (type_raw != null) {
            int type = Integer.parseInt(type_raw);
            List<Product> list4 = pd.sortProductIter3(type);
            int page, size, num;
            int numberpage = 5;
            size = list4.size();
            num = (size % 5 == 0 ? (size / 5) : ((size / 5)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start1, end1;
            start1 = (page - 1) * numberpage;
            end1 = Math.min(page * numberpage, size);
            List<Product> listSort = pd.getListByPage(list4, start1, end1);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("type", type);
            request.setAttribute("listIter3", listSort);

        }
        request.getRequestDispatcher("listproduct.jsp").forward(request, response);
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
