/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BrandDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Brand;
import model.Product;

/**
 *
 * @author MSII
 */
@WebServlet(name = "ListServlet", urlPatterns = {"/laptoplist"})
public class ListServlet extends HttpServlet {

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
            out.println("<title>Servlet ListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListServlet at " + request.getContextPath() + "</h1>");
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
        
        ArrayList<String> priceList = new ArrayList<>();
        priceList.add("Duới 10 triệu");
        priceList.add("Từ 10 - 20 triệu");
        priceList.add("Từ 20 - 30 triệu");
        priceList.add("Từ 30 - 40 triệu");
        priceList.add("Từ 40 - 50 triệu");
        priceList.add("Trên 50 triệu");
        request.setAttribute("priceList", priceList);
        
        ArrayList<String> screenSize = new ArrayList<>();
        screenSize.add("Duới 14 inch");
        screenSize.add("Từ 14 - 15 inch");
        screenSize.add("Từ 15 - 17 inch");
        request.setAttribute("sreenSize", screenSize);
        
        BrandDAO br = new BrandDAO();
        ArrayList<Brand> list1 = br.getAll();
        request.setAttribute("brandList", list1);

        String op_raw = request.getParameter("sort");
        int op = 0;
        if (op_raw != null) {
            op = Integer.parseInt(op_raw);
        }
        request.setAttribute("op", op);

        String brand_raw = request.getParameter("brand");
        int brandId = 1;
        if (brand_raw != null) {
            brandId = Integer.parseInt(brand_raw);
        }else{
            response.sendRedirect("laptop");
        }
        request.setAttribute("brandId", brandId);

        String brandName = "";
        for(Brand b : list1){
            if(b.getId() == brandId){
                brandName = b.getName();
            }
        }
        request.setAttribute("brandName", brandName);
        
        String price_raw = request.getParameter("price");
        int priceId = 0;
        if (price_raw != null) {
            priceId = Integer.parseInt(price_raw);
        }
        request.setAttribute("priceId", priceId);

        String screen_raw = request.getParameter("screen");
        int screenId = 0;
        if (screen_raw != null) {
            screenId = Integer.parseInt(screen_raw);
        }
        request.setAttribute("screenId", screenId);
        
        ProductDAO pD = new ProductDAO();
        
        //Show san pham
        ArrayList<Product> list = pD.getAllByBrand(pD.getTopAll(brandId, priceId, screenId, op), brandId);
        int total = list.size();
        request.setAttribute("total", total);
        int page, numPerPage = 8;
        int size = list.size();
        int num = (size % numPerPage == 0) ? (size/numPerPage) : (size/numPerPage +1);
        String xPage = request.getParameter("page");
        if(xPage == null){
            page = 1;
        } else {
            page = Integer.parseInt(xPage);
        }
        int start, end;
        start = (page-1)*numPerPage;
        end = Math.min(page * numPerPage, size);
        ArrayList<Product> listPage = pD.getListByPage(list, start, end);
        request.setAttribute("productList", listPage);
        request.setAttribute("page", page);
        request.setAttribute("num", num);

        request.getRequestDispatcher("laptoplist.jsp").forward(request, response);

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
