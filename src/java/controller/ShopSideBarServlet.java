/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
import model.product.Brand;
import model.product.Category;
import model.product.Product;
import model.product.ProductDetail;

/**
 *
 * @author Long
 */
public class ShopSideBarServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShopSideBarServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopSideBarServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        //Sidebar
        ProductDAO pd = new ProductDAO();
        String cateID_raw = request.getParameter("cateID");
        String brandID_raw = request.getParameter("brandID");
        String priceF_raw = request.getParameter("priceF");
        String priceT_raw = request.getParameter("priceT");
        String order = request.getParameter("order");
        String txt_raw = request.getParameter("txt");

        //Trường hợp chưa chọn cateID & brandID & txt & sort & price
        if (cateID_raw == null && brandID_raw == null && priceF_raw == null && priceT_raw == null && txt_raw == null) {
            List<Product> listPS1 = pd.getProductShop();
            int page, size, num;
            int numberpage = 8;
            size = listPS1.size();
            num = (size % 8 == 0 ? (size / 8) : ((size / 8)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numberpage;
            end = Math.min(page * numberpage, size);
            List<Product> listShop1 = pd.getListByPage(listPS1, start, end);
            request.setAttribute("listShop", listShop1);
            List<Category> listC1 = pd.listCate();
            request.setAttribute("listC", listC1);
            List<Brand> listB1 = pd.listBrand();
            request.setAttribute("listB", listB1);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
        } //Trường hợp chọn cateID và brandID
        else {
//            request.setAttribute("cateID", cateID_raw);
//            request.setAttribute("brandID", brandID_raw);
//            request.setAttribute("priceF", priceF_raw);
//            request.setAttribute("priceT", priceT_raw);
//            request.setAttribute("desc", desc);
//            request.setAttribute("asc", asc);
//            request.setAttribute("txt", txt);
            List<Product> listPS2 = pd.SideBarProduct(cateID_raw, brandID_raw, priceF_raw, priceT_raw, order);
            int page, size, num;
            int numberpage = 8;
            size = listPS2.size();
            num = (size % 8 == 0 ? (size / 8) : ((size / 8)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numberpage;
            end = Math.min(page * numberpage, size);
            List<Product> listShop2 = pd.getListByPage(listPS2, start, end);
            request.setAttribute("listShop", listShop2);

            request.setAttribute("cateID", cateID_raw);
            request.setAttribute("brandID", brandID_raw);
            request.setAttribute("priceF", priceF_raw);
            request.setAttribute("priceT", priceT_raw);
            request.setAttribute("order", order);
//            request.setAttribute("txt", txt_raw);

            List<Category> listC2 = pd.listCate();
            request.setAttribute("listC", listC2);
            List<Brand> listB2 = pd.listBrand();
            request.setAttribute("listB", listB2);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
        }

        //Search
        String txt = request.getParameter("txt");
        if (txt != null) {
            List<Product> listSBS = pd.searchSideBarShop(txt);
            int page, numberpage = 8;
            int size = listSBS.size();
            int num = (size % 8 == 0 ? (size / 8) : ((size / 8)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numberpage;
            end = Math.min(page * numberpage, size);
            List<Product> list1 = pd.getListByPage(listSBS, start, end);

            request.setAttribute("listShop", list1);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("txt", txt);
        }
        Cookie arr[] = request.getCookies();
        PrintWriter out = response.getWriter();
        List<ProductDetail> list = new ArrayList<>();
        ProductDAO dao = new ProductDAO();
        for (Cookie o : arr) {
            if (o.getName().equals("id")) {
                String txt1[] = o.getValue().split("-");
                for (String s : txt1) {
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
        double ship = 10.0;
        double total = 0;
        for (ProductDetail o : list) {
            total = total + o.getProduct().getAmount() * (o.getProduct().getProductPrice() - o.getProduct().getProductPrice() * o.getProduct().getDiscount()) + ship;
        }
        request.setAttribute("listCart", list);
        request.setAttribute("total", total);
        request.setAttribute("ship", ship);
        request.setAttribute("vat", 0.1 * total);
        request.setAttribute("sum", 1.1 * total);
        request.getRequestDispatcher("shop-sidebar.jsp").forward(request, response);

    }

    private boolean ischeck(int d, int[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i] == d) {
                    return true;
                }

            }
        }
        return false;
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
