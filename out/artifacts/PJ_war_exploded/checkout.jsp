<%@ page import="Model.GioHang" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="Model.Item" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24/11/2019
  Time: 4:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Thanh toán</title>
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
    if (session.getAttribute("userName") == null) {
        response.sendRedirect("login.jsp");
    } else {
        GioHang cart = (GioHang) session.getAttribute("cart");
        if (cart == null) {
            cart = new GioHang();
            session.setAttribute("cart", cart);
        }
        HashMap<String, Item> list = cart.getItemsCart();
        NumberFormat nf = NumberFormat.getInstance();
        nf.setMinimumFractionDigits(0);
//        response.sendRedirect("checkout.jsp");
%>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade
    your browser</a> to improve your experience and security.</p>
<![endif]-->

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
                        <h2 class="bradcaump-title">Thanh toán</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                            <span class="brd-separetor">/</span>
                            <a class="breadcrumb_item" href="index.html">Giỏ hàng</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Thanh toán</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- Start Checkout Area -->
    <section class="wn__checkout__area section-padding--lg bg__white">
        <form action="ThanhToanServlet" method="post">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-12">
                        <div class="customer_details">
                            <div class="row checkout-title mb-2">
                                <img src="images/icons/billing_title.png">
                                <h2 class="text-center">Địa chỉ thanh toán</h2></div>
                            <div class="customar__field">
                                <div class="input_box">
                                    <label>Họ tên <span>*</span></label>
                                    <input type="text" name="name">
                                </div>
                                <div class="input_box">
                                    <label>Số điện thoại <span>*</span></label>
                                    <input type="number" name="phone">
                                </div>
                                <div class="input_box">
                                    <label>Địa chỉ email <span>*</span></label>
                                    <input type="mail" name="mail">
                                </div>
                                <div class="input_box">
                                    <label>Tỉnh/Thành phố <span>*</span></label>
                                    <select class="select__option" name="tinh">
                                        <option value="0">Vui lòng chọn…</option>
                                        <option value="TP Hồ Chí Minh">TP Hồ Chí Minh</option>
                                        <option value="Hà Nội">Hà Nội</option>
                                        <option value="Đà Nẵng">Đà Nẵng</option>
                                        <option value="Hải Phòng">Hải Phòng</option>
                                        <option value="Cần Thơ">Cần Thơ</option>
                                    </select>
                                </div>
                                <div class="input_box">
                                    <label>Quận/Huyện <span>*</span></label>
                                    <input type="text" name="huyen">
                                </div>
                                <div class="input_box">
                                    <label>Phường/Xã <span>*</span></label>
                                    <input type="text" name="xa">
                                </div>
                                <div class="input_box">
                                    <label>Số nhà/Khu phố <span>*</span></label>
                                    <input type="text" name="diachi">
                                </div>
                                <%--                                <div class="differt__address">--%>
                                <%--                                    <input name="ship_to_different_address" value="1" type="checkbox">--%>
                                <%--                                    <span>Vận chuyển đến địa chỉ khác ?</span>--%>
                                <%--                                </div>--%>
                            </div>
                        </div>
                        <%--                        <div class="customer_details differt__form mt--20">--%>
                        <%--                            <div class="row checkout-title mb-2">--%>
                        <%--                                <img src="images/icons/billing_title.png">--%>
                        <%--                                <h2 class="text-center">Địa chỉ giao hàng</h2></div>--%>
                        <%--                            <div class="customar__field">--%>
                        <%--                                <div class="margin_between">--%>
                        <%--                                    <div class="input_box space_between">--%>
                        <%--                                        <label>Họ <span>*</span></label>--%>
                        <%--                                        <input type="text">--%>
                        <%--                                    </div>--%>
                        <%--                                    <div class="input_box space_between">--%>
                        <%--                                        <label>Tên <span>*</span></label>--%>
                        <%--                                        <input type="text">--%>
                        <%--                                    </div>--%>
                        <%--                                </div>--%>
                        <%--                                <div class="input_box">--%>
                        <%--                                    <label>Số điện thoại <span>*</span></label>--%>
                        <%--                                    <input type="text">--%>
                        <%--                                </div>--%>
                        <%--                                <div class="input_box">--%>
                        <%--                                    <label>Địa chỉ email <span>*</span></label>--%>
                        <%--                                    <input type="text">--%>
                        <%--                                </div>--%>
                        <%--                                <div class="input_box">--%>
                        <%--                                    <label>Quốc gia <span>*</span></label>--%>
                        <%--                                    <select class="select__option">--%>
                        <%--                                        <option>Vui lòng chọn…</option>--%>
                        <%--                                        <option>Việt Nam</option>--%>
                        <%--                                        <option>Mỹ</option>--%>
                        <%--                                        <option>Nhật</option>--%>
                        <%--                                        <option>Anh</option>--%>
                        <%--                                        <option>Hàn Quốc</option>--%>
                        <%--                                    </select>--%>
                        <%--                                </div>--%>
                        <%--                                <div class="input_box">--%>
                        <%--                                    <label>Tỉnh/Thành phố <span>*</span></label>--%>
                        <%--                                    <select class="select__option">--%>
                        <%--                                        <option>Vui lòng chọn…</option>--%>
                        <%--                                        <option>TP Hồ Chí Minh</option>--%>
                        <%--                                        <option>Bình Dương</option>--%>
                        <%--                                        <option>Đồng Nai</option>--%>
                        <%--                                        <option>Cần Thơ</option>--%>
                        <%--                                        <option>Bình Phước</option>--%>
                        <%--                                    </select>--%>
                        <%--                                </div>--%>
                        <%--                                <div class="input_box">--%>
                        <%--                                    <label>Quận/Huyện <span>*</span></label>--%>
                        <%--                                    <input type="text">--%>
                        <%--                                </div>--%>
                        <%--                                <div class="input_box">--%>
                        <%--                                    <label>Phường/Xã <span>*</span></label>--%>
                        <%--                                    <input type="text">--%>
                        <%--                                </div>--%>
                        <%--                                <div class="input_box">--%>
                        <%--                                    <label>Số nhà/Khu phố <span>*</span></label>--%>
                        <%--                                    <input type="text">--%>
                        <%--                                </div>--%>

                        <%--                            </div>--%>

                        <%--                        </div>--%>
                    </div>
                    <div class="col-lg-6 col-12 md-mt-40 sm-mt-40">
                        <div class="customer_details mb-3">
                            <div class="row checkout-title mb-2">
                                <img src="images/icons/method_title.png">
                                <h2 class="text-center">Phương thức vận chuyển</h2></div>
                            <div class="customar__field">
                                <div class="input_box">
                                    <label>Hình thức giao hàng<span>*</span></label>
                                    <select class="select__option" name="giaohang">
                                        <option value="Giao hàng tiết kiệm">Giao hàng tiết kiệm(Miễn phí)</option>
                                        <option value="Giao hàng hỏa tốc">Giao hàng hỏa tốc (20.000đ)</option>
                                    </select>
                                </div>

                            </div>
                        </div>
                        <div class="customer_details mb-3">
                            <div class="row checkout-title mb-2">
                                <img src="images/icons/payment_title.png">
                                <h2 class="text-center">Phương thức thanh toán</h2></div>
                            <div class="customar__field">
                                <div class="input_box">
                                    <label>Hình thức thanh toán<span>*</span></label>
                                    <select class="select__option" name="thanhtoan">
                                        <option value="Tiền mặt">Tiền mặt</option>
                                        <option value="Chuyển khoản">Chuyển khoản</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="customer_details">
                            <div class="row checkout-title mb-2">
                                <img src="images/icons/order_title.png">
                                <h2 class="text-center">Kiểm tra lại đơn hàng</h2></div>
                            <div class="customar__field">
                                <ul class="order__total">
                                    <li>Tên sách*Số lượng</li>
                                    <li>Thành tiền</li>
                                </ul>
                                <ul class="order_product">
                                    <%
                                        double temp = 0;
                                        for (Map.Entry<String, Item> ds : list.entrySet()) {
                                            temp += (ds.getValue().getSanPham().getGiaKhuyenMai()) * (ds.getValue().getSoLuong());
                                    %>
                                    <li><%=ds.getValue().getSanPham().getTenSach()%>
                                        × <%=ds.getValue().getSoLuong()%><span><%=nf.format((ds.getValue().getSanPham().getGiaKhuyenMai()) * (ds.getValue().getSoLuong()))%>VND</span>
                                    </li>
                                    <%
                                        }
                                        session.setAttribute("tong", temp);
                                    %>
                                    <li class="total_fee">Tổng tiền <span><%=nf.format(temp)%>VND</span></li>
                                </ul>
                                <div class="checkout text-center">
                                    <input type="hidden" value="<%=session.getAttribute("userName")%>">
                                    <button class="btn btn-warning1 text-uppercase align-items-center mt-2 font-weight-bold" type="submit">
                                        Xác nhận đơn hàng
                                    </button>
                                </div>

                            </div>
                        </div>
                        <!--                    <div class="wn__order__box">-->
                        <!--                        <h3 class="onder__title">Kiểm tra đơn hàng</h3>-->
                        <!--                        <ul class="order__total">-->
                        <!--                            <li>Tên sách*Số lượng</li>-->
                        <!--                            <li>Thành tiền</li>-->
                        <!--                        </ul>-->
                        <!--                        <ul class="order_product">-->
                        <!--                            <li>Tôi là Pê Tô × 1<span>80.000VND</span></li>-->
                        <!--                            <li>Trại hoa vàng × 1<span>80.000VND</span></li>-->
                        <!--                            <li>Mắt biếc × 1<span>80.000VND</span></li>-->
                        <!--                            <li>Thập Giác Quán × 1<span>80.000VND</span></li>-->
                        <!--							<li class="total_fee">Thành tiền <span>320.000VND</span></li>-->
                        <!--                        </ul>-->
                        <!--                        <ul class="shipping__method">-->
                        <!--                            <li>Phương thức giao hàng-->
                        <!--                                <ul>-->
                        <!--                                    <li>-->
                        <!--                                        <input name="shipping_method[0]" data-index="0" value="legacy_flat_rate"-->
                        <!--                                               checked="checked" type="radio">-->
                        <!--                                        <label>Cách 1</label>-->
                        <!--                                    </li>-->
                        <!--                                    <li>-->
                        <!--                                        <input name="shipping_method[0]" data-index="0" value="legacy_flat_rate"-->
                        <!--                                               checked="checked" type="radio">-->
                        <!--                                        <label>Cách 2</label>-->
                        <!--                                    </li>-->
                        <!--                                </ul>-->
                        <!--                            </li>-->
                        <!--                        </ul>-->
                        <!--						<ul class="shipping__method">-->
                        <!--							<li>Phương thức thanh toán-->
                        <!--								<ul>-->
                        <!--									<li>-->
                        <!--										<input name="shipping_method[1]" data-index="1" value="legacy_flat_rate"-->
                        <!--											   checked="checked" type="radio">-->
                        <!--										<label>Cách 1</label>-->
                        <!--									</li>-->
                        <!--									<li>-->
                        <!--										<input name="shipping_method[1]" data-index="0" value="legacy_flat_rate"-->
                        <!--											   checked="checked" type="radio">-->
                        <!--										<label>Cách 2</label>-->
                        <!--									</li>-->
                        <!--								</ul>-->
                        <!--							</li>-->
                        <!--						</ul>-->
                        <!--                        <ul class="total__amount">-->
                        <!--                            <li>Tổng tiền <span>240.000VND</span></li>-->
                        <!--                        </ul>-->
                        <!--                    </div>-->
                    </div>
                </div>
            </div>
        </form>
    </section>
    <%--    //////--%>
<%--    <section class="wn__checkout__area section-padding--lg bg__white">--%>
<%--        <form action="ThanhToanServlet" method="post">--%>
<%--            <div class="container">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-lg-6 col-12">--%>
<%--                        <div class="customer_details">--%>
<%--                            <h2 class="text-center">Địa chỉ thanh toán</h2>--%>
<%--                            <div class="customar__field">--%>
<%--                                &lt;%&ndash;                                <div class="margin_between">&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                    <div class="input_box space_between">&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                        <label>Họ <span>*</span></label>&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                        <input type="text">&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                    <div class="input_box space_between">&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                        <label>Tên <span>*</span></label>&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                        <input type="text">&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                                <div class="input_box">--%>
<%--                                    <label>Họ tên <span>*</span></label>--%>
<%--                                    <input type="text" name="name">--%>
<%--                                </div>--%>
<%--                                <div class="input_box">--%>
<%--                                    <label>Số điện thoại <span>*</span></label>--%>
<%--                                    <input type="number" name="phone">--%>
<%--                                </div>--%>
<%--                                <div class="input_box">--%>
<%--                                    <label>Địa chỉ email <span>*</span></label>--%>
<%--                                    <input type="email" name="mail">--%>
<%--                                </div>--%>
<%--                                <div class="input_box">--%>
<%--                                    <label>Tỉnh/Thành phố <span>*</span></label>--%>
<%--                                    <select class="select__option" name="tinh">--%>
<%--                                        <option value="0">Vui lòng chọn…</option>--%>
<%--                                        <option value="TP Hồ Chí Minh">TP Hồ Chí Minh</option>--%>
<%--                                        <option value="Hà Nội">Hà Nội</option>--%>
<%--                                        <option value="Đà Nẵng">Đà Nẵng</option>--%>
<%--                                        <option value="Hải Phòng">Hải Phòng</option>--%>
<%--                                        <option value="Cần Thơ">Cần Thơ</option>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                                <div class="input_box">--%>
<%--                                    <label>Quận/Huyện <span>*</span></label>--%>
<%--                                    <input type="text" name="huyen">--%>
<%--                                </div>--%>
<%--                                <div class="input_box">--%>
<%--                                    <label>Phường/Xã <span>*</span></label>--%>
<%--                                    <input type="text" name="xa">--%>
<%--                                </div>--%>
<%--                                <div class="input_box">--%>
<%--                                    <label>Số nhà/Khu phố <span>*</span></label>--%>
<%--                                    <input type="text" name="diachi">--%>
<%--                                </div>--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                        &lt;%&ndash;                        <div class="customer_details mt--20">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                            <div class="differt__address">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                <input name="ship_to_different_address" value="1" type="checkbox">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                <span>Vận chuyển đến địa chỉ khác ?</span>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                            <div class="customar__field differt__form mt--40">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                <div class="margin_between">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    <div class="input_box space_between">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                        <label>Họ <span>*</span></label>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                        <input type="text">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    <div class="input_box space_between">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                        <label>Tên <span>*</span></label>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                        <input type="text">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                <div class="input_box">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    <label>Số điện thoại <span>*</span></label>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    <input type="text">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                <div class="input_box">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    <label>Địa chỉ email <span>*</span></label>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    <input type="text">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                <div class="input_box">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    <label>Quốc gia <span>*</span></label>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    <select class="select__option">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                        <option>Vui lòng chọn…</option>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                        <option>Việt Nam</option>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                        <option>Mỹ</option>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                        <option>Nhật</option>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                        <option>Anh</option>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                        <option>Hàn Quốc</option>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    </select>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                <div class="input_box">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    <label>Tỉnh/Thành phố <span>*</span></label>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    <select class="select__option">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                        <option>Vui lòng chọn…</option>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                        <option>TP Hồ Chí Minh</option>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                        <option>Bình Dương</option>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                        <option>Đồng Nai</option>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                        <option>Cần Thơ</option>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                        <option>Bình Phước</option>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    </select>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                <div class="input_box">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    <label>Quận/Huyện <span>*</span></label>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    <input type="text">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                <div class="input_box">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    <label>Phường/Xã <span>*</span></label>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    <input type="text">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                <div class="input_box">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    <label>Số nhà/Khu phố <span>*</span></label>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                    <input type="text">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                </div>&ndash;%&gt;--%>

<%--                        &lt;%&ndash;                            </div>&ndash;%&gt;--%>

<%--                        &lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--                    </div>--%>
<%--                    <div class="col-lg-6 col-12 md-mt-40 sm-mt-40">--%>
<%--                        <div class="wn__order__box">--%>
<%--                            <h3 class="onder__title">Kiểm tra đơn hàng</h3>--%>
<%--                            <ul class="order__total">--%>
<%--                                <li>Tên sách*Số lượng</li>--%>
<%--                                <li>Thành tiền</li>--%>
<%--                            </ul>--%>
<%--                            <ul class="order_product">--%>
<%--                                <%--%>
<%--                                    double temp = 0;--%>
<%--                                    for (Map.Entry<String, Item> ds : list.entrySet()) {--%>
<%--                                        temp += (ds.getValue().getSanPham().getGiaKhuyenMai()) * (ds.getValue().getSoLuong());--%>
<%--                                %>--%>
<%--                                <li><%=ds.getValue().getSanPham().getTenSach()%>--%>
<%--                                    × <%=ds.getValue().getSoLuong()%><span><%=nf.format((ds.getValue().getSanPham().getGiaKhuyenMai()) * (ds.getValue().getSoLuong()))%>VND</span>--%>
<%--                                </li>--%>
<%--                                <%--%>
<%--                                    }--%>
<%--                                %>--%>
<%--                                <li class="total_fee">Thành tiền <span><%=nf.format(temp)%>VND</span></li>--%>
<%--                            </ul>--%>
<%--                            &lt;%&ndash;                            <ul class="shipping__method">&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                <li>Phương thức giao hàng&ndash;%&gt;--%>
<%--                            &lt;%&ndash;&lt;%&ndash;                                    <ul>&ndash;%&gt;&ndash;%&gt;--%>
<%--                            &lt;%&ndash;&lt;%&ndash;                                        <li>&ndash;%&gt;&ndash;%&gt;--%>
<%--                            &lt;%&ndash;&lt;%&ndash;                                            <input name="shipping_method[0]" data-index="0" value="legacy_flat_rate"&ndash;%&gt;&ndash;%&gt;--%>
<%--                            &lt;%&ndash;&lt;%&ndash;                                                   checked="checked" type="radio">&ndash;%&gt;&ndash;%&gt;--%>
<%--                            &lt;%&ndash;&lt;%&ndash;                                            <label>Cách 1</label>&ndash;%&gt;&ndash;%&gt;--%>
<%--                            &lt;%&ndash;&lt;%&ndash;                                        </li>&ndash;%&gt;&ndash;%&gt;--%>
<%--                            &lt;%&ndash;&lt;%&ndash;                                        <li>&ndash;%&gt;&ndash;%&gt;--%>
<%--                            &lt;%&ndash;&lt;%&ndash;                                            <input name="shipping_method[0]" data-index="0" value="legacy_flat_rate"&ndash;%&gt;&ndash;%&gt;--%>
<%--                            &lt;%&ndash;&lt;%&ndash;                                                   checked="checked" type="radio">&ndash;%&gt;&ndash;%&gt;--%>
<%--                            &lt;%&ndash;&lt;%&ndash;                                            <label>Cách 2</label>&ndash;%&gt;&ndash;%&gt;--%>
<%--                            &lt;%&ndash;&lt;%&ndash;                                        </li>&ndash;%&gt;&ndash;%&gt;--%>
<%--                            &lt;%&ndash;&lt;%&ndash;                                    </ul>&ndash;%&gt;&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                    <select class="select__option" name="giaoHang">&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                        <option value="0">Giao hàng tiết kiệm</option>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                        <option value="15000">Giao hàng nhanh</option>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                    </select>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                </li>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            </ul>&ndash;%&gt;--%>
<%--                            <ul class="shipping__method">--%>
<%--                                <li>Phương thức thanh toán--%>
<%--                                    &lt;%&ndash;                                    <ul>&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                        <li>&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                            <input name="shipping_method[1]" data-index="1" value="legacy_flat_rate"&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                                   checked="checked" type="radio">&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                            <label>Cách 1</label>&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                        </li>&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                        <li>&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                            <input name="shipping_method[1]" data-index="0" value="legacy_flat_rate"&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                                   checked="checked" type="radio">&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                            <label>Cách 2</label>&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                        </li>&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                    </ul>&ndash;%&gt;--%>
<%--                                    <select class="select__option" name="pttt">--%>
<%--                                        <option value="Tiền mặt">Tiền mặt</option>--%>
<%--                                        <option value="Chuyển khoản">Chuyển khoản</option>--%>
<%--                                    </select>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                            <ul class="total__amount">--%>
<%--                                <li>Tổng tiền <span><%=nf.format(temp)%>VND</span></li>--%>
<%--                            </ul>--%>
<%--                            <ul class="text-center">--%>
<%--                                <input type="hidden" value="<%=session.getAttribute("userName")%>">--%>
<%--                                <button class="btn btn-success text-center mb-2" type="submit">Check out</button>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </form>--%>
<%--    </section>--%>
    <!-- End Checkout Area -->
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
<%
    }
%>
</body>
</html>
