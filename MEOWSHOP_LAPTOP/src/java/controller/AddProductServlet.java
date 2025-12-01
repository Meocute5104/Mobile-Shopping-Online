/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BrandDAO;
import dal.ColorDAO;
import dal.CommandDAO;
import dal.ProductColorDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;
import model.Brand;
import model.Color;
import model.Command;
import model.Product;
import java.sql.Date;
import model.ProductColor;
/**
 *
 * @author MSII
 */
@WebServlet(name = "AddProductServlet", urlPatterns = {"/addproduct"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AddProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BrandDAO bD = new BrandDAO();
        List<Brand> list = bD.getAll();
        request.setAttribute("brand", list);
        
        ColorDAO cD = new ColorDAO();
        List<Color> list2 = cD.getAll();
        request.setAttribute("color", list2);
        
        CommandDAO comD = new CommandDAO();
        List<Command> list3 = comD.getAll();
        request.setAttribute("command", list3);
        
        request.getRequestDispatcher("addproduct.jsp").forward(request, response);
    }

    private static final String UPLOAD_DIRECTORY = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Thiết lập encoding để xử lý tiếng Việt
        request.setCharacterEncoding("UTF-8");

        // Đường dẫn lưu trữ file upload
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            // Lấy các tham số từ form
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
            
            // Lấy các tham số khác...
            
            // Xử lý file ImageLaptop
            Part imageLaptopPart = request.getPart("ImageLaptop");
            String imageLaptopName = extractFileName(imageLaptopPart);
            String imageLaptopPath = UPLOAD_DIRECTORY + "/" + imageLaptopName;
            imageLaptopPart.write(uploadPath + File.separator + imageLaptopName);

            // Xử lý file image
            Part imagePart = request.getPart("image");
            String imageName = extractFileName(imagePart);
            String imagePath = UPLOAD_DIRECTORY + "/" + imageName;
            imagePart.write(uploadPath + File.separator + imageName);

            ProductColorDAO pcD = new ProductColorDAO();
            pcD.addProduct(ProductID, ProductName, Brand_id, Command_id, ScreenSize, ScreenSize_type, CPU, CPU_type, RAM, RAM_type, Graphics, Graphics_type, Price, ReleaseDate, Description, StockQuantity, imageLaptopPath, Warranty, Discount, color_id, imagePath);
            
            // Sau khi có dữ liệu, bạn có thể lưu vào database
            // Ví dụ:
            // Product product = new Product(ProductID, ProductName, ..., imageLaptopPath, imagePath);
            // ProductDAO.save(product);
            String mess = "Add product thanh cong";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("addproduct.jsp").forward(request, response);
            //response.getWriter().println("Thêm sản phẩm mới thành công." + imageLaptopPath);
        } catch (Exception ex) {
            response.getWriter().println("Có lỗi xảy ra: " + ex.getMessage());
        }
    }

    private String extractFileName(Part part) {
        // Trích xuất tên file từ header
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                String fileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                return fileName;
            }
        }
        return "";
    }
}
