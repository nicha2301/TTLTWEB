package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.annotation.WebServlet;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Response;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/user/userinfo")
public class UserInfoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accessToken = request.getParameter("access_token");
        if (accessToken == null || accessToken.isEmpty()) {
            response.getWriter().write("Access token is required.");
            return;
        }

        try {
            String userInfoEndpoint = "https://api.twitter.com/2/users/me";
            String fields = "id,name,username,email,profile_image_url"; // Specify the fields you want from the Twitter API

            String userInfoResponse = Request.Get(userInfoEndpoint + "?user.fields=" + fields)
                .addHeader("Authorization", "Bearer " + accessToken)
                .execute()
                .returnContent()
                .asString();

            response.setContentType("application/json");
            response.getWriter().write(userInfoResponse);
        } catch (Exception e) {
            response.getWriter().write("Failed to retrieve user information: " + e.getMessage());
        }
    }
}
