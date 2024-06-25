package vn.edu.hcmuaf.fit.controller.user_page;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.codec.binary.Base64;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import vn.edu.hcmuaf.fit.connection_pool.DbProperties;

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

        String clientId = "ejk3azBSZE1pMkNzZi0xOGdfTmo6MTpjaQ";
        String clientSecret = "e5eAYBm-6zgkjzpNA9drANkhoXDJoC49Mbte4IsvfstL5wShWi";
        String redirectUri = "http://localhost:8080/user/login";

        try {
            String clientCredentials = clientId + ":" + clientSecret;
            String base64Credentials = new String(Base64.encodeBase64(clientCredentials.getBytes()));

            String responseBody = Request.Post("https://api.twitter.com/2/oauth2/token")
                    .addHeader("Authorization", "Basic " + base64Credentials) // Add Basic Authorization header
                    .bodyForm(Form.form()
                            .add("grant_type", "authorization_code")
                            .add("code", code)
                            .add("redirect_uri", redirectUri.replace("?state=state", ""))
                            .add("code_verifier", "challenge")
                            .build())
                    .execute().returnContent().asString();

            JsonObject jsonObject = JsonParser.parseString(responseBody).getAsJsonObject();
            String accessToken = jsonObject.get("access_token").getAsString();

//            response.getWriter().write("Access Token: " + accessToken);
            String userInfoResponse = Request.Get("https://api.twitter.com/2/users/me?user.fields=id,name,username,profile_image_url")
                    .addHeader("Authorization", "Bearer " + accessToken)
                    .execute().returnContent().asString();

            JsonObject userJson = JsonParser.parseString(userInfoResponse).getAsJsonObject();

            // Output the JSON object with user information
            response.setContentType("application/json");
            response.getWriter().write(userJson.toString());
        } catch (Exception e) {
            response.getWriter().write("Failed to get access token: " + e.getMessage());
        }
    }
}