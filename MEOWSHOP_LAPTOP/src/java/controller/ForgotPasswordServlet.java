/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import Encrypt.PasswordUtils;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.security.SecureRandom;
import java.sql.SQLException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import model.User;

/**
 *
 * @author MSII
 */
@WebServlet(name = "ForgotPasswordServlet", urlPatterns = {"/forgot"})
public class ForgotPasswordServlet extends HttpServlet {

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
            out.println("<title>Servlet ForgotPasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPasswordServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("forgotpass.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // Cấu hình email SMTP (ví dụ: Gmail)
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";
    private static final String SMTP_USER = "nguyendangkhoa5104@gmail.com"; // Thay bằng email của bạn
    private static final String SMTP_PASSWORD = "dxep fsct zmde lemd"; // Thay bằng mật khẩu email của bạn

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email").trim();

        UserDAO userDAO = new UserDAO();
        try {
            User user = userDAO.checkExist(email);
            if (user == null) {
                // Email không tồn tại
                request.setAttribute("error", "Email không tồn tại trong hệ thống.");
                request.getRequestDispatcher("forgotpass.jsp").forward(request, response);
                return;
            }

            // Tạo mật khẩu mới gồm 6 chữ số
            String newPassword = generateRandomPassword(6);
            String hashedPassword = PasswordUtils.hashPassword(newPassword);

            // Cập nhật mật khẩu mới vào cơ sở dữ liệu
            userDAO.updatePassword(user.getId(), hashedPassword);

            boolean emailSent = sendEmail(email, newPassword);

            if (emailSent) {
                request.setAttribute("error", "Mật khẩu mới đã được gửi vào email của bạn.");
            } else {
                request.setAttribute("error", "Gửi email thất bại. Vui lòng thử lại.");
            }
            request.getRequestDispatcher("forgotpass.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại.");
            request.getRequestDispatcher("forgotpass.jsp").forward(request, response);
        }
    }

    // Phương thức tạo mật khẩu ngẫu nhiên gồm n chữ số
    private String generateRandomPassword(int length) {
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < length; i++) {
            int digit = random.nextInt(10); // 0-9
            sb.append(digit);
        }

        return sb.toString();
    }

    // Phương thức gửi email
    private boolean sendEmail(String toEmail, String newPassword) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true"); // TLS
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);

        // Tạo phiên làm việc với máy chủ email
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USER, SMTP_PASSWORD);
            }
        });

        // Bật chế độ debug
        session.setDebug(true);

        try {
            // Tạo đối tượng MimeMessage
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SMTP_USER, "YourAppName"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(toEmail));
            message.setSubject("Dat lai mat khau from Khoa with love");
            message.setText("Xin chào,\n\n"
                    + "Chung toi da nhan duoc yeu cau dat lai mat khau moi cua ban.\n"
                    + "Mat khau moi la: " + newPassword + "\n\n"
                    + "Vui long dang nhap va thay doi mat khau bao mat tai khoan.\n\n"
                    + "Tran trong,\n"
                    + "Nguyen Dang Khoa");

            // Gửi email
            Transport.send(message);
            System.out.println("Email đã được gửi thành công.");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
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
    
    public static void main(String[] args) {
         final String SMTP_HOST = "smtp.gmail.com";
        final String SMTP_PORT = "587";
        final String SMTP_USER = "nguyendangkhoa5104@gmail.com"; // Thay bằng email của bạn
        final String SMTP_PASSWORD = "dxep fsct zmde lemd"; // Thay bằng App Password

        String toEmail = "nguyentruonggiang5104@gmail.com"; // Thay bằng email nhận
        String subject = "Test Email";
        String body = "This is a test email.";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true"); // TLS
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);

        Session session = Session.getInstance(props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(SMTP_USER, SMTP_PASSWORD);
                }
            });

        session.setDebug(true); // Bật chế độ debug

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SMTP_USER, "Lấy lại mật khẩu"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setText(body);

            Transport.send(message);
            System.out.println("Email đã được gửi thành công.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
