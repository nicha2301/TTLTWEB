<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/taglib.jsp" %>
<html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/assets/user/css/products/styles.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="icon" href="https://tienthangvet.vn/wp-content/uploads/cropped-favicon-Tien-Thang-Vet-192x192.png"
          sizes="192x192"/>
    <title>Sản phẩm</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<div class="website-wrapper">
    <%@include file="/WEB-INF/user/include/header.jsp" %>
    <div class="body">
        <div class="page-title" style="background-image: url(https://tienthangvet.vn/wp-content/uploads/title-tag-tien-thang-vet-tsd1.jpg);">
            <div class="container">
                <h1 class="title">
                    <c:choose>
                        <c:when test="${not empty requestScope.searchTerm}">
                            Kết quả tìm kiếm cho: ${requestScope.searchTerm}
                        </c:when>
                        <c:otherwise>
                            Sản phẩm
                        </c:otherwise>
                    </c:choose>
                </h1>
            </div>
        </div>
        <div class="container">
            <div class="columns">
                <aside class="sidebar">
                    <div class="widget-area">
                        <div id="categories-1" class="widget">
                            <span class="widget-title">Danh mục sản phẩm</span>
                            <ul class="wd-swatches-filter wd-filter-list wd-labels-on wd-size-normal wd-layout-list wd-text-style-1 wd-bg-style-4 wd-shape-round wd-scroll-content">
                            <c:choose>
                                <c:when test="${not empty requestScope.groups}">
                                    <c:forEach var="group" items="${requestScope.groups}">
                                        <li class="wc-layered-nav-term wd-swatch-wrap">
                                            <a href="${request.servletContext.contextPath}/user/products?group=${group.key}" class="layered-nav-link">
                                                <span class="wd-swatch wd-bg"></span>
                                                <span class="wd-filter-lable layer-term-lable">${group.key}</span>
                                            </a>
                                            <span class="count">${group.value}</span>
                                        </li>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                            </ul>
                        </div>
                        <div id="categories-2" class="widget">
                            <span class="widget-title">Nhóm sản phẩm</span>
                            <div class="wd-scroll" style="max-height: 280px;overflow: auto;">
                                <ul class="wd-swatches-filter wd-filter-list wd-labels-on wd-size-normal wd-layout-list wd-text-style-1 wd-bg-style-4 wd-shape-round wd-scroll-content">
                                <c:choose>
                                    <c:when test="${not empty requestScope.objects}">
                                        <c:forEach var="object" items="${requestScope.objects}">
                                            <li class="wc-layered-nav-term">
                                                <a rel="nofollow noopener" href="${request.servletContext.contextPath}/user/products?category=${object.key}" class="layered-nav-link">
                                                    <span class="wd-filter-lable layer-term-lable">${object.key}</span>
                                                </a>
                                                <span class="count">${object.value}</span>
                                            </li>
                                        </c:forEach>
                                    </c:when>
                                </c:choose>
                                </ul>
                            </div>
                        </div>
                        <div id="categories-3" class="widget">
                            <span class="widget-title">Lọc theo đối tượng</span>
                            <div class="wd-scroll" style="max-height: 280px;overflow: auto;">
                                <ul class="wd-swatches-filter wd-filter-list wd-labels-on wd-size-normal wd-layout-list wd-text-style-1 wd-bg-style-4 wd-shape-round wd-scroll-content">
                                <c:choose>
                                    <c:when test="${not empty requestScope.proTypes}">
                                        <c:forEach var="protype" items="${requestScope.proTypes}">
                                            <li class="wc-layered-nav-term">
                                                <a rel="nofollow noopener" href="${request.servletContext.contextPath}/user/products?type=${protype.key}" class="layered-nav-link">
                                                    <span class="wd-filter-lable layer-term-lable">${protype.key}</span>
                                                </a>
                                                <span class="count">${protype.value}</span>
                                            </li>
                                        </c:forEach>
                                    </c:when>
                                </c:choose>
                                </ul>
                            </div>
                        </div>
                    </div>
                </aside>
                <!-- Content -->
                <div class="content">
                    <!-- Breadcrumbs -->
                    <div class="shop-loop-head">
                        <div class="wd-shop-tools">
                            <div class="wd-breadcrumbs">
                                <nav class="woocommerce-breadcrumb">
                                    <a href="${request.servletContext.contextPath}/user/home" class="breadcrumb-link">Trang chủ</a>
                                    <a href="${request.servletContext.contextPath}/user/products" class="breadcrumb-link">Sản phẩm</a>
                                    <c:choose>
                                        <c:when test="${not empty requestScope.selectedGroup}">
                                            <a href="" class="breadcrumb-link">${requestScope.selectedGroup}</a>
                                        </c:when>
                                        <c:when test="${not empty requestScope.selectedType}">
                                            <a href="" class="breadcrumb-link">${requestScope.selectedType}</a>
                                        </c:when>
                                        <c:when test="${not empty requestScope.selectedCategory}">
                                            <a href="" class="breadcrumb-link"> ${requestScope.selectedCategory}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${not empty requestScope.url}">
                                                    <a href="" class="breadcrumb-link">Kết quả tìm kiếm cho: ${requestScope.url}</a>
                                                </c:when>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <!-- Danh sách sản phẩm -->
                    <div class="wrapper-container">
                        <div class="container" id="content">
                            <c:choose>
                                <c:when test="${empty requestScope.product or requestScope.product.size() == 0}">
                                    <div class="no-products-found">
                                        <p>Xin lỗi, không tìm thấy sản phẩm nào có tên này.</p>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="entry" items="${product}">
                                        <c:set var="product" value="${entry.key}" />
                                        <c:set var="first" value="${entry.value[0]}" />
                                        <div class="item">
                                            <!-- Hiển thị thông tin sản phẩm -->
                                            <div>
                                                <div class="product-element-top">
                                                    <a href="${pageContext.request.contextPath}/user/product?id=${product.id}">
                                                        <img src="${pageContext.request.contextPath}${first}" alt="">
                                                    </a>
                                                </div>
                                                <div class="product-element-bottom">
                                                    <a href="${pageContext.request.contextPath}/user/product?id=${product.id}">
                                                            ${product.productName}
                                                    </a>
                                                </div>
                                                <div class="product-element">
                                                    <div class="price-wrap">
                                                        <div class="price">
                                                            <c:set var="unit" value="VND"/>
                                                            <fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="0" pattern="#,##0"/> ${unit}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="wd-buttons wd-pos-r-t">
                                                <div class="wd-add-btn wd-action-btn wd-style-icon wd-add-cart-icon">
                                                    <a href="${request.servletContext.contextPath}/user/addtocart?id=${product.id}"
                                                        class="button product_type_simple add-to-cart-loop" aria-label="">
                                                        <span>
                                                            <i class="fa-solid fa-cart-shopping"></i>
                                                        </span>
                                                    </a>
                                                </div>
                                                <div class="quick-view wd-action-btn wd-style-icon wd-quick-view-icon">
                                                    <a href="" class="open-quick-view quick-view-button">
                                                        <span>
                                                            <i class="fa-solid fa-magnifying-glass"></i>
                                                        </span>
                                                    </a>
                                                </div>
                                                <div class="wd-wishlist-btn wd-action-btn wd-style-icon wd-wishlist-icon">
                                                    <a class="wd-tltp wd-tooltip-inited" href="" data-added-text="Browse Wishlist">
                                                        <span class="wd-tooltip-label">
                                                            <i class="fa-regular fa-heart"></i>
                                                        </span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <!-- Phân trang -->
                    <div class="pagination">
                        <ul class="pagination-wrapper">
                            <c:if test="${requestScope.currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/user/products?page=${requestScope.currentPage - 1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${requestScope.currentPage >= 4 && requestScope.totalPages > 15}">
                                <li class="page-item disabled">
                                    <span class="page-link ellipsis" >...</span>
                                </li>
                            </c:if>
                            <!-- Hiển thị các trang -->
                            <c:forEach begin="${requestScope.currentPage - 2 > 0 ? requestScope.currentPage - 2 : 1}" end="${requestScope.currentPage + 2 <= requestScope.totalPages ? requestScope.currentPage + 2 : requestScope.totalPages}" var="page">
                                <li class="page-item ${page == requestScope.currentPage ? 'active' : ''}">
                                    <a class="page-link" href="${pageContext.request.contextPath}/user/products?page=${page}">${page}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${requestScope.currentPage + 2 < requestScope.totalPages && requestScope.totalPages > 15}">
                                <li class="page-item disabled">
                                    <span class="page-link ellipsis">...</span>
                                </li>
                            </c:if>
                            <c:if test="${requestScope.currentPage < requestScope.totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/user/products?page=${requestScope.currentPage + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/user/include/footer.jsp" %>
    </div>
<%--    <script src="../.."></script>--%>
    <script>
        window.addEventListener("scroll", () => {
            var header = document.querySelector(".container");
            header.classList.toggle("sticky", window.scrollY > 100);
        })
        function searchByName(param) {
            var txtSearch = param.value;
            $.ajax({
                url: "${pageContext.request.contextPath}/user/products",
                type: "POST",
                data: {
                    searchTerm: txtSearch
                },
                success: function (data) {
                    var row = document.getElementById("content");
                    row.innerHTML = data;
                },
                error: function (xhr) {

                }
            });
        }
    </script>

</body>
<style>
    span.page-link.ellipsis {
        text-decoration: none;
        border: 1px solid #dee2e6;
        padding: 6px 12px;
    }
</style>
</html>