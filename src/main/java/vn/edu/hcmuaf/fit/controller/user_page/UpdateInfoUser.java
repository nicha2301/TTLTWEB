package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.model.Utils;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;

@WebServlet("/user/updateinfouser")
@MultipartConfig
public class UpdateInfoUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            request.getRequestDispatcher("/WEB-INF/user/signIn.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("/WEB-INF/user/user_info.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("auth");

        String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = req.getRemoteAddr();

        String action = req.getParameter("action");
        if ("set".equals(action)) {
            try {
                Part filePart = req.getPart("filename"); // Lấy file từ request
                if (filePart == null) {
                    out.print("{\"error\": \"No file uploaded\"}");
                    return;
                }
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Lấy tên file
                ServletContext servletContext = getServletContext();
                String storePath = servletContext.getRealPath("/uploads"); // Đường dẫn lưu trữ file
                File uploadFile = new File(storePath, fileName);

                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, uploadFile.toPath(), StandardCopyOption.REPLACE_EXISTING); // Sao chép file vào đường dẫn
                }
                user.setAvatar(req.getServletContext().getContextPath() + "/uploads/" + fileName); // Cập nhật avatar cho user
                UserService.getInstance().updateAvatar(user, req.getRemoteAddr(), "/user/updateinfouser");
                out.print("{\"status\":\"" + fileName + "\"}"); // Trả về tên file đã lưu
            } catch (Exception e) {
                out.print("{\"error\": \"" + e.getMessage() + "\"}");
                e.printStackTrace();
            } finally {
                out.close();
            }
        } else if (action.equals("update")) {
            String fullName = req.getParameter("fullName");
            String birthday = !req.getParameter("birthday").isEmpty()?req.getParameter("birthday"):null;
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String city = req.getParameter("tinh");
            String district = req.getParameter("quan");
            String ward = req.getParameter("phuong");
            String detail_address = req.getParameter("address");

            boolean ok = true;
            if ((phone == null) || (phone.equals(""))) {
                ok = false;
            }
            if ((email == null) || (email.equals(""))) {
                ok = false;
            }
            if ((city == null) || (city.equals("")) || (city.equals("0"))) {
                ok = false;
            }
            if ((district == null) || (district.equals("")) || (district.equals("0"))) {
                ok = false;
            }
            if ((ward == null) || (ward.equals("")) || (ward.equals("0"))) {
                ok = false;
            }
            if ((detail_address == null) || (detail_address.equals(""))) {
                ok = false;
            }
            System.out.println(ok);
            if (!ok) {
                out.write("{\"error\":\"Please fill in all information completely\"}");
            } else {
                if (!Utils.isValidEmail(email)) {
                    out.write("{\"error\":\"Email is invalid!\"}");
                } else {
                    req.setAttribute("order", new ArrayList<>());
                    if (UserService.getInstance().updateUserInfo(user, fullName, birthday, city, district, ward, detail_address, phone, ip, "/user/updateinfouser")) {
                        User u = UserService.getInstance().loadUsersWithId(user, ip, "/user/updateinfouser");
                        if (u != null) {
                            session.setAttribute("auth", u);
                            out.write("{ \"status\": \"success\"}");
                        } else out.write("{ \"error\" :\"update fail!\"}");
                    } else out.write("{ \"error\" :\"update fail!\"}");
                }
            }
            out.flush();
            out.close();
        }
    }
}