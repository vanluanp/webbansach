<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24/11/2019
  Time: 4:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <script type="text/javascript" src="https://mail-attachment.googleusercontent.com/injected/se.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Đăng kí</title>
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
<%
    String name_err ="", userName_err="", phone_err="",  password_err="", repass_err="", check_err="";
    if(request.getAttribute("name_err")!=null){
        name_err = (String) request.getAttribute("name_err");
    }
    if(request.getAttribute("userName_err")!=null){
        userName_err= (String) request.getAttribute("userName_err");
    }
    if(request.getAttribute("phone_err")!=null){
        phone_err= (String) request.getAttribute("phone_err");
    }
    if(request.getAttribute("password_err")!=null){
        password_err= (String) request.getAttribute("password_err");
    }
    if(request.getAttribute("repass_err")!=null){
        repass_err= (String) request.getAttribute("repass_err");
    }
    if(request.getAttribute("check_err")!=null){
        check_err= (String) request.getAttribute("check_err");
    }
    //
    String name ="", userName="", phone="",  password="", repass="", check="";
    if(request.getAttribute("name")!=null){
        name = (String) request.getAttribute("name");
    }
    if(request.getAttribute("userName")!=null){
        userName= (String) request.getAttribute("userName");
    }
    if(request.getAttribute("phone")!=null){
        phone= (String) request.getAttribute("phone");
    }
    if(request.getAttribute("password")!=null){
        password= (String) request.getAttribute("password");
    }
    if(request.getAttribute("repass")!=null){
        repass= (String) request.getAttribute("repass");
    }
    check= (String) request.getAttribute("checkRule");
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
                        <h2 class="bradcaump-title">Đăng ký</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Đăng ký</span>
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
                    <h3 class="account__title text-center">Đăng ký tài khoản</h3>
                    <p class="title1">Đăng ký để theo dõi đơn hàng, lưu
                        danh sách sản phẩm yêu thích, nhận
                        nhiều ưu đãi hấp dẫn.</p>
                    <img class="imageaacount" src="images/png-img/login.png"/></div>
                <div class="col-lg-6 col-12">
                    <div class="my__account__wrapper">
                        <h3 class=" text-center">Mời bạn điền vào form đăng ký</h3>
                        <form action="DangKyServlet" method="post" onsubmit="return check()">
                            <div class="account__form">
                                <div class="welcome">
                                    <p class="text-center">Welcom to H&B Bookstore</p>
                                    <p class="text-center"><a class="questionRegister" href="login.html">Đăng
                                        nhập? </a>Nếu đã có tài khoản</p>
                                </div>
                                <div class="input__box">
                                    <label>Tên của bạn <span>*</span><p style="color: red"><%=name_err%></p></label>
                                    <input type="text" name="name" value="<%=name%>">
                                </div>
                                <div class="input__box">
                                    <label>Số điện thoại<span>*</span> <p style="color: red"><%=phone_err%></p></label>
                                    <input type="text" name="phone" value="<%=phone%>">
                                </div>
                                <div class="input__box">
                                    <label>Địa chỉ Email<span>*</span><p style="color: red"><%=userName_err%></p></label>
                                    <input type="email" name="userName" value="<%=userName%>">
                                </div>
                                <div class="input__box">
                                    <label>Mật khẩu<span>*</span><p style="color: red"><%=password_err%></p></label>
                                    <input type="password" name="password" value="<%=password%>">
                                </div>
                                <div class="input__box">
                                    <label>Nhập lại mật khẩu<span>*</span><p style="color: red"><%=repass_err%></p></label>
                                    <input type="password" name="repass" value="<%=repass%>">
                                </div>
                                <label class="label-for-checkbox">
                                    <p style="color: red"><%=check_err%></p>
                                    <input id="rememberme" class="input-checkbox" name="checkRule" value="<%=check%>" checked="checked"
                                           type="checkbox">
                                    <span>Đồng ý với điều khoản</span>
                                </label>
                                <script>
                                    function check()
                                    {
                                        if (document.getElementById('rememberme').checked==true)
                                        {
                                            return true;
                                        }else {
                                            alert("Vui lòng đồng ý điều khoản!");
                                        }
                                        return false;
                                    }
                                </script>
                                <div class="form__btn text-center">
                                    <button>Đăng ký</button>
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
