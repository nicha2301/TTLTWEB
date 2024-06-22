package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/user/signin")
public class SignIn extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        Cookie arr[] = request.getCookies();
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("userC")) {
                    request.setAttribute("email", o.getValue());
                }
                if (o.getName().equals("passC")) {
                    request.setAttribute("password", o.getValue());
                }
            }
        }
        request.getRequestDispatcher("/user/signIn.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("rememberMe");

        boolean ok = true;
        if ((email == null) || (email.equals(""))) {
            ok = false;
        }
        if ((password == null) || (password.equals(""))) {
            ok = false;
        }
        if(!ok) {
            out.write("{\"error\":\"Please fill in all information completely\"}");
        } else {
            User u = new User();
            u.setEmail(email);
            u.setPassword(password);

            String ip = request.getHeader("X-FORWARDED-FOR");
            if (ip == null) ip = request.getRemoteAddr();

            User user = UserService.getInstance().signIn(u, ip, "/user/signin");
            User userMail = UserService.getInstance().chkUsrByNameOrEmail("", email);
            if (user == null) {
                if(userMail != null && userMail.getVerified() && userMail.getLoginTimes() < 5) {
                    int times = userMail.getLoginTimes()+1;
                    boolean success = UserService.getInstance().updateLoginFail(userMail, times, ip, "/user/signin");
                    if(success) {
                        if(times < 5) out.println("{\"error\":\"Wrong password. You have "+ (5 - times) +" times to login!\"}");
                        else out.write("{\"error\":\"Login failed. You have signed in incorrectly 5 times");
                    }
                } else {
                    if(userMail == null) out.write("{\"error\":\"Wrong email, please check again!\"}");
                    else if(userMail.getLoginTimes() >= 5) out.write("{\"error\":\"Login failed. We have locked the email " + email + "!\"}");
                    else out.write("{\"error\":\"Account has not been activated to login!\"}");

                }
            } else {
                if (user.getRole().getId() == 1 && user.getLoginTimes() < 5) {
                    boolean success = UserService.getInstance().resetLoginTimes(user, ip, "/user/signin");
                    if(success) {
                        HttpSession session = request.getSession(true);
                        session.setAttribute("auth", user);
                        Cookie uc = new Cookie("userC", email);
                        Cookie pc = new Cookie("passC", password);
                        uc.setMaxAge(30 * 24 * 60 * 60);
                        if (remember != null) {
                            if(Boolean.parseBoolean(remember)) {
                                pc.setMaxAge(30 * 24 * 60 * 60);
                            } else {
                                pc.setMaxAge(0);
                            }
                        } else {
                            pc.setMaxAge(0);
                        }
                        response.addCookie(uc);
                        response.addCookie(pc);
                        out.write("{ \"status\": \"success\"}");
                    }
                } else out.write("{\"error\":\"You do not have access rights\"}");
            }
        }
        out.close();
    }
}