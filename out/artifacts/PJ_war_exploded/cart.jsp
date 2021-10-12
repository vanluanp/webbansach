<%@ page import="Model.GioHang" %>
<%@ page import="Model.Item" %>
<%@ page import="java.util.Map" %>
<%@ page import="dao.SanPhamDaoIMP" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="Model.SanPham" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24/11/2019
  Time: 4:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <script type="text/javascript" src="https://mail-attachment.googleusercontent.com/injected/se.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Giỏ hàng</title>
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
    GioHang cart = (GioHang) session.getAttribute("cart");
    if (cart == null) {
        cart = new GioHang();
        session.setAttribute("cart", cart);
    }
    NumberFormat nf = NumberFormat.getInstance();
    nf.setMinimumIntegerDigits(0);
%>


<!-- Main wrapper -->
<div class="wrapper" id="wrapper">

    <!-- Header -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- End Search Popup -->
    <!-- Start Bradcaump area -->
    <div class="ht__bradcaump__area bg-image--6" style="margin-top: 6.3%">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">Giỏ hàng</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Giỏ hàng</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- cart-main-area start -->

    <div class="cart-main-area section-padding--lg bg--white">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 ol-lg-12">
                    <form action="#">
                        <div class="table-content wnro__table table-responsive">
                            <table>
                                <thead>
                                <tr class="title-top">
                                    <th class="product-thumbnail">Mẫu mã</th>
                                    <th class="product-name">Tên sách</th>
                                    <th class="product-price">Giá</th>
                                    <th class="product-quantity">Số lượng</th>
                                    <th class="product-subtotal">Thành tiền</th>
                                    <th class="product-remove">Xóa</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for (Map.Entry<String, Item> ds : cart.getItemsCart().entrySet()) {
                                %>
                                <tr>
                                    <td class="product-name"><a href="#"><img
                                            src="<%=ds.getValue().getSanPham().getHinhAnh1()%>"
                                            alt="product img"></a>
                                    </td>
                                    <td class="product-name2 text-left"><a
                                            href="#"><%=ds.getValue().getSanPham().getTenSach()%>
                                    </a>
                                    </td>
                                    <td class="product-price"><span
                                            class="amount"><%=nf.format(ds.getValue().getSanPham().getGiaKhuyenMai())%>đ</span>
                                    </td>
                                    <td class="product-quantity">
                                        <a href="GioHangServlet?command=sub&maSach=<%=ds.getValue().getSanPham().getMaSach()%>" style="font-weight: bold; font-size: large;">
                                            - </a>
                                        <input type="text" value="<%=ds.getValue().getSoLuong()%>" autocomplete="off"
                                               size="2"
                                               disabled="">
                                        <a href="GioHangServlet?command=plus&maSach=<%=ds.getValue().getSanPham().getMaSach()%>" style="font-weight: bold; font-size: large;">
                                            + </a>
                                    </td>
                                    <td class="product-subtotal"><%=nf.format(ds.getValue().getSoLuong() * ds.getValue().getSanPham().getGiaKhuyenMai())%>
                                        đ
                                    </td>
                                    <td class="product-remove">
                                            <a class="buttondel" href="GioHangServlet?command=remove&maSach=<%=ds.getValue().getSanPham().getMaSach()%>" style="padding: 0">×</a>
                                    </td>
                                </tr>

                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </form>
                    <div class="cart-total">
                        <div class="col-lg-6 offset-lg-6">
                            <div class="cart__total__amount">
                                <span>Tổng tiền</span>
                                <span><%=nf.format(cart.total())%>đ</span>
                            </div>
                        </div>
                        <div class="cartbox__btn  ">
                            <ul class="cart__btn__list d-flex flex-wrap flex-md-nowrap flex-lg-nowrap justify-content-between">
                                <li><a href="#">Cập nhật</a></li>
                                <li><a href="checkout.jsp">Tiến hành đặt hàng</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!--            <div class="row">-->
            <!--                <div class="col-lg-6 offset-lg-6">-->
            <!--                    <div class="cartbox__total__area">-->
            <!--                        <div class="cartbox-total d-flex justify-content-between">-->
            <!--                            <ul class="cart__total__list">-->
            <!--                                <li>Cart total</li>-->
            <!--                                <li>Sub Total</li>-->
            <!--                            </ul>-->
            <!--                            <ul class="cart__total__tk">-->
            <!--                                <li>$70</li>-->
            <!--                                <li>$70</li>-->
            <!--                            </ul>-->
            <!--                        </div>-->
            <!--                        <div class="cart__total__amount">-->
            <!--                            <span>Grand Total</span>-->
            <!--                            <span>$140</span>-->
            <!--                        </div>-->
            <!--                    </div>-->
            <!--                </div>-->
            <!--            </div>-->
        </div>
    </div>
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
