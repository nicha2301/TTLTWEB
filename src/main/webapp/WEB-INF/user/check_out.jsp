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
        </h6>
      </div>
    </div>
    <h4>Chi tiết đơn hàng</h4>
    <form>

      <div class="row">
        <div class="col-lg-8 col-md-6">
          <div class="row">
            <div class="col-lg-6">
              <div class="checkout__input">
                <p>Họ và tên<span>*</span></p>
                <input type="text" id="full_name" required />
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
            <select id="tinh" name="tinh" title="Chọn Tỉnh Thành">
              <option value="0">Tỉnh Thành</option>
            </select>
          </div>

          <div class="checkout__input">
            <p>Huyện / Quận<span>*</span></p>
            <select id="quan" name="quan" title="Chọn Quận Huyện">
              <option value="0">Quận Huyện</option>
            </select>
          </div>

          <div class="checkout__input">
            <p>Xã / Phường / Thị trấn<span>*</span></p>
            <select id="phuong" name="phuong" title="Chọn Phường Xã">
              <option value="0">Phường Xã</option>
            </select>
          </div>

          <div class="row">
            <div class="col-lg-6">
              <div class="checkout__input">
                <p>Email<span>*</span></p>
                <input type="email" id="email" name="email" required />
              </div>
            </div>
            <div class="col-lg-6">
              <div class="checkout__input">
                <p>At Home?<span></span></p>
                <input type="checkbox" id="at-home" name="at-home">
              </div>
            </div>
          </div>

        </div>
        <div class="col-lg-4 col-md-6">
          <div class="checkout__order">
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
                for (CartItem item : temp) {
                  Product p = new Product(item.getProduct().getId());
                  Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(p, ip, "/user/checkout.jsp");
                  for (Map.Entry<Product, List<String>> entry : products.entrySet()) {
              %>
                <div class="checkout__order__subtotal">
                  <p>Tên sản phẩm: <%=entry.getKey().getProductName()%></p>
                  <p>Giá bán: <fmt:formatNumber value="<%=entry.getKey().getPrice()%>" type="number" maxFractionDigits="0" pattern="#,##0"/> ${unit} ${unit}</p>
                  <p>Số lượng: <%=item.getQuantity()%></p>
                </div>
              <%
                  }
                }
              %>
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
                <span class="checkmark"  ></span>
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
      var cash = $('#cash').is(':checked');
      var momo = $('#momo').is(':checked');
      var id = '${param.id}';
      var quantity = '${param.quantity}';
      console.log(fullName, phone, address, fullNameTinh,  fullNameQuan, fullNamePhuong, email, atHome, momo, cash, id, quantity)
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
          momo: momo,
          cash: cash,
        },
        url: '${pageContext.request.contextPath}/user/checkout',
        success: function (response) {
          console.log(response)
          try {
            if (response.status !== "success") {
              $('#error').html(response.error);
            } else {
              window.location.href = context + "/user/order_success.jsp";
            }
          } catch (e) {
            $('#error').html("Error loading request, please try again!");
          }
        },
        error: function() {
          $('#error').html("Connection errors. Please check your network and try again!");
        }
      });
    });
  });
</script>
</body>
</html>