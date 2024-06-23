<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/taglib.jsp" %>
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
            $('#btnVerify').click(function (event) {
                event.preventDefault();
                var verifyCode = $('#verifyCode').val();
                var verifyEmail = $('#verifyEmail').val();
                var action = $('#action').val();

                $.ajax({
                    type: 'POST',
                    data: {
                        verifyCode: verifyCode,
                        verifyEmail: verifyEmail,
                        action: action
                    },
                    url: 'verify',
                    success: function (result) {
                        try {
                            if (result.status !== "success" && result.status !== "sendComplete") {
                                $('#errorVerify').html(result.error);
                                $('#success').html("");
                                $('#errorExist').html("");
                            } else {
                                if (result.status === "success") window.location.href = context + "/user/signin";
                                else window.location.href = context + "/user/verify";
                            }
                        } catch (e) {
                            $('#errorVerify').html("Error loading request, please try again!");
                        }
                    },
                    error: function() {
                        $('#errorVerify').html("Connection errors. Please check your network and try again!");
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
        <div class="form-container">
            <form id="form" class="sign-in-form">
                <h2>Xác thực</h2>
                <span style="color: red;margin-bottom: 10px" id="errorExist">${empty errorExist? '': errorExist}</span>
                <span style="color: green;margin-bottom: 10px" id="success">${empty sessionScope.success? '': sessionScope.success}</span>
                <span style="color: red;margin-bottom: 10px" id="errorVerify"></span>
                <c:choose>
                    <c:when test="${empty applicationScope.email}">
                        <div class="input-group">
                            <input id="verifyEmail" type="text" name="verifyEmail" placeholder="Vui lòng nhập email" required>
                            <input type="hidden" id="action" name="action" value="${param.action}">
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="input-group">
                            <input id="verifyCode" type="text" name="verifyCode" placeholder="Vui lòng nhập mã xác thực" required>
                        </div>
                    </c:otherwise>
                </c:choose>
                <button type="submit" id="btnVerify">Gửi</button>
                <div class="forgot-password">
                    <a href="verify?action=resend">Gửi lại mã?</a>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
<script src="js/sign/scipts.js"></script>
</body>
</html>