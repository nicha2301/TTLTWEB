<%@ page import="vn.edu.hcmuaf.fit.model.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.service.impl.ProductService" %>
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
    <link rel="stylesheet" href="/assets/user/css/cart/order_detail.css" type="text/css" />
    <link rel="stylesheet" href="/assets/user/css/header&footer.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" href="https://tienthangvet.vn/wp-content/uploads/cropped-favicon-Tien-Thang-Vet-192x192.png"
          sizes="192x192" />
    <title>Chi tiết đơn hàng</title>
</head>
<body>
<div class="website-wrapper">
    <%@include file="/WEB-INF/user/include/header.jsp" %>
    <div class="page-title" style="background-image: url(https://tienthangvet.vn/wp-content/uploads/title-tag-tien-thang-vet-tsd1.jpg);">
        <div class="container">
            <h1 class="title">Chi tiết đơn hàng</h1>
        </div>
    </div>
    <section class="follow spad">
        <%--    <c:set var="or" value="${order}"></c:set>--%>
        <div class="container">
            <div class="row">
                <div class="col-lg">
                    <div class="Account__Style">
                        <div class="heading">
                            <span>Chi tiết đơn hàng #${requestScope.order.id}</span>
                            <span class="split">-</span>
                            <span class="status">
                                <c:set var="status" value="${requestScope.order.status}" />
                                <c:if test="${status.id == 1}">
                                    Chờ thanh toán
                                </c:if>
                                 <c:if test="${status.id == 2}">
                                    Chờ vận chuyển
                                </c:if>
                                 <c:if test="${status.id == 3}">
                                    Chờ giao hàng
                                </c:if>
                                  <c:if test="${status.id == 5}">
                                     Đã huỷ
                                 </c:if>
                                 <c:if test="${status.id == 6}">
                                     Trả hàng/ Hoàn tiền
                                 </c:if>
                                 <c:if test="${status.id == 7}">
                                    Chờ xử lý
                                </c:if>
                            </span>
                        </div>
                        <div class="created-date">Ngày đặt hàng: ${requestScope.order.dateCreated}</div>
                        <div class="styles_section-2">
                            <div class="styles_group_1">
                                <div class="title">Địa chỉ người nhận</div>
                                <div class="content">
                                    <p class="name">${requestScope.address.fullName}</p>
                                    <p class="address">
                                        <span>Địa chỉ: </span>
                                        ${requestScope.address.detailAddress}
                                    </p>
                                    <p class="phone"><span>Điện thoại: </span>${requestScope.address.phone}</p>
                                </div>
                            </div>
                            <div class="styles_group_1">
                                <div class="title">Hình thức giao hàng</div>
                                <div class="content">
                                    <p>Vận chuyển</p>
                                </div>
                            </div>
                            <div class="styles_group_1">
                                <div class="title">Hình thức thanh toán</div>
                                <div class="content">
                                    <c:set var="payment" value="${requestScope.order.payment}" />
                                    <c:if test="${payment.id == 1}">
                                        <p class="">Tiền mặt</p>
                                    </c:if>
                                    <c:if test="${payment.id == 2}">
                                        <p class="">Momo</p>
                                    </c:if>
                                    <c:if test="${payment.id == 3}">
                                        <p class="">VNPay</p>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <table class="styles_section-3">
                            <thead>
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Tạm tính</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                String ip = request.getHeader("X-FORWARDED-FOR");
                                if (ip == null) ip = request.getRemoteAddr();
                                List<OrderItem> items = (List<OrderItem>) request.getAttribute("item");
                                for (OrderItem orderItem : items) {
                                    Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(orderItem.getProduct(), ip, "user/order_detail.jsp");
                                    for(Map.Entry<Product, List<String>> product : products.entrySet()) {
                                        Product prod = product.getKey();
//                                        for (String img : product.getValue()) {
                            %>
                            <tr>
                                <td>
                                    <div class="product-item">
                                        <img src="${pageContext.request.contextPath}<%=product.getValue().get(0)%>" alt="<%=prod.getProductName()%>">
                                        <div class="product-info">
                                            <a class="product-name" href="${pageContext.request.contextPath}/user/product?id=<%=prod.getId()%>"><%=prod.getProductName()%></a>
                                            <p class="product-seller">Cung cấp bởi Thú Y The Pet </p>
                                        </div>
                                    </div>
                                    </td>
                                <td class="price"><%=Utils.formatCurrency((double) orderItem.getOrderPrice())%> VND</td>
                                    <td class="quantity"><%=orderItem.getQuantity()%></td>
                                <td class="raw-total"><%= Utils.formatCurrency((double) orderItem.getOrderPrice()*orderItem.getQuantity())%> VND</td>
                                </tr>
                            <%
                                }
                            }
                            %>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="4">
                                    <span>Tạm tính</span>
                                </td>
                                <td><%=Utils.formatCurrency((Integer) request.getAttribute("sum"))%>VND</td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <span>Phí vận chuyển</span>
                                </td>
                                <td><%= Utils.formatCurrency((double) request.getAttribute("ship"))%>VND</td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <span>Tổng cộng</span>
                                </td>
                                <td>
                                    <span class="sum"><%= Utils.formatCurrency((double) request.getAttribute("total_money"))%>VND</span>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                        <a class="view-list-order" href="${pageContext.request.contextPath}/user/updateinfouser">Quay lại đơn hàng của tôi</a>
                        <button class="cancel-order" style="color: white; background-color: red;" onclick="confirmCancelOrder()">Hủy Đơn Hàng</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 style="color:#7fad39 ;" class="modal-title" id="exampleModalLongTitle">Viết nhận xét</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- <div class="container-cm col-lg-12"> -->

                        <!-- <h5>ĐÁNH GIÁ SẢN PHẨM</h5> -->
                        <!-- <form id="form-cm"> -->
                        <!-- <label for="sao">Đánh giá của bạn về sản phẩm này</label> -->
                        <select class="fullname-cm" name="star" >
                            <option value="154" selected>😍 Rất tốt</option>
                            <option value="155">😀 Tốt</option>
                            <option value="156">🙂 Được</option>
                            <option value="157">😐 Tệ </option>
                            <option value="158">😌 Rất tệ</option>
                        </select>
                        <!-- <h6>Viết nhận xét của bạn vào bên dưới:</h6> -->
                        <input id="feedback" class="message" type="text" name="message" placeholder="Hãy chia sẻ những điều bạn thích về sản phẩm này nhé!" style="background-color: white"><br>
                        <label for="feedback">Thêm hình sản phẩm nếu có (tối đa 5 hình): </label> <button style="color: #ffffff;background-color:#5e6158;border-radius: 5px;" class="chonhinh">Chọn Hình</button> <br>
                        <button type="button" class="submit-cm" name="submit-cm">Gửi Nhận Xét</button>
                        <!--
                                        </form> -->

                        <!-- </div> -->
                        <!-- <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                          <button type="button" class="btn btn-primary">Save changes</button>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    <%@include file="/WEB-INF/user/include/footer.jsp" %>
</div>
<script src="/assets/user/js/thuvien/jquery-3.3.1.min.js"></script>
<script src="/assets/user/js/thuvien/bootstrap.min.js"></script>
<script src="/assets/user/js/thuvien/main.js"></script>
<script>
    function confirmCancelOrder() {
        // Sử dụng hộp thoại xác nhận
        var confirmation = confirm("Bạn có chắc chắn muốn hủy đơn hàng không?");

        // Nếu người dùng xác nhận, thực hiện hành động hủy đơn hàng
        if (confirmation) {
            cancelOrder();
        }
    }

    function cancelOrder() {
        // Thêm logic xử lý khi nút được nhấn
        // Ví dụ: hiển thị cảnh báo, gửi yêu cầu hủy đơn hàng, v.v.
    }
</script>
<script>
    function confirmCancelOrder() {
        // Kiểm tra trạng thái đơn hàng
        var status = "";

        // Nếu đơn hàng đang ở trạng thái "Đang giao hàng" hoặc "Giao hàng thành công", không cho phép hủy
        if (status === "Đang giao hàng" || status === "Giao hàng thành công") {
            alert("Không thể hủy đơn hàng ở trạng thái " + status);
        } else {
            // Nếu không ở trạng thái trên, hiển thị hộp thoại xác nhận
            var confirmation = confirm("Bạn có chắc chắn muốn hủy đơn hàng không?");

            // Nếu người dùng xác nhận, thực hiện hành động hủy đơn hàng
            if (confirmation) {
                cancelOrder();
            }
        }
    }
    function cancelOrder() {
        // Thêm logic xử lý khi nút được nhấn
        // Ví dụ: hiển thị cảnh báo, gửi yêu cầu hủy đơn hàng, v.v.
    }
</script>
</body>
</html>