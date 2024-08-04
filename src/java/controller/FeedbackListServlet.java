/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Feedback;
import model.product.Brand;
import model.product.Product;

/**
 *
 * @author hophu
 */
public class FeedbackListServlet extends HttpServlet {

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
            out.println("<title>Servlet FeedbackListServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedbackListServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        //vietnamese

        FeedbackDAO d = new FeedbackDAO();
        String getStatus[] = request.getParameterValues("status");
        String getProductID[] = request.getParameterValues("product");
        String getSort = request.getParameter("sort");
        List<Product> listPro = d.getAllProduct(null);
        List<Brand> listBrand = d.getAllBrand();
        String getBrand[] = request.getParameterValues("brand");
        int page = 1;//default
        String pageGet = request.getParameter("page");
        if (pageGet != null) {
            page = Integer.parseInt(pageGet);
        }
        int pageSize = 10;

        //xu li status feedback
        int forStatus[] = null;
        int strue = 0, sfalse = 1;
        if (getStatus != null) {
            forStatus = new int[getStatus.length];
            for (int i = 0; i < getStatus.length; i++) {
                forStatus[i] = Integer.parseInt(getStatus[i]);
                if (forStatus[i] == 0) {
                    sfalse = 0;
                }
                if (forStatus[i] == 1) {
                    strue = 1;
                }
            }
        }
        //xu li brand
        int forProduct[] = null;
        boolean[] tid = new boolean[listPro.size()];
        boolean[] bid = new boolean[listBrand.size()];
        int forBrand[] = null;
        if (getBrand != null) {
            forBrand = new int[getBrand.length];
            for (int i = 0; i < getBrand.length; i++) {
                forBrand[i] = Integer.parseInt(getBrand[i]);
            }
            //lay sp theo brand
//            listPro=d.getAllProduct(forBrand);
            //xu li productid
            if (getProductID != null) {
                forProduct = new int[getProductID.length];
                for (int i = 0; i < getProductID.length; i++) {
                    forProduct[i] = Integer.parseInt(getProductID[i]);
                }
            }

            //xu li check box brand + product
            for (int i = 0; i < tid.length; i++) {
                if (isCheck(listPro.get(i).getProductID(), forProduct)) {
                    tid[i] = true;
                } else {
                    tid[i] = false;
                }
            }
            for (int i = 0; i < bid.length; i++) {
                if (isCheck(listBrand.get(i).getBrandID(), forBrand)) {
                    bid[i] = true;
                } else {
                    bid[i] = false;
                }
            }
            listPro = d.getAllProduct(forBrand);
        } else {
            listPro = null;
        }
//        
        //xi li rateStar
        String getStars[] = request.getParameterValues("rateStar");
        int forStar[] = null;
//        int listStarsFake[] = {1, 2, 3, 4, 5};
        List<Integer> listStars = new ArrayList<>();
        for (int i = 1; i <= 5; i++) {
            listStars.add(i);
        }
        boolean[] sid = new boolean[5];
        if (getStars != null) {
            forStar = new int[getStars.length];
            for (int i = 0; i < getStars.length; i++) {
                forStar[i] = Integer.parseInt(getStars[i]);
            }
            for (int i = 0; i < sid.length; i++) {
                if (isCheck(listStars.get(i), forStar)) {
                    sid[i] = true;
                } else {
                    sid[i] = false;
                }
            }
        }
        //xu li sort
        int sort = 0;
        if (getSort != null) {
            sort = Integer.parseInt(getSort);
        }
        //xu li search
        String key = "";
        String getKey = request.getParameter("key");
        if (getKey != null) {
            key = getKey;
        }
        int totalF = d.getTotalPageFB(forStatus, forBrand, forProduct, forStar, key);
        int totalPage = totalF / pageSize;
        if (totalF % pageSize != 0 && totalF > 10) {
            totalPage += 1;
        } else if (totalF <= 10) {
            totalPage = 1;
        }

        List<Feedback> list = d.getFeedbackList(forStatus, forBrand, forProduct, forStar, key, sort, page, pageSize);
        request.setAttribute("listBrand", listBrand);
        request.setAttribute("bid", bid);
        request.setAttribute("key", key);
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("listStars", listStars);
        request.setAttribute("sid", sid);
        request.setAttribute("sortCondition", sort);
        request.setAttribute("listPro", listPro);
        request.setAttribute("strue", strue);
        request.setAttribute("sfalse", sfalse);
        request.setAttribute("listF", list);
        request.setAttribute("tid", tid);
        request.getRequestDispatcher("listFeedback.jsp").forward(request, response);
    }
private boolean isCheck(int d, int[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i] == d) {
                    return true;
                }
            }
            return false;
        }
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
