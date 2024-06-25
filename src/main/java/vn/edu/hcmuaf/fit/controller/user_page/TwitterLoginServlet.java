package vn.edu.hcmuaf.fit.controller.user_page;// TwitterLoginServlet.java

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.edu.hcmuaf.fit.connection_pool.DbProperties;

import java.io.IOException;

@WebServlet("/user/loginByTwitter")
public class TwitterLoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String clientId = DbProperties.TWITTER_CLIENT_ID;
        String redirectUri = "http://localhost:8080/user/login";
        String scope = "tweet.read users.read"; // Adjust the scope according to your needs
        response.sendRedirect("https://twitter.com/i/oauth2/authorize?response_type=code&client_id=" + clientId +
                              "&redirect_uri=" + redirectUri + "&scope=tweet.read%20users.read&state=state&code_challenge=challenge&code_challenge_method=plain");
    }
}