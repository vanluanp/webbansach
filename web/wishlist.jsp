<%--
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
    <title>Danh sách yêu thích</title>
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
                        <h2 class="bradcaump-title">Yêu thích</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Yêu thích</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- cart-main-area start -->
    <div class="wishlist-area section-padding--lg bg__white">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="wishlist-content">
                        <form action="#">
                            <div class="wishlist-table wnro__table table-responsive">
                                <table>
                                    <thead>
                                    <tr class="title-top">
                                        <th class="product-thumbnail">Mẫu mã</th>
                                        <th class="product-name">Tên sách</th>
                                        <th class="product-price">Giá</th>
                                        <th class="product-quantity">Tình trạng</th>
                                        <th class="product-subtotal">Xóa</th>
                                        <th class="product-remove">Thêm vào giỏ hàng</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="product-name3"><a href="#"><img
                                                src="images/product/sm-3/sieu-quay-teppei_tap-22.jpg"
                                                alt="product img"></a>
                                        </td>
                                        <td class="product-name4"><a href="#">Siêu quậy Teppei</a>
                                        </td>
                                        <td class="product-price"><span class="amount">20.000đ</span></td>
                                        <td class="product-stock-status"><span class="nobr"> Còn </span></td>
                                        <td class="product-remove"><a href="#">
                                            <button class="buttondel">×</button>
                                        </a></td>
                                        <td class="product-add-to-cart2"><a href="#">
                                            <button class="buttondel">+</button>
                                        </a></td>
                                    </tr>
                                    <tr>
                                        <td class="product-name3"><a href="#"><img
                                                src="images/product/sm-3/nhat-quy-nhi-ma-thu-ba-takagi_tap-3.jpg"
                                                alt="product img"></a>
                                        </td>
                                        <td class="product-name4"><a href="#">Nhất quỷ nhì ma, thứ ba Takagi</a>
                                        </td>
                                        <td class="product-price"><span class="amount">30.000đ</span></td>
                                        <td class="product-stock-status"><span class="nobr"> Còn </span></td>
                                        <td class="product-remove"><a href="#">
                                            <button class="buttondel">×</button>
                                        </a></td>
                                        <td class="product-add-to-cart2"><a href="#">
                                            <button class="buttondel">+</button>
                                        </a></td>
                                    </tr>
                                    <tr>
                                        <td class="product-name3"><a href="#"><img
                                                src="images/product/sm-3/8935250703215-qt.gif"
                                                alt="product img"></a>
                                        </td>
                                        <td class="product-name4"><a href="#">Miền đất hứa</a>
                                        </td>
                                        <td class="product-price"><span class="amount">40.000đ</span></td>
                                        <td class="product-stock-status"><span class="nobr"> Còn </span></td>
                                        <td class="product-remove"><a href="#">
                                            <button class="buttondel">×</button>
                                        </a></td>
                                        <td class="product-add-to-cart2"><a href="#">
                                            <button class="buttondel">+</button>
                                        </a></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
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