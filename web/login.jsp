<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 18/11/2019
  Time: 10:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="zxx">
<head>
    <script type="text/javascript" src="https://mail-attachment.googleusercontent.com/injected/se.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Đăng nhập</title>
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

<div id="fb-root"></div>
<script async defer crossorigin="anonymous"
        src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v5.0&appId=1207869516085168&autoLogAppEvents=1"></script>

<%
    String err = "";
    if (request.getAttribute("err") != null) {
        err = (String) request.getAttribute("err");
    }
    String userName = "";
    if (request.getAttribute("userName") != null) {
        userName = (String) request.getAttribute("userName");
    }
%>

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
                        <h2 class="bradcaump-title">Đăng nhập</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Đăng nhập</span>
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
                    <h3 class="account__title text-center">Đăng nhập tài khoản</h3>
                    <p class="title1">Đăng nhập để theo dõi đơn hàng, lưu
                        danh sách sản phẩm yêu thích, nhận
                        nhiều ưu đãi hấp dẫn.</p>
                    <img class="imageaacount" src="images/png-img/login.png"/></div>
                <div class="col-lg-6 col-12">
                    <div class="my__account__wrapper">
                        <h3 class="text-center">Mời bạn điền vào form đăng nhập</h3>
                        <blockquote>
                            <form action="DangNhapServlet" method="post">
                                <div class="account__form">
                                    <div class="welcome">
                                        <p class="text-center">Welcom to H&B Bookstore</p>
                                        <p class="text-center"><a class="questionRegister" href="register.html">Đăng
                                            ký? </a>Nếu chưa là thành viên</p>
                                    </div>
                                    <p style="color: red"><%=err%>
                                    </p>
                                    <div class="input__box">
                                        <label>Tên đăng nhập hoặc Email <span>*</span></label>
                                        <input type="text" name="userName" value="<%=userName%>">
                                    </div>
                                    <div class="input__box">
                                        <label>Mật khẩu <span>*</span></label>
                                        <input type="password" name="password">
                                    </div>
                                    <div class="form__btn text-center">
                                        <button>Đăng nhập</button>

                                    </div>
                                    <div class="forget">
                                        <label class="label-for-checkbox">
                                            <input id="rememberme" class="input-checkbox" name="rememberme"
                                                   value="forever"
                                                   type="checkbox">
                                            <span>Lưu mật khẩu</span>
                                        </label>
                                        <a class="forget_pass" href="forgetpassword.jsp">Quên mật khẩu?</a>
                                    </div>


                                </div>
                            </form>
                        </blockquote>
                    </div>
                    <div class="text-center">
                        <p class="titleLogin">Hoặc đăng nhập bằng</p>
                    </div>
                    <div class="form_loginDifferent">
                        <ul class="social__net social__net--2 d-flex justify-content-center">
                            <%--                            <li><a href="#"><i class="fa fa-facebook-square fa" style="color: #003bb3"></i></a></li>--%>
                            <div class="fb-login-button" data-width="100px" data-size="small"
                                 data-button-type="login_with" data-auto-logout-link="false"
                                 data-use-continue-as="false"></div>
                            <li><a href="#"><i class="fa fa-google-plus-square" style="color: red"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class=" col-12">

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
