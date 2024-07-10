
<%@ page import="vn.edu.hcmuaf.fit.model.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="/WEB-INF/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>${title}</title>
    <link href="/assets/admin/img/icon/icon-logo.png" rel="shortcut icon">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/assets/admin/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="/assets/admin/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="/assets/admin/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/assets/admin/css/font-awesome.min.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="/assets/admin/css/animate.min.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="/assets/admin/css/admin.css">

</head>

<body>
<div class="main-wrapper">
    <%@include file="/WEB-INF/admin/include/menu.jsp" %>

    <div class="page-wrapper">
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col-12">
                        <h3 class="page-title">Dashboard</h3>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->
            <div class="row">
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="dash-widget-header">
									<span class="dash-widget-icon bg-primary">
										<i class="far fa-user"></i>
									</span>
                                <div class="dash-widget-info">
                                    <h3>${c_user}</h3>
                                    <h6 class="text-muted">Người dùng</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="dash-widget-header">
									<span class="dash-widget-icon bg-primary">
										<i class="fas fa-qrcode"></i>
									</span>
                                <div class="dash-widget-info">
                                    <h3>${c_product}</h3>
                                    <h6 class="text-muted">Sản phẩm</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="dash-widget-header">
									<span class="dash-widget-icon bg-primary">
										<i class="fas fa-user-shield"></i>
									</span>
                                <div class="dash-widget-info">
                                    <h3>${c_supplier}</h3>
                                    <h6 class="text-muted">Nhà cung cấp</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 d-flex">
                    <!-- Recent Bookings -->
                    <div class="card card-table flex-fill">
                        <div class="card-header">
                            <h4 class="card-title">Đặt hàng gần đây</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-center">
                                    <thead>
                                    <tr>
                                        <th>Tên khách hàng</th>
                                        <th>Ngày đặt</th>
                                        <th>Trạng thái</th>
                                        <th>Tổng tiền</th>
                                    </tr>
                                    </thead>
                                    <tbody>
<%--                                    <c:forEach items="${orderlist}" var="ol">--%>
<%--&lt;%&ndash;                                        <c:set var="totalPay" value="${ol.totalPay}"></c:set>&ndash;%&gt;--%>
<%--                                        <tr>--%>
<%--                                            <td>${ol.username}</td>--%>
<%--                                            <td class="text-nowrap">${Util.formatTimestamp(ol.dateCreated)}</td>--%>
<%--                                           <td>--%>
<%--                                               <c:if test="${ol.status eq 1}"><span class="badge badge-info">Chờ Thanh Toán</span></c:if>--%>
<%--                                               <c:if test="${ol.status eq 2}"><span class="badge badge-danger">Chờ vận chuyển</span></c:if>--%>
<%--                                               <c:if test="${ol.status eq 3}"><span class="badge badge-warning">Chờ giao hàng</span></c:if>--%>
<%--                                               <c:if test="${ol.status eq 4}"><span class="badge badge-dark"> Chờ đánh giá</span></c:if>--%>
<%--                                               <c:if test="${ol.status eq 5}"><span class="badge badge-success">Đã huỷ</span></c:if>--%>
<%--                                               <c:if test="${ol.status eq 6}"><span class="badge badge-success">Trả hàng/ Hoàn tiền</span></c:if>--%>
<%--                                           </td>--%>
<%--                                            <td>--%>
<%--&lt;%&ndash;                                                <div class="font-weight-600"><%= Utils.formatCurrency((double)pageContext.getAttribute("totalPay")) %>VND</div>&ndash;%&gt;--%>
<%--                                            </td>--%>

<%--                                        </tr>--%>
<%--                                    </c:forEach>--%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- /Recent Bookings -->

                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!-- jQuery -->
<script src="/assets/admin/js/jquery-3.5.0.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="/assets/admin/js/popper.min.js"></script>
<script src="/assets/admin/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- Custom JS -->
<script src="/assets/admin/js/admin.js"></script>

</body>

</html>