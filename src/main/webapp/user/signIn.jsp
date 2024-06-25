<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="css/sign/form.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="icon" href="https://tienthangvet.vn/wp-content/uploads/cropped-favicon-Tien-Thang-Vet-192x192.png"
          sizes="192x192"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <title>Đăng nhập</title>
    <script type="text/javascript">
        var context = "${pageContext.request.contextPath}";
        $(document).ready(function() {
            $('#btnLogin').click(function (event) {
                event.preventDefault();
                var email = $('#email').val();
                var password = $('#password').val();
                var rememberMe = $('#remember-me').is(':checked');
                $.ajax({
                    type: 'POST',
                    data: {
                        email: email,
                        password: password,
                        rememberMe: rememberMe
                    },
                    url: 'signin',
                    success: function (result) {
                        try {
                            var resp = grecaptcha.getResponse();
                            if (resp.length === 0) {
                                $('#success').html("");
                                $('#errorLogin').html("");
                                $('#errorCaptcha').html("Please verify recaptcha!");
                            } else {
                                if (result.status !== "success") {
                                    if (result.error)
                                    $('#errorLogin').html(result.error);
                                    $('#success').html("");
                                    $('#errorCaptcha').html("");
                                } else {
                                    window.location.href = context + "/user/home";
                                }
                            }
                        } catch (e) {
                            $('#errorLogin').html("Error loading request, please try again!");
                        }
                    },
                    error: function() {
                        $('#errorLogin').html("Connection errors. Please check your network and try again!");
                    }
                });
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            var baseUri = "http://localhost:8080/user/signin";
            var params = "?apis=Facebook";
            var encodedUri = encodeURIComponent(baseUri + params);

            var facebookUrl = "https://www.facebook.com/v19.0/dialog/oauth?fields=id,name,first_name,email,picture&client_id=834857594884300&redirect_uri=" + encodedUri;

            var linkElement = document.getElementById('facebook-login-link');
            linkElement.href = facebookUrl;
        });
    </script>
</head>

<body>
<div class="website-wrapper">
    <jsp:include page="header.jsp"/>
    <div class="body">
        <div class="form-container" style="height: 560px">
            <form id="form" class="sign-in-form" style="margin-top: 14%; transform: translateY(-20%)">
                <h2>Đăng Nhập</h2>
                <span style="color: #66b840;margin-bottom: 10px" id="success">${empty sessionScope.success?'': sessionScope.success}</span>
                <span style="color: red;margin-bottom: 10px" id="errorLogin">${empty loginFail? '': loginFail}</span>
                <span style="color: red;margin-bottom: 10px" id="errorCaptcha"></span>
                <div class="input-group">
                    <input type="email" id="email" name="email" placeholder="Email" value="${empty email ? '' : email}" required>
                    <div id="email-error" style="color: red;"></div>
                </div>
                <div class="input-group">
                    <input type="password" id="password" name="password" placeholder="Mật khẩu" value="${empty password ? '' : password}" required>
                    <div id="password-error" style="color: red;"></div>
                </div>
                <div class="terms-checkbox">
                    <input type="checkbox" id="remember-me" name="remember-me" required>
                    <label for="remember-me">Remember me</label>
                </div>
                <div class="container-capcha" style="margin-bottom: 15px; translate: 80px">
                    <div class="g-recaptcha" data-sitekey="6LccJf8pAAAAAKFsySRinmrgaKifye9ONkxLpWga"></div>
                </div>
                <button id="btnLogin" type="submit">Đăng Nhập</button>
                <div class="forgot-password">
                    <a href="verify?action=reset" style="color: #66b840">Quên mật khẩu?</a>   |   <a href="verify?action=activated" style="color: #66b840">Chưa xác thực?</a>   |   <a href="verify?action=unlocked" style="color: #66b840">Mở khoá đăng nhập?</a>
                </div>
                <div class="or"><span>Hoặc</span></div>

                <div class="social-icons">
                    <a id="facebook-login-link" href="#">
                        <img src="assets/img/formIcon/facebook-color-icon-2048x2048-bfly1vxr.png" alt="Facebook">
                    </a>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:8080/user/signin?apis=Google&response_type=code&client_id=612393162835-dp8fc3bvhdt9g8139uv41umfu0bbgefv.apps.googleusercontent.com&prompt=select_account">
                        <img src="assets/img/formIcon/gg.png" alt="Google">
                    </a>
                    <a href="#">
                        <img src="assets/img/formIcon/twitter-2672572_1280.png" alt="Twitter">
                    </a>
                </div>

                <div class="register-link">
                    Bạn chưa có tài khoản? <a href="signup">Đăng ký</a>
                </div>
            </form>

        </div>
    </div>
    <jsp:include page="footer.jsp"/>

</div>

<script src="js/sign/scipts.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
</body>

</html>