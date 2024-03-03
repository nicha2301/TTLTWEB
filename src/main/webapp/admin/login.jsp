<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi-VN">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
  <title>Đăng nhập</title>
  <link href="assets/img/icon/icon-logo.png" rel="shortcut icon">

  <!-- Favicons -->
  <link rel="shortcut icon" href="assets/img/favicon.png">

  <!-- Fontawesome CSS -->
  <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
  <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="assets/css/font-awesome.min.css">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

  <!-- Main CSS -->
  <link rel="stylesheet" href="assets/css/admin.css">

</head>

<body>
<div class="main-wrapper">

  <div class="login-page">
    <div class="login-body container">
      <div class="loginbox">
        <div class="login-right-wrap">
          <div class="account-header">
            <div class="account-logo text-center mb-4">
              <a href="dashboard.jsp">
                <img src="assets/img/logo-icon.png" alt="" class="img-fluid">
              </a>
            </div>
          </div>
          <div class="login-header">
            <h3>Login <span>Thuốc Thú Ý</span></h3>
            <p class="text-muted">Truy cập vào dashboard</p>
          </div>
          <form action="${pageContext.request.contextPath}/admin/login" method="post">
            <div class="form-group">
              <label class="control-label">Username</label>
              <input class="form-control" type="text" name="username" placeholder="Nhập tên người dùng">
            </div>
            <div class="form-group mb-4">
              <label class="control-label">Password</label>
              <input class="form-control" type="password" name="password" placeholder="Nhập mật khẩu">
            </div>
            <div class="text-center">
              <button class="btn btn-primary btn-block account-btn" type="submit">Đăng nhập</button>
            </div>
          </form>
          <div class="text-center forgotpass mt-4"><a href="">Quên mật khẩu?</a></div>
          <div class="login-or">
            <span class="or-line"></span>
          </div>
        </div>
      </div></div>
  </div>
</div>

<!-- jQuery -->
<script src="assets/js/jquery-3.5.0.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="assets/js/popper.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- Custom JS -->
<script src="assets/js/admin.js"></script>

</body>

</html>