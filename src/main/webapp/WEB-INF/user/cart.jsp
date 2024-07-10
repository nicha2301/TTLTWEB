<%@ page import="vn.edu.hcmuaf.fit.model.ShoppingCart" %>
<%@ page import="vn.edu.hcmuaf.fit.model.CartItem" %>
<%@include file="/WEB-INF/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Utils" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/assets/user/css/thuvien/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/cart/cart.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="icon" href="https://tienthangvet.vn/wp-content/uploads/cropped-favicon-Tien-Thang-Vet-192x192.png"
          sizes="192x192"/>
    <title>Giỏ hàng</title>
</head>
<body>
<div class="website-wrapper">
    <%@include file="/WEB-INF/user/include/header.jsp" %>
    <div class="page-title" style="
            background-image: url(https://tienthangvet.vn/wp-content/uploads/title-tag-tien-thang-vet-tsd1.jpg);
          ">
        <div class="container">
            <h1 class="title">Giỏ hàng</h1>
        </div>
    </div>


    <!-- Breadcrumb Section End -->
    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <%
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            if (cart == null || cart.isEmpty()) {
        %>
        <h1 style="text-align: center">Vui lòng mua sắm</h1>
        <%} else {%>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                            <tr>
                                <th class="shoping__product">Sản phẩm</th>
                                <th>Giá bán</th>
                                <th>Số lượng</th>
                                <th>Tổng</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for (CartItem item : cart.getProducts().values()) {
                            %>
                            <tr>
                                <td class="shoping__cart__item">
                                    <img src="${pageContext.request.contextPath}/<%=item.getProduct().getImageUrl()%>" alt="">

                                    <h5><%=item.getProduct().getProductName()%>
                                    </h5>
                                </td>
                                <td class="shoping__cart__price">
                                    <%= Utils.formatCurrency(item.getProduct().getPrice()) %> VND
                                </td>
                                <td class="shoping__cart__quantity">
                                    <div class="quantity"
                                         style="align-items: center;display: flex;justify-content: center;">
                                        <div class="pro-qty"
                                             style="display: flex;justify-content: center;align-items: center;">
                                            <a style="padding: 0 10px;"
                                               href="updatecart?action=decrement&id=<%=item.getProduct().getId()%>">-</a>
                                            <form action="updatecart?action=update&id=<%=item.getProduct().getId()%>"
                                                  method="post">
                                                <input type="text" name="amount" value="<%=item.getQuantity()%>">
                                            </form>
                                            <a style="padding: 0 10px;"
                                               href="updatecart?action=increment&id=<%=item.getProduct().getId()%>">+</a>
                                        </div>
                                    </div>
                                </td>
                                <td class="shoping__cart__total">
                                    <%= Utils.formatCurrency(item.getTotalPrice()) %> VND
                                </td>
                                <td class="shoping__cart__item__close">
                                    <a style="font-size: 18px;background-color: white"
                                       href="updatecart?action=delete&id=<%=item.getProduct().getId()%>">X</a>
                                </td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="products" class="primary-btn cart-btn">TIẾP TỤC MUA SẮM</a>
                    </div>
                </div>
                <div class="custom-row">
                    <div class="custom-col">
                        <div class="shoping__continue">
                            <div class="shoping__discount">
                                <h5>Mã giảm giá</h5>
                                <form>
                                    <input type="text" name="discount" placeholder="Nhập mã giãm giá mua hàng">
                                    <button class="site-btn">SỬ DỤNG MÃ</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="custom-col">
                        <div class="shoping__checkout">
                            <h5>TỔNG TIỀN GIỎ HÀNG</h5>
                            <ul>
                                <li>Giảm<span>${ Util.formatCurrency(cart.totalPrice - cart.priceSaled) } VND</span></li>
                                <li>Tổng<span>${ Util.formatCurrency(cart.priceSaled) } VND</span></li>
                            </ul>

                            <c:choose>
                                <c:when test="${empty sessionScope.auth}">
                                    <a href="signin" class="primary-btn">Vui lòng đăng nhập để thực hiện thanh toán</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="checkout" class="primary-btn">TIẾN HÀNH THANH TOÁN</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <%}%>
    </section>


    <%@include file="/WEB-INF/user/include/footer.jsp" %>
</div>
<script>
    window.addEventListener('scroll', () => {
        var header = document.querySelector('.container')
        header.classList.toggle('sticky', window.scrollY > 100)
    })
</script>

</body>

</html>