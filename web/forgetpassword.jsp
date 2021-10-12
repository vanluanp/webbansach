<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24/11/2019
  Time: 4:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <script type="text/javascript" src="https://mail-attachment.googleusercontent.com/injected/se.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Quên mật khẩu</title>
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
                        <h2 class="bradcaump-title">Quên mật khẩu</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Quên mật khẩu</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- cart-main-area start -->
    <section class="my_account_area pt--80 pb--55 bg--white">
        <div class="container">
            <div class="row">

                <div class="col-5 accountleft">
                    <h3 class="account__title text-center">Quên mật khẩu</h3>
                    <p class="title1">Quý khách quên mật khẩu? Không sao chỉ cần một thao tác nhỏ quý khách có thể lấy
                        lại mật khẩu..</p>
                    <img src="images/png-img/quenmatkhau.jpg" height="310" width="310"/></div>
                <div class="col-lg-6 col-12">
                    <div class="my__account__wrapper">
                        <h3 class=" text-center">Mời bạn điền vào form quên mật khẩu</h3>
                        <form action="ForgetPasswordServlet" method="post">
                            <div class="account__form">
                                <div class="welcome">
                                    <p class="text-center">Vui lòng nhập vào email để nhận được liên kết đặt lại mật
                                        khẩu
                                        mới</p>
                                </div>
                                <div class="input__box">
                                    <label>Địa chỉ email <span>*</span></label>
                                    <input type="email" name="emailPassword">
                                </div>

                                <div class="form__btn text-center">
                                    <button><a class="forget-passline">Lấy lại mật khẩu</a>
                                    </button>
                                </div>


                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <!-- cart-main-area end -->
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
