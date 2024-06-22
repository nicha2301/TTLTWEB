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
                            if (result.status !== "success") {
                                $('#errorLogin').html(result.error);
                                $('#restore').html("");
                            } else {
                                var resp = grecaptcha.getResponse();
                                if (response.length === 0) {
                                    $('#errorLogin').html("Please verify recaptcha!");
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
    </script>
</head>

<body>
<div class="website-wrapper">
    <jsp:include page="header.jsp"/>
    <div class="body">
        <div class="form-container" style="height: 560px">
            <form id="form" class="sign-in-form" style="margin-top: 14%; transform: translateY(-20%)">
                <h2>Đăng Nhập</h2>
                <p class="text-success" id="restore">${empty sessionScope.success ? '' : sessionScope.success}</p>
                <span style="color: red;margin-bottom: 10px" id="errorLogin"></span>
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
                    <a href="forgotPass.jsp">Quên mật khẩu?</a>
                </div>

                <div class="or"><span>Hoặc </span></div>
                <div class="social-icons">

                    <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:8080/FinalLapTrinhWeb_war_exploded/user/loginbygoogle&response_type=code&client_id=199448063192-cjher98pjlkob9tpeu7a37gd99n44rbu.apps.googleusercontent.com&prompt=select_account">
                        <img src="assets/img/formIcon/google.jpg" alt="Google">
                    </a>
                </div>
                <div class="register-link">
                    Bạn chưa có tài khoản? <a href="signUp.jsp">Đăng ký</a>
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