<%@ page import="vn.edu.hcmuaf.fit.model.Utils" %>
<%@ page import="java.util.Date" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Quản lý sản phẩm</title>
    <link rel="icon" href="https://tienthangvet.vn/wp-content/uploads/cropped-favicon-Tien-Thang-Vet-192x192.png" sizes="192x192" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/assets/admin/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="/assets/admin/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="/assets/admin/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/assets/admin/css/font-awesome.min.css">

    <!-- Datatables CSS -->
    <link rel="stylesheet" href="/assets/admin/plugins/datatables/datatables.min.css">
    <!-- Datepicker CSS -->
    <link rel="stylesheet" href="/assets/admin/css/bootstrap-datetimepicker.min.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="/assets/admin/css/animate.min.css">
    <!-- Select CSS -->
    <link rel="stylesheet" href="/assets/admin/css/select2.min.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="/assets/admin/css/admin.css">
</head>
<body>
<div class="main-wrapper">
    <%-- Include menu.jsp --%>
    <jsp:include page="include/menu.jsp"></jsp:include>
    <div class="page-wrapper">
        <div class="content container-fluid">
            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">Sản phẩm</h3>
                    </div>
                    <div class="col-auto text-right">
                        <a class="btn btn-white filter-btn" href="javascript:void(0);" id="filter_search">
                            <i class="fas fa-filter"></i>
                        </a>
                        <a href="add-product?type=enterAdd" class="btn btn-primary add-button ml-3">
                            <i class="fas fa-plus"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-center mb-0 datatable">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Ảnh</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Giá bán</th>
                                        <th>Số lượng</th>
                                        <th>ID nhà cung cấp</th>
                                        <th class="text-right">Hành Động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="entry" items="${productMap}">
                                        <c:set var="product" value="${entry.key}" />
                                        <c:set var="images" value="${entry.value}" />
                                        <tr>
                                            <td>${product.id}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty images}">
                                                        <img class="rounded service-img mr-1" src="${pageContext.request.contextPath}${entry.value[0]}" alt="Hình ảnh sản phẩm">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img class="rounded service-img mr-1" src="${pageContext.request.contextPath}/default-image-url" alt="Hình ảnh mặc định">
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${product.productName}</td>
                                            <td>${fn:substring(Utils.formatCurrency(product.price), 0, fn:length(Utils.formatCurrency(product.price)) - 2)} VND</td>
                                            <td>${product.quantity}</td>
                                            <td>${product.supplier.getId()}</td>
                                            <td class="text-right">
                                                <a href="edit-product?type=enterEdit&id=${product.id}" class="btn btn-sm bg-success-light">
                                                    <i class="far fa-edit mr-1"></i> Sửa
                                                </a>
                                                <a href="#" onclick="confirmDeleteProduct(${product.id});" style="margin-top: 5px; color: red;" class="btn btn-outline-danger btn-sm">
                                                    <i class="fa fa-trash-o"></i> Xóa
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- jQuery -->
<script src="assets/js/jquery-3.5.0.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="assets/js/popper.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- Datepicker Core JS -->
<script src="assets/js/moment.min.js"></script>
<script src="assets/js/bootstrap-datetimepicker.min.js"></script>

<!-- Datatables JS -->
<script src="assets/plugins/datatables/datatables.min.js"></script>

<!-- Select2 JS -->
<script src="assets/js/select2.min.js"></script>

<!-- Custom JS -->
<script src="assets/js/admin.js"></script>
<script>
    function confirmDeleteProduct(productId) {
        if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này không?")) {
            // Chuyển hướng đến Servlet để xóa sản phẩm
            window.location.href = "./delete-product?id=" + productId;
        }
    }
</script>


</body>
</html>
