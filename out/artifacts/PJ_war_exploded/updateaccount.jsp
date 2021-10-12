<%@ page import="dao.TaiKhoanDaoIMP" %>
<%@ page import="Util.Util" %>
<%@ page import="javax.jws.soap.SOAPBinding" %>
<%@ page import="Model.User" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24/11/2019
  Time: 4:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <script type="text/javascript" src="https://mail-attachment.googleusercontent.com/injected/se.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Cập nhật tài khoản</title>
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
    <%
        TaiKhoanDaoIMP taiKhoanDaoIMP = new TaiKhoanDaoIMP();
        String userName = (String) session.getAttribute("userName");
        User user = taiKhoanDaoIMP.getTaiKhoanByUserName(userName);
        String err = "";
        if (request.getAttribute("err") != null) {
            err = (String) request.getAttribute("err");
        }
    %>
    <div class="ht__bradcaump__area bg-image--6" style="margin-top: 6.3%">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">Cập nhật tài khoản</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Cập nhật tài khoản</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <section class="wn__checkout__area section-padding--lg bg__white">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-12">
                    <div class="customer_details">
                        <div class="row checkout-title mb-2">
                            <img src="images/icons/invoice.png">
                            <h2 class="text-center">Thông tin tài khoản</h2>
                        </div>
                        <form action=<%=Util.utilUser("CapNhatTKServlet")%> method="post">
                            <div class="customar__field">
                                <p style="color: red ; font-weight: bold"><%=err%>
                                <%--                            <div class="margin_between">--%>
                                <%--                                <div class="input_box space_between">--%>
                                <%--                                    <label>Họ <span>*</span></label>--%>
                                <%--                                    <input type="text">--%>
                                <%--                                </div>--%>
                                <%--                                <div class="input_box space_between">--%>
                                <%--                                    <label>Tên <span>*</span></label>--%>
                                <%--                                    <input type="text">--%>
                                <%--                                </div>--%>
                                <%--                            </div>--%>
                                <div class="input_box">
                                    <label>Họ tên <span>*</span></label>
                                    <input type="text" value="<%=user.getName()%>" name="name">
                                </div>
                                <div class="input_box">
                                    <label>Số điện thoại <span>*</span></label>
                                    <input type="number" value="<%=user.getPhone()%>" name="phone">
                                </div>
                                <div class="input_box">
                                    <label>Địa chỉ email <span>*</span></label>
                                    <input type="email" value="<%=user.getUserName()%>">
                                </div>
                                <ul class="check-box">
                                    <li>Giới tính
                                        <ul>
                                            <li>
                                                <input name="shipping_method[0]" data-index="0" value="legacy_flat_rate"
                                                       checked="checked" type="radio">
                                                <label>Nam</label>
                                            </li>
                                            <li>
                                                <input name="shipping_method[0]" data-index="0" value="legacy_flat_rate"
                                                       type="radio">
                                                <label>Nữ</label>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                                <label class="label-for-checkbox">
                                    <input id="rememberme" class="input-checkbox" name="rememberme" value="forever"
                                           type="checkbox">
                                    <span>Đăng ký nhận tin tức từ chúng tôi</span>
                                </label>

                            </div>
                            <div class="col-6 col-12">
                                <div class="text-center mt-5">
                                    <input type="hidden" value="<%=session.getAttribute("userName")%>">
                                    <button class="btn btn-warning1 font-weight-bold" type="submit">Lưu thay đổi
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!--                <div class="col-lg-6 col-12">-->
                <!--                    <div class="customer_details">-->
                <!--                        <div class="row checkout-title mb-2">-->
                <!--                            <img src="images/icons/billing_title.png">-->
                <!--                            <h2 class="text-center">Địa chỉ</h2></div>-->
                <!--                        <div class="customar__field">-->
                <!--                            <div class="input_box">-->
                <!--                                <label>Quốc gia <span>*</span></label>-->
                <!--                                <select class="select__option">-->
                <!--                                    <option>Vui lòng chọn…</option>-->
                <!--                                    <option>Việt Nam</option>-->
                <!--                                    <option>Mỹ</option>-->
                <!--                                    <option>Nhật</option>-->
                <!--                                    <option>Anh</option>-->
                <!--                                    <option>Hàn Quốc</option>-->
                <!--                                </select>-->
                <!--                            </div>-->
                <!--                            <div class="input_box">-->
                <!--                                <label>Tỉnh/Thành phố <span>*</span></label>-->
                <!--                                <select class="select__option">-->
                <!--                                    <option>Vui lòng chọn…</option>-->
                <!--                                    <option>TP Hồ Chí Minh</option>-->
                <!--                                    <option>Bình Dương</option>-->
                <!--                                    <option>Đồng Nai</option>-->
                <!--                                    <option>Cần Thơ</option>-->
                <!--                                    <option>Bình Phước</option>-->
                <!--                                </select>-->
                <!--                            </div>-->
                <!--                            <div class="input_box">-->
                <!--                                <label>Quận/Huyện <span>*</span></label>-->
                <!--                                <input type="text">-->
                <!--                            </div>-->
                <!--                            <div class="input_box">-->
                <!--                                <label>Phường/Xã <span>*</span></label>-->
                <!--                                <input type="text">-->
                <!--                            </div>-->
                <!--                            <div class="input_box">-->
                <!--                                <label>Số nhà/Khu phố <span>*</span></label>-->
                <!--                                <input type="text">-->
                <!--                            </div>-->
                <!--                        </div>-->
                <!--                    </div>-->
                <!--                </div>-->

            </div>
        </div>
    </section>
    <!-- cart-main-area start -->
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