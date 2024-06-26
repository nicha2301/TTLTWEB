package vn.edu.hcmuaf.fit.controller.user_page;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.commons.codec.binary.Base64;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import vn.edu.hcmuaf.fit.connection_pool.DbProperties;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.IOException;



@WebServlet("/user/login")
public class TwitterCallbackServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            response.getWriter().write("Authorization code not received or is empty.");
            return;
        }

        String clientId = "czl4bHg4b21CZkEwRDJWUHo1VXc6MTpjaQ";
        String clientSecret = "h83z5VsevGOhMlVwyTq1D_aj-2-20nQbjsMtIqWgjOcygTaH6W";
        String redirectUri = "http://localhost:8080/user/login?apis=Twitter";

        try {
            String clientCredentials = clientId + ":" + clientSecret;
            String base64Credentials = new String(Base64.encodeBase64(clientCredentials.getBytes()));

            String responseBody = Request.Post("https://api.twitter.com/2/oauth2/token")
                    .addHeader("Authorization", "Basic " + base64Credentials) // Add Basic Authorization header
                    .bodyForm(Form.form()
                            .add("grant_type", "authorization_code")
                            .add("code", code)
                            .add("redirect_uri", redirectUri.replace("&state=state", ""))
                            .add("code_verifier", "challenge")
                            .build())
                    .execute().returnContent().asString();

            JsonObject jsonObject = JsonParser.parseString(responseBody).getAsJsonObject();
            String accessToken = jsonObject.get("access_token").getAsString();

//            response.getWriter().write("Access Token: " + accessToken);
            String userInfoResponse = Request.Get("https://api.twitter.com/2/users/me?user.fields=id,name,username,profile_image_url")
                    .addHeader("Authorization", "Bearer " + accessToken)
                    .execute().returnContent().asString();

            JsonObject json = JsonParser.parseString(userInfoResponse).getAsJsonObject();
            System.out.println(json);
            User user = new User();
            JsonObject dataJson = json.getAsJsonObject("data");
            String username = dataJson.has("username") ? dataJson.get("username").getAsString() : null;
            user.setUsername(dataJson.has("username") ? dataJson.get("username").getAsString() : null);
            user.setEmail(username + "@users.noreply.twitter.com");
            user.setFullName(dataJson.has("name") ? dataJson.get("name").getAsString() : null);
            user.setAvatar(dataJson.has("profile_image_url") ? dataJson.get("profile_image_url").getAsString() : null);
            user.setLoginBy(3);
            String ip = request.getHeader("X-FORWARDED-FOR");
            String apis = request.getParameter("apis");
            if (ip == null) ip = request.getRemoteAddr();
            this.loginByAPIS(request, response, user, ip, apis);

            // Output the JSON object with user information
            response.setContentType("application/json");
            response.getWriter().write(json.toString());
        } catch (Exception e) {
            response.getWriter().write("Failed to get access token: " + e.getMessage());
        }
    }
    private void loginByAPIS(HttpServletRequest request, HttpServletResponse response, User callback, String ip, String apis) {
        try {
            User user = UserService.getInstance().loginByAPIS(callback, ip, "/user/loginByAPIS");

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("auth", user);
                response.sendRedirect("./home");
                return;
            }
            request.setAttribute("loginFail", "Login fail with " + apis);
            request.getRequestDispatcher("/user/signIn.jsp").forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}