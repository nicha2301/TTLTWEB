<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/assets/user/css/products/detailproduct.css"/>
    <link rel="icon" href="https://tienthangvet.vn/wp-content/uploads/cropped-favicon-Tien-Thang-Vet-192x192.png"
          sizes="192x192"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>Chi tiết sản phẩm</title>
</head>
<body>
<div class="website-wrapper">
    <%@include file="/WEB-INF/user/include/header.jsp" %>
    <div class="body">
        <div class="wrapper-content">
            <div class="content">
                <div class="single-breadcrumbs-wrapper">
                    <c:choose>
                        <c:when test="${not empty requestScope.product}">
                            <c:forEach var="entry" items="${requestScope.product}" >
                                <c:set var="prod" value="${entry.key}" />
                                <c:set var="supplier" value="${prod.supplier}" />
                                <c:set var="firstImage" value="${entry.value[0]}" />
                                <c:set var="listImg" value="${entry.value}" />
                            </c:forEach>
                        </c:when>
                    </c:choose>
                    <div class="container">
                        <div class="wd-breadcrumbs">
                            <nav class="woocommerce-breadcrumb">
                                <a href="${request.servletContext.contextPath}/user/home" class="breadcrumb-link">Trang chủ</a>
                                <a href="${request.servletContext.contextPath}/user/products" class="breadcrumb-link">Sản phẩm</a>
                                <span class="breadcrumb-last">
                                      <span class="breadcrumb-last"> ${prod.productName}</span>
                                </span>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="product-images">
                        <div class="product-images-inner">
                            <div class="col-12">
                                <div class="owl-stage">
                                    <div class="item" style="width: 575px; height: 575px">
                                        <div class="product-image-wrap">
                                            <img src="${pageContext.request.contextPath}${firstImage}"
                                                 class="wp-post-image wp-post-image"/>
                                        </div>
                                    </div>
                                    <div class="product-additional-galleries">
                                        <a id="see-more"
                                           href="${pageContext.request.contextPath}${firstImage}"
                                           class="woodmart-show-product-gallery">
                                            <i class="fa-solid fa-compress"></i>
                                            <span class="see-more">Click to enlarge</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="owl-stage-outer" style="margin-top: 10px">
                                    <div class="owl-stage">
                                        <c:forEach var="url" items="${listImg}">
                                            <div class="item" style="width: 145.25px">
                                                <div class="product-image-thumbnail">
                                                    <img width="150" height="150" src="${pageContext.request.contextPath}${url}"/>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="detail-product">
                        <div class="summary-inner set-mb-l reset-last-child">
                            <div class="wd-product-brands">
                                <a href="">
                                    <img src="${supplier.imageUrl}" alt="Supplier Image"/>
                                </a>
                            </div>
                            <h1 class="product_title entry-title wd-entities-title">
                                ${prod.productName}
                            </h1>
                            <div class="price-wrapper">
                                <div class="price">
                                    <c:set var="unit" value="VND"/>
                                    <fmt:formatNumber value="${prod.price}" type="number" maxFractionDigits="0" pattern="#,##0"/> ${unit}
                                </div>
                            </div>
                            <div class="wd-compare-btn product-compare-button wd-action-btn wd-style-text wd-compare-icon">
                                <a href="">
                                    <i class="fa-solid fa-shuffle"></i>
                                    <span>So sánh</span>
                                </a>
                            </div>
                            <div class="wd-wishlist-btn wd-action-btn wd-style-text wd-wishlist-icon">
                                <a class="" href="">
                                    <i class="fa-regular fa-heart"></i>
                                    <span>Yêu thích</span>
                                </a>
                            </div>
                            <div class="product_meta">
                                    <span class="posted_in"><span class="meta-label">Danh mục:</span>
                                        <a href="${pageContext.request.contextPath}/user/products?group=Thuốc%20thú%20y" rel="tag">Thuốc thú y</a></span>
                            </div>
                            <div class="container">
                                <a style="color: #fff;" href="javascript:void(0)" onclick="addCart(this, '${prod.id}')">
                                    <button class="add-to-cart-button">
                                        <svg class="add-to-cart-box box-1" width="24" height="24" viewBox="0 0 24 24"
                                             fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <rect width="24" height="24" rx="2" fill="#ffffff"/>
                                        </svg>
                                        <svg class="add-to-cart-box box-2" width="24" height="24" viewBox="0 0 24 24"
                                             fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <rect width="24" height="24" rx="2" fill="#ffffff" />
                                        </svg>
                                        <svg class="cart-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                             viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2"
                                             stroke-linecap="round" stroke-linejoin="round">
                                            <circle cx="9" cy="21" r="1"></circle>
                                            <circle cx="20" cy="21" r="1"></circle>
                                            <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6">
                                            </path>
                                        </svg>
                                        <svg class="tick" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                             viewBox="0 0 24 24">
                                            <path fill="none" d="M0 0h24v24H0V0z"/>
                                            <path fill="#ffffff"
                                                  d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zM9.29 16.29L5.7 12.7c-.39-.39-.39-1.02 0-1.41.39-.39 1.02-.39 1.41 0L10 14.17l6.88-6.88c.39-.39 1.02-.39 1.41 0 .39.39.39 1.02 0 1.41l-7.59 7.59c-.38.39-1.02.39-1.41 0z"/>
                                        </svg>
                                        <span class="add-to-cart">Thêm vào giỏ hàng</span>
                                        <span class="added-to-cart">Đã thêm</span>
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="wrapper-content">
            <div class="product-tabs-wrapper">
                <div class="container">
                    <div class="poduct-tabs-inner">
                        <div class="woocommerce-tabs wc-tabs-wrapper tabs-layout-tabs" data-state="first"
                             data-layout="tabs">
                            <div class="wd-nav-wrapper wd-nav-tabs-wrapper text-center">
                                <ul class="wd-nav wd-nav-tabs wd-icon-pos-left tabs wc-tabs wd-style-underline-reverse"
                                    role="tablist">
                                    <li class="description_tab active" id="tab-title-description" role="tab"
                                        aria-controls="tab-description">
                                        <a class="wd-nav-link" href="#tab-description">
                                                <span class="nav-link-text wd-tabs-title">
                                                    Mô tả
                                                </span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="wd-accordion-item">
                                <div class="entry-content woocommerce-Tabs-panel woocommerce-Tabs-panel--description wd-active panel wc-tab"
                                     id="tab-description" role="tabpanel" aria-labelledby="tab-title-description"
                                     data-accordion-index="description" style="display: block">
                                    <div class="wc-tab-inner">
                                        <div data-elementor-type="product-post" data-elementor-id="37778"
                                             class="elementor elementor-37778">
                                            <section
                                                    class="wd-negative-gap elementor-section elementor-top-section elementor-element elementor-element-493d2218 elementor-section-boxed elementor-section-height-default elementor-section-height-default wd-section-disabled"
                                                    data-id="493d2218" data-element_type="section">
                                                <div class="elementor-container elementor-column-gap-default">
                                                    <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-56ddef75"
                                                         data-id="56ddef75" data-element_type="column">
                                                        <div
                                                                class="elementor-widget-wrap elementor-element-populated">
                                                            <div class="elementor-element elementor-element-1400a071 color-scheme-inherit text-left elementor-widget elementor-widget-text-editor"
                                                                 data-id="1400a071" data-element_type="widget"
                                                                 data-widget_type="text-editor.default">
                                                                <div class="elementor-widget-container">
                                                                    <h1>Công dụng:</h1>
                                                                    <p>
                                                                        ${prod.purpose}
                                                                    </p>
                                                                    <h1>Thành phần:</h1>
                                                                    <p>${prod.ingredients}</p>
                                                                    <h2>Liều lượng: ${prod.dosage} </h2>
                                                                    <h2>Hướng dẫn sử dụng:</h2>
                                                                    <p>
                                                                        ${prod.instructions}
                                                                    </p>
                                                                    <h2>Đối tượng: ${prod.type.typeName} </h2>
                                                                    <h2>CHỐNG CHỈ ĐỊNH:</h2>
                                                                    <p>
                                                                         ${prod.contraindications}<br/>
                                                                    </p>
                                                                    <h2>
                                                                        BẢO QUẢN<br/> ${prod.storageCondition}<br/>
                                                                    </h2>
                                                                    <h2>Hạn sử dụng: ${prod.warrantyPeriod}</h2>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="wrapper-content">
            <div class="container related-and-upsells">
                <div class="related-products">
                    <h3 class="title slider-title">Sản phẩm tương tự</h3>
                    <div class="products">
                        <div class="wrapper-container">
                            <div class="container">
                                <c:choose>
                                    <c:when test="${not empty requestScope.products}">
                                        <c:forEach var="item" items="${requestScope.products}" >
                                            <c:set var="similar" value="${item.key}" />
                                            <c:set var="first" value="${item.value[0]}" />
                                            <c:set var="listImages" value="${item.value}" />
                                            <div class="item">
                                                <div>
                                                    <div class="product-element-top">
                                                        <a href="${pageContext.request.contextPath}/user/product?id=${similar.id}">
                                                            <img src="${pageContext.request.contextPath}${first}" alt="">
                                                        </a>
                                                    </div>
                                                    <div class="product-element-bottom">
                                                        <a href="${pageContext.request.contextPath}/user/product?id=${similar.id}">
                                                                ${similar.productName}
                                                        </a>
                                                    </div>
                                                    <div class="product-element">
                                                        <div class="price-wrap">
                                                            <div class="price">
                                                                <fmt:formatNumber value="${similar.price}" type="number" maxFractionDigits="0" pattern="#,##0"/> ${unit}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="wd-buttons wd-pos-r-t">
                                                    <div class="wd-add-btn wd-action-btn wd-style-icon wd-add-cart-icon">
                                                        <a href="" class="button product_type_simple add-to-cart-loop">
                                                    <span>
                                                        <i class="fa-solid fa-cart-shopping"></i> </span></a>
                                                    </div>
                                                    <div class="quick-view wd-action-btn wd-style-icon wd-quick-view-icon">
                                                        <a href="" class="open-quick-view quick-view-button">
                                                    <span>
                                                        <i class="fa-solid fa-magnifying-glass"></i> </span></a>
                                                    </div>
                                                    <div class="wd-wishlist-btn wd-action-btn wd-style-icon wd-wishlist-icon">
                                                        <a class="wd-tltp wd-tooltip-inited" href=""
                                                           data-added-text="Browse Wishlist">
                                                    <span class="wd-tooltip-label">
                                                        <i class="fa-regular fa-heart"></i> </span></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/user/include/footer.jsp" %>
</div>
<script src="/assets/user/js/detailProduct/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function addCart(btn, id) {
        $.ajax({
            url: "cart",
            method: "POST",
            data: {
                id: id,
                action: "add",
                type: 0
            },
            success: function (response) {
                var res = JSON.parse(response);
                Swal.fire({
                    position: "center",
                    icon: "success",
                    title: "Thêm Sản Phẩm Vào Giỏ Hàng Thành Công!",
                    showConfirmButton: false,
                    timer: 1500
                });
                const badge = document.getElementById("badge");
                badge.innerHTML = res.totalItems;
            }
        });
    }
</script>
</body>
</html>