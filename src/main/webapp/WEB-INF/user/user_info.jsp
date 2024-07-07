<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="/assets/user/css/thuvien/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="/assets/user/css/thuvien/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/user/user.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="icon" href="https://tienthangvet.vn/wp-content/uploads/cropped-favicon-Tien-Thang-Vet-192x192.png"
          sizes="192x192"/>
    <title>Trang cá nhân</title>
</head>
<body>
<div class="website-wrapper">
    <%@include file="/WEB-INF/user/include/header.jsp" %>
    <div class="page-title" style="
            background-image: url(https://tienthangvet.vn/wp-content/uploads/title-tag-tien-thang-vet-tsd1.jpg);
          ">
        <div class="container">
            <h1 class="title">Trang cá nhân</h1>
        </div>
    </div>
    <div class="container">
        <div class="row my-2 user__border">
            <div class="col-lg-8 order-lg-2">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="" data-target="#profile" data-toggle="tab" class="nav-link active nav-link-2">Tài
                            Khoản</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#messages" data-toggle="tab" class="nav-link nav-link-2">Đổi Mật
                            Khẩu</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#edit" data-toggle="tab" class="nav-link nav-link-2">Đơn Hàng</a>
                    </li>
                </ul>
                <div class="tab-content py-4">
                    <div class="tab-pane active" id="profile">
                        <!-- <h5 class="mb-3">Thông Tin Tài Khoản</h5> -->
                        <div class="row">
                            <div class="col-md-12">
                                <header>
                                    <h1>HỒ SƠ CỦA TÔI</h1>
                                    <div class="content">Quản lý thông tin hồ sơ để bảo mật tài khoản</div>
                                </header>
                                <form class="formAcount validate clearfix">
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label"> Họ tên: <span></span></label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="text" id="fullName" name="fullName"
                                                       value="${sessionScope.auth.fullName}"
                                                       placeholder="Họ tên"
                                                       class="validate[required,minSize[4],maxSize[32]] form-control input-sm">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label">Ngày sinh: <span></span></label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="date" id="birthday" name="birthday"
                                                       value="${sessionScope.auth.dateOfBirth}"
                                                       placeholder="Ngày sinh"
                                                       class="validate[required] form-control input-sm">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label">Điện thoại: <span>(*)</span></label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="text" id="mobile" name="phone"
                                                       value="${sessionScope.auth.phone}"
                                                       placeholder="Điện thoại"
                                                       class="validate[required,custom[phone]] form-control input-sm">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label">Email: <span>(*)</span></label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="text" name="email" id="email"
                                                       value="${sessionScope.auth.email}"
                                                       placeholder="Email"
                                                       class="validate[required,custom[email]] form-control input-sm">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label">Tỉnh/Thành phố<span>(*)</span></label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="text" name="city" id="city" value="${sessionScope.auth.city}"
                                                    placeholder="Thành phố" class="validate[required,custom[email]] form-control input-sm">
                                                <select class="validate[required] form-control input-sm" id="tinh" name="tinh" title="Chọn Tỉnh Thành">
                                                    <option value="0">--Chọn Tỉnh/Thành phố--</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label">Quận/ Huyện: <span>(*)</span></label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="text" id="district" name="district" value="${sessionScope.auth.district}"
                                                    placeholder="Quận/ Huyện" class="validate[required,custom[email]] form-control input-sm">
                                                <select class="validate[required] form-control input-sm" id="quan" name="quan" title="Chọn Quận Huyện">
                                                    <option value="0">--Chọn Quận/ Huyện--</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label">Xã/ Phường/ Thị trấn: <span>(*)</span></label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="text" id="ward" name="ward" value="${sessionScope.auth.ward}"
                                                    placeholder="Xã/ Phường/ Thị trấn" class="validate[required,custom[email]] form-control input-sm">
                                                <select class="validate[required] form-control input-sm" id="phuong" name="phuong" title="Chọn Phường Xã">
                                                    <option value="0">--Chọn Phường/ Xã/ Thị trấn--</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label">Địa chỉ chi tiết:
                                                <span>(*)</span></label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="text" id="address" name="address"
                                                       value="${sessionScope.auth.detail_address}"
                                                       placeholder="Địa chỉ chi tiết"
                                                       class="validate[required] form-control input-sm">
                                            </div>
                                        </div>
                                    </div>
                                    <span style="color: red;" id="errorUpdate"></span>
                                    <input type="hidden" id="action" name="action" value="update">
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label"></label>
                                            <button id="btnHuy" class="btn-update" type="submit">CẬP NHẬT</button>
                                            <div class="col-lg-6 col-md-9">
                                                <button id="btnUpdate" class="btn-update" type="submit">XÁC NHẬN</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!--/row-->
                    </div>
                    <div class="tab-pane" id="messages">
                        <!-- <h5 class="mb-3">Thông Tin Tài Khoản</h5> -->
                        <div class="row">
                            <div class="col-md-12">
                                <header>
                                    <h1>THAY ĐỔI MẬT KHẨU</h1>
                                    <div class="content">Bạn nên cập nhật mật khẩu thường xuyên vì lí do bảo mật</div>
                                </header>
                                <form id="formAcount" class="formAcount validate clearfix" method="post"
                                      action="resetpassword">
                                    <% String error = (String) request.getAttribute("wrongInfor");%>
                                    <% if (error != null) {%>
                                    <p style="color: <%=error.equals("Mật khẩu đã được thay đổi") ? "#7cb342" : "red"%>; margin-bottom: 10px"><%=error%>
                                    </p>
                                    <% } %>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label"> Mật khẩu cũ: </label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="password" name="pass"
                                                       class="validate[required,minSize[4],maxSize[32]] form-control input-sm">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label"> Mật khẩu mới: </label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="password" name="newpass"
                                                       class="validate[required,minSize[4],maxSize[32]] form-control input-sm">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label"> Xác nhận mật khẩu: </label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="password" id="pass" name="renewpass"
                                                       class="validate[required,minSize[4],maxSize[32]] form-control input-sm">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label"></label>
                                            <div class="col-lg-6 col-md-9">
                                                <button class="btn-update">LƯU</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!--/row-->
                    </div>
                    <div class="tab-pane myorder__style" id="edit">
                        <!-- <div class="heading">Đơn hàng của tôi</div> -->
                        <div class="inner">
                            <table>
                                <thead>
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Ngày mua</th>
                                    <th>Thanh toán</th>
                                    <th>Trạng thái đơn hàng</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${order}" var="o">
                                    <c:if test="${not (o.status eq 'Đã hủy' or o.status eq 'Bị từ chối')}">
                                        <tr>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/user/order_detail?id=${o.id}">${o.id}</a>
                                            </td>
                                            <td>${Util.formatTimestamp(o.dateCreated)}</td>
                                            <td>
                                                <c:if test="${o.payment}">
                                                    Momo
                                                </c:if>
                                                <c:if test="${not o.payment}">
                                                    Tiền Mặt
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${o.status eq 'Chờ xử lý'}">
                                                    Chờ xử lý
                                                </c:if>
                                                <c:if test="${o.status eq 'Bị từ chối'}">
                                                    Bị từ chối
                                                </c:if>
                                                <c:if test="${o.status eq 'Đã hủy'}">
                                                    Đã hủy
                                                </c:if>
                                                <c:if test="${o.status eq 'Đang giao hàng'}">
                                                    Đang giao hàng
                                                </c:if>
                                                <c:if test="${o.status eq 'Giao hàng thành công'}">
                                                    Giao hàng thành công
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!--/row-->
                </div>

            </div>
            <div class="col-lg-4 order-lg-1 text-center img-2">
                <div class="img-ava">
                    <img src="${sessionScope.auth.avatar}" class="mx-auto img-fluid img-circle d-block" alt="avatar" id="avatar">
                    <label class="load-ava">
                        <span class="custom-file-control">Đổi Ảnh</span>
                        <input type="file" id="file" class="custom-file-input">
                    </label>
                </div>
                <h6 class="mt-2">Ảnh Đại Diện</h6>
            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/user/include/footer.jsp" %>
</div>
<script src="/assets/user/js/thuvien/jquery-3.3.1.min.js"></script>
<script src="/assets/user/js/thuvien/bootstrap.min.js"></script>
<script src="/assets/user/js/thuvien/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://esgoo.net/scripts/jquery.js"></script>
<%--<script>--%>
<%--    window.addEventListener('scroll', () => {--%>
<%--        var header = document.querySelector('.container-2')--%>
<%--        header.classList.toggle('sticky', window.scrollY > 100)--%>
<%--    });--%>
<%--</script>--%>
<script>
    var hidden = true;
    function toggleHidden(event) {
        hidden = !hidden;
        console.log("Hidden status:", hidden);
        updateVisibility();
    }
    function handleCancel(event) {
        event.preventDefault();  // Ngăn chặn hành vi mặc định, không gửi form
        toggleHidden();          // Chạy hàm toggle để thay đổi trạng thái và cập nhật giao diện
    }

    function updateVisibility() {
        var cityI = document.getElementById("city");
        var districtI = document.getElementById("district");
        var wardI = document.getElementById("ward");
        var city = document.getElementById("tinh");
        var district = document.getElementById("quan");
        var ward = document.getElementById("phuong");
        var update = document.getElementById("btnUpdate");
        var huy = document.getElementById("btnHuy");
        if (hidden) {
            city.style.display = 'none';
            district.style.display = 'none';
            ward.style.display = 'none';
            cityI.style.display = 'block';
            districtI.style.display = 'block';
            wardI.style.display = 'block';
            update.style.display = 'none';
        } else {
            city.style.display = 'block';
            district.style.display = 'block';
            ward.style.display = 'block';
            cityI.style.display = 'none';
            districtI.style.display = 'none';
            wardI.style.display = 'none';
            update.style.display = 'block';
            huy.style.background = 'silver';
        }
    }
    // document.getElementById("btnUpdate").addEventListener("click", toggleHidden);
    document.getElementById("btnHuy").addEventListener("click", handleCancel);
    document.addEventListener("DOMContentLoaded", updateVisibility);
</script>
<script type="text/javascript">
    document.getElementById('file').onchange = function() {
        var fileInput = document.getElementById('file');
        var formData = new FormData();
        if (fileInput.files.length > 0) {
            formData.append("filename", fileInput.files[0]);
            formData.append("action", "set");
            $.ajax({
                url: "${pageContext.request.contextPath}/user/updateinfouser",
                type: "POST",
                data: formData,
                processData: false,  // Báo cho jQuery không xử lý dữ liệu
                contentType: false,  // Báo cho jQuery không thiết lập contentType
                success: function (result) {
                    $('#avatar').attr("src", "/uploads/" + result.status);
                },
                error: function() {
                }
            });
        }
    };
</script>
<script>
    $(document).ready(function () {
        // Lấy tỉnh thành
        $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function (data_tinh) {
            if (data_tinh.error == 0) {
                $.each(data_tinh.data, function (key_tinh, val_tinh) {
                    $("#tinh").append('<option value="' + val_tinh.id + '">' + val_tinh.full_name + '</option>');
                });
            }
        });

        $("#tinh").change(function (e) {
            var idtinh = $(this).val();
            // Lấy quận huyện
            $.getJSON('https://esgoo.net/api-tinhthanh/2/' + idtinh + '.htm', function (data_quan) {
                if (data_quan.error == 0) {
                    $("#quan").empty().append('<option value="0">--Chọn Quận Huyện--</option>');
                    $("#phuong").empty().append('<option value="0">--Chọn Phường/ Xã/ Thị trấn--</option>');
                    $.each(data_quan.data, function (key_quan, val_quan) {
                        $("#quan").append('<option value="' + val_quan.id + '">' + val_quan.full_name + '</option>');
                    });
                }
            });
        });

        $("#quan").change(function (e) {
            var idquan = $(this).val();
            // Lấy phường xã
            $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function (data_phuong) {
                if (data_phuong.error == 0) {
                    $("#phuong").empty().append('<option value="0">--Chọn Phường/ Xã/ Thị trấn--</option>');
                    $.each(data_phuong.data, function (key_phuong, val_phuong) {
                        $("#phuong").append('<option value="' + val_phuong.id + '">' + val_phuong.full_name + '</option>');
                    });
                }
            });
        });
    });
</script>
<script>
    var context = "${pageContext.request.contextPath}";
    $(document).ready(function() {
        $('#btnUpdate').click(function (event) {
            if(!hidden) {
                event.preventDefault();
                var fullName = $('#fullName').val();
                var birthday = $('#birthday').val();
                var phone = $('#mobile').val();
                var email = $('#email').val();
                var tinh = $('#tinh').val();
                var quan = $('#quan').val();
                var phuong = $('#phuong').val();
                var address = $('#address').val();
                var action = $('#action').val();
                $.ajax({
                    type: 'POST',
                    data: {
                        fullName: fullName,
                        birthday: birthday,
                        phone: phone,
                        email: email,
                        tinh: tinh,
                        quan: quan,
                        phuong: phuong,
                        address: address,
                        action: action
                    },
                    url: 'updateinfouser',
                    success: function (result) {
                        console.log(hidden)
                        try {
                            if (result.status !== "success") {
                                $('#errorUpdate').html(result.error);
                            } else {
                                window.location.href = context + "/user/updateinfouser";
                            }
                        } catch (e) {
                            $('#errorUpdate').html("Error loading request, please try again!");
                        }
                    },
                    error: function() {
                        $('#errorUpdate').html("Connection errors. Please check your network and try again!");
                    }
                });
            }
        });
    });
</script>
</body>
</html>