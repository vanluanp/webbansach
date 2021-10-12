<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24/11/2019
  Time: 4:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head><script type="text/javascript" src="https://mail-attachment.googleusercontent.com/injected/se.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Câu hỏi thường gặp</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicons -->
    <link rel="shortcut icon" href="images/favicon.jpg">
    <link rel="apple-touch-icon" href="images/icon.png">

    <!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/plugins.css">
    <link rel="stylesheet" href="style.css">

    <!-- Cusom css -->
    <link rel="stylesheet" href="css/custom.css">

    <!-- Modernizer js -->
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
</head>
<body>


<!-- Main wrapper -->
<div class="wrapper" id="wrapper">

    <!-- Header -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- Start Bradcaump area -->
    <div class="ht__bradcaump__area bg-image--6" style="margin-top: 6.3%">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">Câu hỏi thường gặp</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Câu hỏi thường gặp</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- Start Faq Area -->
    <section class="wn__faq__area bg--white pt--80 pb--60">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="wn__accordeion__content">
                        <h2>Một số câu hỏi thường gặp có thể giúp bạn</h2>
                    </div>
                    <div id="accordion" class="wn_accordion" role="tablist">
                        <div class="card">
                            <div class="acc-header" role="tab" id="headingOne">
                                <h5>
                                    <a data-toggle="collapse" href="#collapseOne" role="button" aria-expanded="true"
                                       aria-controls="collapseOne">Làm cách nào tôi có thể thêm địa chỉ nhận hàng? </a>
                                </h5>
                            </div>
                            <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne"
                                 data-parent="#accordion">
                                <div class="card-body">Quý khách có 2 cách để thêm địa chỉ giao hàng vào sổ địa chỉ
                                    trong tài khoản tại H&B.<br>
                                    Cách 1: Thêm địa chỉ tại mục tài khoản.<br>
                                    Bước 1: Đăng nhập vào tài khoản<br>
                                    Quý khách vui lòng đăng nhập vào tài khoản đã đặt đơn hàng.<br>
                                    Bước 2: Chọn mục “Thêm địa chỉ” tại phần “Sổ địa chỉ”:<br>
                                    Cách 2: Thêm địa chỉ tại bước 2 khi đặt hàng:<br>
                                    Ở bước 2 chọn Địa chỉ giao hàng, quý khách bấm chọn vào “Thêm địa chỉ giao hàng
                                    mới”.<br>
                                    Sau đó điền đầy đủ thông tin.<br>
                                    Cảm ơn quý khách đã tin tưởng và sử dụng dịch vụ tại H&B.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="acc-header" role="tab" id="headingTwo">
                                <h5>
                                    <a class="collapsed" data-toggle="collapse" href="#collapseTwo" role="button"
                                       aria-expanded="false" aria-controls="collapseTwo">
                                        Làm cách nào tôi có thể thêm địa chỉ nhận hàng? </a>
                                </h5>
                            </div>
                            <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo"
                                 data-parent="#accordion">
                                <div class="card-body">Quý khách có 2 cách để thêm địa chỉ giao hàng vào sổ địa chỉ
                                    trong tài khoản tại H&B.<br>
                                    Cách 1: Thêm địa chỉ tại mục tài khoản.<br>
                                    Bước 1: Đăng nhập vào tài khoản<br>
                                    Quý khách vui lòng đăng nhập vào tài khoản đã đặt đơn hàng.<br>
                                    Bước 2: Chọn mục “Thêm địa chỉ” tại phần “Sổ địa chỉ”:<br>
                                    Cách 2: Thêm địa chỉ tại bước 2 khi đặt hàng:<br>
                                    Ở bước 2 chọn Địa chỉ giao hàng, quý khách bấm chọn vào “Thêm địa chỉ giao hàng
                                    mới”.<br>
                                    Sau đó điền đầy đủ thông tin.<br>
                                    Cảm ơn quý khách đã tin tưởng và sử dụng dịch vụ tại H&B.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="acc-header" role="tab" id="headingThree">
                                <h5>
                                    <a class="collapsed" data-toggle="collapse" href="#collapseThree" role="button"
                                       aria-expanded="false" aria-controls="collapseThree">
                                        Làm cách nào tôi có thể thêm địa chỉ nhận hàng? </a>
                                </h5>
                            </div>
                            <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree"
                                 data-parent="#accordion">
                                <div class="card-body">Quý khách có 2 cách để thêm địa chỉ giao hàng vào sổ địa chỉ
                                    trong tài khoản tại H&B.<br>
                                    Cách 1: Thêm địa chỉ tại mục tài khoản.<br>
                                    Bước 1: Đăng nhập vào tài khoản<br>
                                    Quý khách vui lòng đăng nhập vào tài khoản đã đặt đơn hàng.<br>
                                    Bước 2: Chọn mục “Thêm địa chỉ” tại phần “Sổ địa chỉ”:<br>
                                    Cách 2: Thêm địa chỉ tại bước 2 khi đặt hàng:<br>
                                    Ở bước 2 chọn Địa chỉ giao hàng, quý khách bấm chọn vào “Thêm địa chỉ giao hàng
                                    mới”.<br>
                                    Sau đó điền đầy đủ thông tin.<br>
                                    Cảm ơn quý khách đã tin tưởng và sử dụng dịch vụ tại H&B.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Faq Area -->
    <!-- Footer Area -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- //Footer Area -->

</div>
<!-- //Main wrapper -->

<!-- JS Files -->
<script src="js/vendor/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/active.js"></script>

</body>
</html>
