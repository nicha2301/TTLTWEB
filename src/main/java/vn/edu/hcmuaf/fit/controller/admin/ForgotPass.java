//package vn.edu.hcmuaf.fit.controller.admin;
//
//
//import vn.edu.hcmuaf.fit.controller.user_page.APIService.SendEmail;
//import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import org.mindrot.jbcrypt.BCrypt;
//
//import java.io.IOException;
//import java.sql.SQLException;
//
//@WebServlet("/admin/forgotpassword")
//public class ForgotPass extends HttpServlet {
//    public ForgotPass() {
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        this.doPost(request, response);
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String email = request.getParameter("email");
//        SendEmail send = new SendEmail();
//
//        try {
//            if (UserDAO.getInstance().CheckExistUser(email)) {
//                // Tạo mật khẩu ngẫu nhiên
//                String newPassword = generateRandomPassword();
//
//                // Lưu mật khẩu mới đã mã hóa vào CSDL
//                String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
//                UserDAO.getInstance().resetPassword(email, hashedPassword);
//
//                // Gửi mật khẩu mới đến email của người dùng
//                if (send.sendPassword(email, newPassword)) {
//                    response.sendRedirect("./signIn.jsp");
//                }
//            } else {
//                request.setAttribute("wrongInfor", "Tài khoản không tồn tại !");
//                request.getRequestDispatcher("./forgotPass.jsp").forward(request, response);
//            }
//
//        } catch (SQLException var6) {
//            throw new RuntimeException(var6);
//        }
//    }
//
//    // Phương thức tạo mật khẩu ngẫu nhiên
//    private String generateRandomPassword() {
//        // Đây chỉ là một cách đơn giản, bạn có thể thay đổi theo nhu cầu
//        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
//        StringBuilder password = new StringBuilder();
//        for (int i = 0; i < 10; i++) {
//            int index = (int) (Math.random() * chars.length());
//            password.append(chars.charAt(index));
//        }
//        return password.toString();
//    }
//}
//
