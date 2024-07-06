package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@WebServlet("/user/updateinfouser")
@MultipartConfig
public class UpdateInfoUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("/WEB-INF/user/user_info.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            resp.sendRedirect("/login"); // Redirect to login if not authenticated
            return;
        }

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
                user.setAvatar(fileName); // Cập nhật avatar cho user
                UserService.getInstance().updateAvatar(user, req.getRemoteAddr(), "/user/updateinfouser");
                out.print("{\"status\":\"" + fileName + "\"}"); // Trả về tên file đã lưu
            } catch (Exception e) {
                out.print("{\"error\": \"" + e.getMessage() + "\"}");
                e.printStackTrace();
            } finally {
                out.close();
            }
        }
    }

//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        HttpSession session = req.getSession();
//        User user = (User) session.getAttribute("auth");
//        if (user == null) {
//            req.getRequestDispatcher("/WEB-INF/user/signIn.jsp").forward(req, resp);
//            return;
//        }
//        String ip = req.getHeader("X-FORWARDED-FOR");
//        if (ip == null) ip = req.getRemoteAddr();
//        PrintWriter out = resp.getWriter();
//
//        String action = req.getParameter("action");
//        if (action != null && action.equals("set")) {
//            try {
//                resp.setHeader("Content-type", "text/html;charset=UTF-8");
//                Part filePart = req.getPart("filename");
//                if (filePart == null){
//                    out.print("please choose a file");
//                    return;
//                }
//                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
//                System.out.println("jjjjjjjjjjjjjjjj "+ fileName);
//                ServletContext servletContext = this.getServletConfig().getServletContext();
//                String storePath = servletContext.getRealPath("/uploads");
//                System.out.println(storePath);
//                File uploadFile = new File(storePath + "/" + fileName);
//                File file = new File(uploadFile, fileName);
//                try (InputStream input = filePart.getInputStream()) {
//                    Files.copy(input, file.toPath());
//                }
//                User u = new User();
//                u.setId(user.getId());
//                u.setAvatar(fileName);
//                if(UserService.getInstance().updateAvatar(user, ip, "/user/updateinfouser")) out.write("{\"status\":\""+fileName+"\"}");
//                out.close();
//                return;
//            } catch (IOException | ServletException e) {
//                throw new RuntimeException(e);
//            }
//        }
//        String fullName = req.getParameter("fullName");
//        String birthday = req.getParameter("birthday");
//        String phone = req.getParameter("phone");
//        String city = req.getParameter("city");
//        String district = req.getParameter("district");
//        String ward = req.getParameter("ward");
//        String detail_address = req.getParameter("address");
//
////        List<Order> orders = OrderDAO.loadOrderByUserId(user.getId());
////        req.setAttribute("order", orders);
//        List<Order> orders = new ArrayList<>();
//        req.setAttribute("order", orders);
//
//        if (UserService.getInstance().updateUserInfo(user, fullName, birthday, city, district, ward, detail_address, phone, ip, "/user/updateinfouser")) {
//            user = UserService.getInstance().loadUsersWithId(user, ip, "/user/updateinfouser");
//            if (user != null) {
//                session.setAttribute("auth", user);
//                req.getRequestDispatcher("/WEB-INF/user/user_info.jsp").forward(req, resp);
//            } else req.getRequestDispatcher("/WEB-INF/user/signIn.jsp").forward(req, resp);
//        }
//    }
}