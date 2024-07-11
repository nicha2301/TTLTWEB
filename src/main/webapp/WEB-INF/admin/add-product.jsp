<%@ page import="vn.edu.hcmuaf.fit.model.ProductGroups" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Thêm sản phẩm</title>
    <link rel="icon" href="https://tienthangvet.vn/wp-content/uploads/cropped-favicon-Tien-Thang-Vet-192x192.png"
          sizes="192x192"/>

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

    <!-- Select CSS -->
    <link rel="stylesheet" href="/assets/admin/css/select2.min.css">
</head>

<body>
<div class="main-wrapper">

    <jsp:include page="include/menu.jsp"></jsp:include>

    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="row">
                <div class="col-xl-8 offset-xl-2">

                    <!-- Page Header -->
                    <div class="page-header">
                        <div class="row">
                            <div class="col">
                                <h3 class="page-title">Thêm sản phẩm</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin/product">Sản phẩm</a></li>
                                    <li class="breadcrumb-item active">Thêm sản phẩm</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /Page Header -->

                    <div class="card">
                        <div class="card-body">

                            <!-- Form -->
                            <form action="add-product?type=add" method="post">
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Tên sản phẩm</label>
                                    <div class="col-md-10">
                                        <input name="productName" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Giá sản phẩm</label>
                                    <div class="col-md-10">
                                        <input name="price" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Danh mục</label>
                                    <div class="col-md-10">
                                        <input name="categoryId" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Số lượng</label>
                                    <div class="col-md-10">
                                        <input name="quantity" type="text" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Công dụng</label>
                                    <div class="col-md-10">
                                        <input name="purpose" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Chỉ định</label>
                                    <div class="col-md-10">
                                        <input name="contraindications" type="text" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Thành phần</label>
                                    <div class="col-md-10">
                                        <input name="ingredients" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Liều lượng</label>
                                    <div class="col-md-10">
                                        <input name="dosage" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Hướng dẫn</label>
                                    <div class="col-md-10">
                                        <input name="instructions" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Thời hạn sử dụng</label>
                                    <div class="col-md-10">
                                        <input name="warrantyPeriod" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Điều kiện bảo quản</label>
                                    <div class="col-md-10">
                                        <input name="storageCondition" type="text" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">ID loại sản phẩm</label>
                                    <div class="col-md-10">
                                        <input name="typeId" type="text" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">ID nhà cung cấp</label>
                                    <div class="col-md-10">
                                        <input name="supplierId" type="text" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Hoạt động</label>
                                    <div class="col-md-10">
                                        <select class="form-control" id="active" name="active" required>
                                            <option value="true">Có</option>
                                            <option value="false">Không</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <button class="btn btn-primary">Thêm</button>
                                    <a href="product" class="btn btn-link">Hủy</a>
                                </div>
                            </form>
                            <!-- /Form -->

                        </div>
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

<!-- Select2 JS -->
<script src="/assets/admin/js/select2.min.js"></script>

<!-- Custom JS -->
<script src="/assets/admin/js/admin.js"></script>

</body>
</html>
