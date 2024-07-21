package vn.edu.hcmuaf.fit.controller.admin;

//import vn.edu.hcmuaf.fit.dao.UserDAOT;
import vn.edu.hcmuaf.fit.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = "/admin/edit-user")
public class Edit_user extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "user");
        request.setAttribute("title", "Sửa thông tin người dùng");
        String type = request.getParameter("type");
//        if (type.equalsIgnoreCase("enteredit")) {
//            int id = Integer.parseInt(request.getParameter("id"));
//            User user = new User();
//            request.setAttribute("user", user);
//            request.getRequestDispatcher("./edit-users.jsp").forward(request, response);
//            return;
//        }
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String birthday = request.getParameter("birthday");
        String createddate = request.getParameter("createddate");

            int id = Integer.parseInt(request.getParameter("usercode"));
            request.setAttribute("type", "edit");
            request.setAttribute("title", "Sửa thông tin người dùng");
            request.setAttribute("id", id);
//            boolean isUpdate = UserDAOT.updateUserInAdimin(id, email, name, birthday, address, createddate);
            User user = new User();
            request.setAttribute("user", user);
            request.getRequestDispatcher("/WEB-INF/admin/edit-users.jsp").forward(request, response);


    }
}
