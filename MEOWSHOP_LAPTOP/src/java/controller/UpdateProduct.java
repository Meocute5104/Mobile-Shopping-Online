/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BrandDAO;
import dal.ColorDAO;
import dal.CommandDAO;
import dal.ProductColorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;
import model.Brand;
import model.Color;
import model.Command;
import model.ProductColor;

/**
 *
 * @author MSII
 */
@WebServlet(name = "UpdateProduct", urlPatterns = {"/updateproduct"})
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

public class UpdateProduct extends HttpServlet {

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
        String action = request.getParameter("action");
        String id_raw = request.getParameter("id");
        int id = Integer.parseInt(id_raw);
        ProductColorDAO pcD = new ProductColorDAO();
        if (action.equals("delete")) {
            pcD.delete(id);
            request.getRequestDispatcher("productmanager").forward(request, response);
        }
        if (action.equals("update")) {
            BrandDAO bD = new BrandDAO();
            List<Brand> list = bD.getAll();
            request.setAttribute("brand", list);

            ColorDAO cD = new ColorDAO();
            List<Color> list2 = cD.getAll();
            request.setAttribute("color", list2);

            CommandDAO comD = new CommandDAO();
            List<Command> list3 = comD.getAll();
            request.setAttribute("command", list3);
            ProductColor p = pcD.getProductColorById(id);
            request.setAttribute("product", p);
            request.getRequestDispatcher("updateproduct.jsp").forward(request, response);
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
        String ProductID = request.getParameter("ProductID");
        String ProductName = request.getParameter("ProductName");
        int Brand_id = Integer.parseInt(request.getParameter("Brand_id"));
        int Command_id = Integer.parseInt(request.getParameter("Command_id"));
        float ScreenSize = Float.parseFloat(request.getParameter("ScreenSize"));
        int ScreenSize_type = Integer.parseInt(request.getParameter("ScreenSize_type"));
        String CPU = request.getParameter("CPU");
        int CPU_type = Integer.parseInt(request.getParameter("CPU_type"));
        String RAM = request.getParameter("RAM");
        int RAM_type = Integer.parseInt(request.getParameter("RAM_type"));
        String Graphics = request.getParameter("Graphics");
        int Graphics_type = Integer.parseInt(request.getParameter("Graphics_type"));
        int Price = Integer.parseInt(request.getParameter("Price"));
        Date ReleaseDate = Date.valueOf(request.getParameter("ReleaseDate"));
        String Description = request.getParameter("Description");
        int StockQuantity = Integer.parseInt(request.getParameter("StockQuantity"));
        String Warranty = request.getParameter("Warranty");
        int Discount = Integer.parseInt(request.getParameter("Discount"));
        int color_id = Integer.parseInt(request.getParameter("color_id"));

        int pcid = Integer.parseInt(request.getParameter("id"));

        ProductColorDAO pcD = new ProductColorDAO();
        pcD.update(ProductID, ProductName, Brand_id, Command_id, ScreenSize, ScreenSize_type, CPU, CPU_type, RAM, RAM_type, Graphics, Graphics_type, Price, ReleaseDate, Description, StockQuantity, Warranty, Discount, color_id, pcid);
        response.sendRedirect("home");
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
