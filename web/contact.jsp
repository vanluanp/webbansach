<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24/11/2019
  Time: 4:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <script type="text/javascript" src="https://mail-attachment.googleusercontent.com/injected/se.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Liên hệ</title>
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
                        <h2 class="bradcaump-title">Liên hệ</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Liên hệ</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- End Bradcaump area -->
    <div class="space-medium">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="contact-block">
                        <div class="contact-info">
                            <i class="fa fa-map-marker"></i>
                            <h4 class="contact-info-title">Địa chỉ</h4>
                            <p>Trường đại học Nông Lâm TPHCM</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="contact-block">
                        <div class="contact-info">
                            <i class="fa fa-phone"></i>
                            <h4 class="contact-info-title">Đường dây nóng</h4>
                            <p><strong class="textcontact">+84 3266 78810</strong></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="contact-block">
                        <div class="contact-info">
                            <i class="fa fa-envelope-open"></i>
                            <h4 class="contact-info-title">Địa chỉ email</h4>
                            <p>hhbb@gmail.com</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Start Contact Area -->
    <section class="wn_contact_area bg--white pt--80 pb--80">
        <div class="container">
            <div class="row">
                <div class="col-12 my-col-contact">
                    <div class="contact-form-wrap">
                        <h2 class="contact__title">Liên hệ</h2>
                        <p>Có vấn đề cần liên hệ với H&B vui lòng gửi tại đây. Chúng tôi giải quyết nhanh nhất có
                            thể. </p>
                        <form id="contact-form" action="#" method="post">
                            <div class="single-contact-form space-between">
                                <input type="text" name="firstname" placeholder="Họ tên*">
                                <input type="email" name="email" placeholder="Email của bạn*">
                            </div>
                            <div class="single-contact-form">
                                <input type="text" name="subject" placeholder="Tiêu đề*">
                            </div>
                            <div class="single-contact-form message">
                                <textarea name="message" placeholder="Nhập lời nhắn..."></textarea>
                            </div>
                            <div class="contact-btn">
                                <button class="btn-contact" type="submit">Gửi lời nhắn</button>
                            </div>
                        </form>
                    </div>
                    <div class="form-output">
                        <p class="form-messege">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Contact Area -->
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
