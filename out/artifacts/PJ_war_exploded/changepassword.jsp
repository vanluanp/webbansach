<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24/11/2019
  Time: 4:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <script type="text/javascript" src="https://mail-attachment.googleusercontent.com/injected/se.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Đặt lại mật khẩu</title>
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

<%
    String password_err = "";
    if (request.getAttribute("password_err") != null) {
        password_err = (String) request.getAttribute("password_err");
    }
    String repass_err = "";
    if (request.getAttribute("repass_err") != null) {
        repass_err = (String) request.getAttribute("repass_err");
    }
%>

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
                        <h2 class="bradcaump-title">Đặt lại mật khẩu</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Đặt lại mật khẩu</span>
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
                    <h3 class="account__title text-center">Đặt lại mật khẩu</h3>
                    <p class="title1">Quý khách vui lòng hoàn tất bước cuối cùng này để lấy lại mật khẩu nhé.</p>
                    <img src="images/png-img/Change-password.jpg" style="border-radius: 50%"/></div>
                <div class="col-lg-6 col-12">
                    <div class="my__account__wrapper">
                        <h3 class=" text-center">Mời bạn điền vào form</h3>
                        <form action="ChangPasswordServlet" method="post">
                            <div class="account__form">
                                <p style="color: red"><%=password_err%>
                                <div class="input__box">
                                    <label>Mật khẩu mới <span>*</span></label>
                                    <input type="password" name="newPassword">
                                </div>
                                <p style="color: red"><%=repass_err%>
                                <div class="input__box">
                                    <label>Nhập lại mật khẩu mới <span>*</span></label>
                                    <input type="password" name="reNewPassword">
                                </div>

                                <div class="form__btn text-center">
                                    <button>Đặt lại mật khẩu</button>
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
