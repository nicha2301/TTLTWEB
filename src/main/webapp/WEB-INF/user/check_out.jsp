<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.service.impl.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Utils" %>
<%@ page import="vn.edu.hcmuaf.fit.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <link rel="stylesheet" href="/assets/user/css/thuvien/bootstrap.min.css" type="text/css" />
  <link rel="stylesheet" href="/assets/user/css/thuvien/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="/assets/user/css/thuvien/elegant-icons.css" type="text/css">
  <link rel="stylesheet" href="/assets/user/css/thuvien/nice-select.css" type="text/css">
  <link rel="stylesheet" href="/assets/user/css/thuvien/jquery-ui.min.css" type="text/css">
  <link rel="stylesheet" href="/assets/user/css/thuvien/owl.carousel.min.css" type="text/css">
  <link rel="stylesheet" href="/assets/user/css/thuvien/slicknav.min.css" type="text/css">
  <link rel="stylesheet" href="/assets/user/css/cart/checkout.css" type="text/css" />
  <link rel="stylesheet" href="/assets/user/css/header&footer.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="icon" href="https://tienthangvet.vn/wp-content/uploads/cropped-favicon-Tien-Thang-Vet-192x192.png"
        sizes="192x192" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <title>Checkout</title>
  <style>
    table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0 10px; /* 0px ngang và 10px dọc */
    }

    table tr {
      background-color: #f9f9f9; /* Màu nền cho mỗi hàng */
    }

    table th, table td {
      padding: 8px; /* Đệm cho các ô */
      text-align: left; /* Căn lề trái cho văn bản trong ô */
    }

    table th {
      background-color: #f2f2f2; /* Màu nền cho tiêu đề bảng */
    }
  </style>
</head>
<body>
<%@include file="/WEB-INF/user/include/header.jsp" %>
<div class="page-title" style="background-image: url(https://tienthangvet.vn/wp-content/uploads/title-tag-tien-thang-vet-tsd1.jpg);">
  <div class="container">
    <h1 class="title">Thanh toán</h1>
  </div>
</div>
<section class="checkout spad">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <h6>
          <span class="icon_tag_alt"></span> Đã có mã giảm giá?
          <a href="${pageContext.request.contextPath}/user/cart">nhấn tại đây</a> để nhập mã giảm giá
          <form class=" d-flex align-items-center w-50 mx-auto mt-2">
            <input type="text" class="form-control" placeholder="Nhập mã giảm giá">
            <button type="submit" class="btn btn-success" style="white-space: nowrap">Áp dụng</button>
          </form>
        </h6>

      </div>
    </div>
    <h4>Chi tiết đơn hàng</h4>
    <form>

      <div class="row">
        <div class="col-lg-5 col-md-6">
          <div class="row">
            <div class="col-lg-6">
              <div class="checkout__input">
                <p>Họ và tên<span>*</span></p>
                <input class="form-control" type="text" id="full_name" required />
              </div>
            </div>
            <div class="col-lg-6">
              <div class="checkout__input">
                <p>Điện thoại<span>*</span></p>
                <input type="text" id="phone" required />
              </div>
            </div>
          </div>

          <div class="checkout__input">
            <p>Địa chỉ<span>*</span></p>
            <input type="text" id="address" placeholder="Số nhà / Đường" class="checkout__input__add" required />
          </div>

          <div class="checkout__input">
            <p>Tỉnh / Thành phố<span>*</span></p>
            <select class="form-control" id="tinh" name="tinh" title="Chọn Tỉnh Thành">
              <option value="0">Tỉnh Thành</option>
            </select>
          </div>

          <div class="checkout__input">
            <p>Huyện / Quận<span>*</span></p>
            <select class="form-control" id="quan" name="quan" title="Chọn Quận Huyện">
              <option value="0">Quận Huyện</option>
            </select>
          </div>

          <div class="checkout__input">
            <p>Xã / Phường / Thị trấn<span>*</span></p>
            <select class="form-control" id="phuong" name="phuong" title="Chọn Phường Xã">
              <option value="0">Phường Xã</option>
            </select>
          </div>

          <div class="row">
            <div class="col-lg-6">
              <div class="checkout__input">
                <p>Email<span>*</span></p>
                <input class="form-control" type="email" id="email" name="email" required />
              </div>
            </div>
            <div class="col-lg-6">
              <div class="checkout__input">
                <p>At Home?<span></span></p>
                <input class="form-control" type="checkbox" style="width: 30px;height: 30px" id="at-home" name="at-home">
              </div>
            </div>
          </div>

        </div>
        <div class="col-lg-7 col-md-6">
          <div class="checkout__order" style="background-color: #ccc">
            <div >
              <h2>Thông tin sản phẩm trong giỏ hàng:</h2>
              <c:set var="unit" value="VND"/>
              <%
                String ip = request.getHeader("X-FORWARDED-FOR");
                if (ip == null) ip = request.getRemoteAddr();
                double result = (double) session.getAttribute("result");
                List<CartItem> temp = (List<CartItem>) request.getAttribute("temp");
                if (temp == null || temp.isEmpty()) {
                  temp = cart;
                } else {
                  int id = temp.getFirst().getProduct().getId();
                  int quantity = temp.getFirst().getQuantity();
                }
              %>
              <table>
                <tr>
                  <th>Hình ảnh</th>
                  <th>Tên sản phẩm</th>
                  <th>Giá bán</th>
                  <th>Số lượng</th>
                </tr>
                <%
                  for (CartItem item : temp) {
                    Product p = new Product(item.getProduct().getId());
                    Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(p, ip, "/user/checkout.jsp");
                    for (Map.Entry<Product, List<String>> entry : products.entrySet()) {
                %>
                <tr sy>
                  <td>
                    <img style="width: 100px;height: 100px;object-fit: cover" src="<%=entry.getValue().get(0)%>" alt="">
                  </td>
                  <td><%=entry.getKey().getProductName()%></td>
                  <td>
                    <fmt:formatNumber value="<%=entry.getKey().getPrice()%>" type="number" maxFractionDigits="0" pattern="#,##0"/> ${unit}
                  </td>
                  <td><%=item.getQuantity()%></td>
                </tr>
                <%
                    }
                  }
                %>
              </table>

              <div class="checkout__order__subtotal">
                <p>Tổng: <%=result%> ${unit}</p>
              </div>
              <div class="checkout__order__subtotal">
                <p>Phí vận chuyển:  <fmt:formatNumber value='<%=request.getAttribute("priceShipment")%>' type="number" maxFractionDigits="0" pattern="#,##0"/>${unit}</p>
              </div>
              <div class="checkout__order__total">
                <p style="color: red;">Tổng tiền thanh toán:  <fmt:formatNumber value='<%=request.getAttribute("totalPrice")%>' type="number" maxFractionDigits="0" pattern="#,##0"/> ${unit}</p>
              </div>
            </div>
            <div class="checkout__input__checkbox" >
              <label for="cash">
                Cash on delivery (COD)
                <input type="checkbox" id="cash" name="cash" class="payment-option group-checkbox" />
                <span class="checkmark"></span>
              </label>
            </div>
            <div class="checkout__input__checkbox">
              <label for="momo">
                MOMO
                <input type="checkbox" id="momo" name="momo" class="payment-option group-checkbox" data-toggle="collapse" data-target="#momo-code" />
                <span class="checkmark"></span>
              </label>
            </div>
            <span style="color:red; margin-top: 10px;" id="error"></span>
            <div>
                <button id="btn_submit" type="submit"  class="site-btn">Đặt hàng</button>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
</section>
</div>
<%@include file="/WEB-INF/user/include/footer.jsp" %>
<script src="/assets/user/js/thuvien/jquery-3.3.1.min.js"></script>
<script src="/assets/user/js/thuvien/bootstrap.min.js"></script>
<script src="/assets/user/js/thuvien/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://esgoo.net/scripts/jquery.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var checkboxes = document.querySelectorAll('.group-checkbox');
    checkboxes.forEach(function(checkbox) {
      checkbox.addEventListener('change', function() {
        if (this.checked) {
          checkboxes.forEach(function(box) {
            if (box !== checkbox) {
              box.checked = false;
            }
          });
        }
      });
    });
  });
</script>
<script>
  $(document).ready(function () {
    $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function (data_tinh) {
      if (data_tinh.error == 0) {
        $.each(data_tinh.data, function (key_tinh, val_tinh) {
          $("#tinh").append('<option value="' + val_tinh.id + '" data-full-name="' + val_tinh.full_name + '">' + val_tinh.full_name + '</option>');
        });
      }
    });
    $("#tinh").change(function (e) {
      var idtinh = $(this).val();
      var fullNameTinh = $("#tinh option:selected").data('full-name');
      $.getJSON('https://esgoo.net/api-tinhthanh/2/' + idtinh + '.htm', function (data_quan) {
        if (data_quan.error == 0) {
          $("#quan").empty().append('<option value="0">--Chọn Quận Huyện--</option>');
          $("#phuong").empty().append('<option value="0">--Chọn Phường/ Xã/ Thị trấn--</option>');
          $.each(data_quan.data, function (key_quan, val_quan) {
            $("#quan").append('<option value="' + val_quan.id + '" data-full-name="' + val_quan.full_name + '">' + val_quan.full_name + '</option>');
          });
        }
      });
    });
    $("#quan").change(function (e) {
      var idquan = $(this).val();
      var fullNameQuan = $("#quan option:selected").data('full-name');
      $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function (data_phuong) {
        if (data_phuong.error == 0) {
          $("#phuong").empty().append('<option value="0">--Chọn Phường/ Xã/ Thị trấn--</option>');
          $.each(data_phuong.data, function (key_phuong, val_phuong) {
            $("#phuong").append('<option value="' + val_phuong.id + '" data-full-name="' + val_phuong.full_name + '">' + val_phuong.full_name + '</option>');
          });
        }
      });
    });
  });
</script>
<script>
  var context = "${pageContext.request.contextPath}";
  $(document).ready(function() {
    $('#btn_submit').click(function (event) {
      event.preventDefault();
      var fullName = $('#full_name').val();
      var phone = $('#phone').val();
      var address = $('#address').val();
      var fullNameTinh = $("#tinh option:selected").data('full-name');
      var fullNameQuan = $("#quan option:selected").data('full-name');
      var fullNamePhuong = $("#phuong option:selected").data('full-name');
      var email = $('#email').val();
      var atHome = $('#at-home').is(':checked');
      var id = '${param.id}';
      var quantity = '${param.quantity}';
      var cash = $('#cash').is(':checked');
      var momo = $('#momo').is(':checked');

      if (momo) {
        $.ajax({
          type: 'POST',
          data: {
            fullName: fullName,
            phone: phone,
            email: email,
            tinhText: fullNameTinh,
            quanText: fullNameQuan,
            phuongText: fullNamePhuong,
            txt_inv_addr1: address,
            txt_inv_customer: "${sessionScope.auth}",
            atHome: atHome,
            cash: cash,
            momo: momo,
            id: id,
            quantity: quantity
          },
          url: context + '/user/payByVNPay',
          success: handleResponse,
          error: handleError
        });
      } else if (cash) {
        $.ajax({
          type: 'POST',
          data: {
            fullName: fullName,
            phone: phone,
            email: email,
            tinh: fullNameTinh,
            quan: fullNameQuan,
            phuong: fullNamePhuong,
            address: address,
            atHome: atHome,
            cash: cash,
            id: id,
            quantity: quantity
          },
          url: context + '/user/checkout',
          success: handleResponse,
          error: handleError
        });
      } else {
        $('#error').html("Choose the type of payment");
      }
    });

    function handleResponse(response) {
      console.log(response);
      if (response.status !== "success") {
        $('#error').html(response.error);
      } else {
        window.location.href = context + "/user/success";
      }
    }

    function handleError() {
      $('#error').html("Connection errors. Please check your network and try again!");
    }
  });
</script>

</body>
</html>