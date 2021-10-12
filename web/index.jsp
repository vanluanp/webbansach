<%@ page import="dao.DanhMucDaoIMP" %>
<%@ page import="Model.DanhMuc" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="dao.SanPhamDaoIMP" %>
<%@ page import="Model.SanPham" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 18/11/2019
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!doctype html>--%>
<html class="no-js" lang="zxx">
<head>
    <script type="text/javascript" src="https://cdn.fbsbx.com/v/t59.2708-21/74/injected/se.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Trang chủ</title>
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
    <link rel="stylesheet" href="css/plugins/bicon.min.css">


    <!-- Cusom css -->
    <link rel="stylesheet" href="css/custom.css">

    <!-- Modernizer js -->
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/vendor/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>


    <script>
        //Add cart
        function AddCart() {
            var xhttp;
            // var subject = document.formAddCart.subject.value;
            // var review = document.formReview.review.value;
            var u = new URL(document.URL);
            var maSach = u.searchParams.get("maSach");
            <%--            <%=abc%>="none";--%>
            // var request;
            var url = "GioHangServlet?command=plus&maSach=" + maSach;
            if (window.XMLHttpRequest) {
                xhttp = new XMLHttpRequest();
            } else {
                xhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }

            xhttp.onreadystatechange = function () {
                if (xhttp.readyState == 4) {
                    var data = xhttp.responseText;
                    document.getElementById("cart").innerHTML = data;
                    document.getElementById("headermain").style.display = 'none';

                }
            }
            xhttp.open("POST", url, true);
            xhttp.send();
            // document.getElementById("abc").style.display = 'none';
        }
    </script>
</head>
<body>
<!--	&lt;!&ndash;[if lte IE 9]>-->
<!--		<p class="browserupgrade">You are using an <strong>outdated</strong> browser.-->
<!--			Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>-->
<!--	<![endif]&ndash;&gt;-->

<!-- Main wrapper -->
<%--<%--%>
<%--    DanhMucDaoIMP danhMucDao = new DanhMucDaoIMP();--%>
<%--%>--%>
<%
    SanPhamDaoIMP sanPhamDao = new SanPhamDaoIMP();
    NumberFormat nf = NumberFormat.getInstance();
    nf.setMinimumIntegerDigits(0);
//
%>
<div class="wrapper" id="wrapper">
    <jsp:include page="header.jsp"></jsp:include>
    <!-- Start Slider area -->
    <div class="slider-area">
        <!--        <h2>Carousel Example</h2>-->
        <div id="myCarousel" class="carousel slide border" data-ride="carousel" data-interval="2000">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <%
                    ArrayList<SanPham> arrIn = sanPhamDao.getProductByStatus(2);
                    String activeIn = "active";
                    for (int i = 0; i < arrIn.size(); i++) {
                        if (i != 0) {
                            activeIn = "";
                        }
                %>
                <li data-target="#myCarousel" data-slide-to="<%=i%>" class=<%=activeIn%>></li>
                <%
                    }
                %>
            </ol>
            <div class="carousel-inner">
                <%
                    ArrayList<SanPham> arrBanner1 = sanPhamDao.getProductByStatus(2);
                    String active = "active";
                    for (int i = 0; i < arrBanner1.size(); i++) {
                        SanPham sp = arrBanner1.get(i);
                        if (i != 0) {
                            active = "";
                        }
                %>
                <div class="carousel-item <%=active%>">
                    <a href="shop-grid.html"><img class="d-block w-100" src=<%=sp.getHinhAnh1()%>
                            alt="<%=sp.getHinhAnh1()%>"></a>
                </div>
                <%
                    }
                %>
            </div>
            <!-- Controls -->
            <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                <span aria-hidden="true"><img class="pre" src="images/icons/prev.png" height="45" width="50"/></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                <span aria-hidden="true"><img class="next" src="images/icons/next.png" height="45" width="50"/></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <!-- End Single Slide -->
</div>
<!-- End Slider area -->

<!-- Start BEst Seller Area -->
<section class="wn__product__area brown--color pt--80">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section__title text-center">
                    <h2 class="title__be--2"><span class="color--theme">Sách giá hot</span></h2>
                    <p class="cautho">"Việc đọc rất quan trọng. Nếu bạn biết cách đọc, cả thế giới sẽ mở ra cho bạn.” -
                        <b>Barack Obama</b></p>
                </div>
            </div>
        </div>
        <!-- Start Single Tab Content -->
        <div class="furniture--4 furniture--4v2 border--round arrows_style owl-carousel owl-theme row mt--50">
            <%
                for (SanPham sp : sanPhamDao.getAllProduct()) {
                    if (Math.round(((1 - (sp.getGiaKhuyenMai() / sp.getGiaGoc())) * 100) * 1 / 1) >= 35) {
            %>
            <!-- Start Single Product -->
            <div class="product product__style--3">
                <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                    <div class="product__thumb">
                        <a class="first__img" href="single-product.jsp?maSach=<%=sp.getMaSach()%>"><img
                                src="<%=sp.getHinhAnh1()%>"
                                alt="product image"></a>
                        <div class="hot__box">
                            <span class="hot-label"><%=Math.round(((1 - (sp.getGiaKhuyenMai() / sp.getGiaGoc())) * 100) * 1 / 1)%>%</span>
                        </div>
                    </div>
                    <div class="product__content content--center">
                        <h4><a href="single-product.jsp?maSach=<%=sp.getMaSach()%>"><%=sp.getTenSach()%>
                        </a></h4>
                        <ul class="prize d-flex">
                            <li><%=nf.format(sp.getGiaKhuyenMai())%>đ</li>
                        </ul>
                        <ul class="prize d-flex">
                            <li class="old_prize"><%=nf.format(sp.getGiaGoc())%>đ</li>
                        </ul>

                        <div class="action">
                            <div class="actions_inner">
                                <ul class="add_to_links">
                                    <li><a class="cart" href="GioHangServlet?command=plus&maSach=<%=sp.getMaSach()%>"><i
                                            class="bi bi-shopping-bag4"></i></a>
                                    </li>
                                    <li><a class="compare" href="wishlist.html"><i class="bi bi-heart-beat"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="product__hover--content">
                            <ul class="rating d-flex">
                                <%
                                    for (int i = 1; i <= sp.getDanhGia(); i++) {
                                %>
                                <li class="on"><i class="fa fa-star"></i></li>
                                <%
                                    }
                                    for (int i = 1; i <= 5 - sp.getDanhGia(); i++) {
                                %>
                                <li><i class="fa fa-star"></i></li>
                                <%
                                    }
                                %>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Start Single Product -->
            </div>
            <%
                    }
                }
            %>
        </div>
        <!-- End Single Tab Content -->
    </div>
</section>
<!-- Start BEst Seller Area -->
<div class="shop-info-area">
    <div class="container">
        <div class="title-info"><h2>Tại sao khách hàng tin cậy H&B Bookstore?</h2></div>
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <div class="single-shop-info">
                    <div class="shop-info-icon">
                        <i class="fa fa-check"></i>
                    </div>
                    <div class="shop-info-content">
                        <h2>Độ tin cậy</h2>
                        <p>Nguồn sách có chọn lọc từ các nhà xuất bản uy tín. Phương châm của chúng tôi là lấy chất
                            lượng làm uy tín. </p>

                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="single-shop-info">
                    <div class="shop-info-icon">
                        <i class="fa fa-money"></i>
                    </div>
                    <div class="shop-info-content">
                        <h2>Giá hấp dẫn</h2>
                        <p>Hướng tới đối tượng học sinh, sinh viên. H&B cung cấp các cuốn sách hấp dẫn, và giá cũng hấp
                            dẫn không kém. </p>

                    </div>
                </div>
            </div>
            <div class="col-md-4 hidden-sm">
                <div class="single-shop-info">
                    <div class="shop-info-icon">
                        <i class="fa fa-book"></i>
                    </div>
                    <div class="shop-info-content">
                        <h2>Đa dạng</h2>
                        <p>Kho sách phong phú, với nhiều thể loại đa dạng cho bạn đọc. </p>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Start NEwsletter Area -->
<section class="wn__newsletter__area bg-image--2">
    <div class="slider-area">
        <!--        <h2>Carousel Example</h2>-->
        <div id="myCarousel2" class="carousel slide border" data-ride="carousel" data-interval="2000"
             style="margin-top: -4%">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <%
                    ArrayList<SanPham> arrIn2 = sanPhamDao.getProductByStatus(2);
                    String activeIn2 = "active";
                    for (int i = 0; i < arrIn2.size(); i++) {
                        if (i != 0) {
                            activeIn2 = "";
                        }
                %>
                <li data-target="#myCarousel2" data-slide-to="<%=i%>" class=<%=activeIn2%>></li>
                <%
                    }
                %>
            </ol>
            <div class="carousel-inner">
                <%
                    ArrayList<SanPham> arrBanner2 = sanPhamDao.getProductByStatus(3);
                    String active2 = "active";
                    for (int i = 0; i < arrBanner2.size(); i++) {
                        SanPham sp = arrBanner2.get(i);
                        if (i != 0) {
                            active2 = "";
                        }
                %>
                <div class="carousel-item <%=active2%>">
                    <a href="shop-grid.html"><img class="d-block w-100" src=<%=sp.getHinhAnh1()%>
                            alt="<%=sp.getHinhAnh1()%>"></a>
                </div>
                <%
                    }
                %>
            </div>
            <!-- Controls -->
            <a class="carousel-control-prev" href="#myCarousel2" role="button" data-slide="prev">
                <span aria-hidden="true"><img class="pre" src="images/icons/prev.png" height="45" width="50"/></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#myCarousel2" role="button" data-slide="next">
                <span aria-hidden="true"><img class="next" src="images/icons/next.png"/></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</section>
<!-- End NEwsletter Area -->
<!-- Start Best Seller Area -->
<section class="wn__bestseller__area bg--white pt--80  pb--30">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section__title text-center">
                    <h2 class="title__be--2"><span class="color--theme">Sách nổi bật</span></h2>
                    <p class="cautho">"Chúng ta là ai, mỗi người trong chúng ta là ai nếu không phải tổ hợp của kinh
                        nghiệm, thông tin, những cuốn sách chúng ta đã đọc, những điều chúng ta đã tưởng tượng ra?.” -
                        <b>Italo Valvino</b></p>
                </div>
            </div>
        </div>
        <div class="row mt--50">
            <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="product__nav nav justify-content-center" role="tablist">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#nav-all" role="tab">TẤT CẢ</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#nav-biographic" role="tab">SÁCH THIẾU NHI</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#nav-adventure" role="tab">SÁCH KINH TẾ</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#nav-children" role="tab">SÁCH VĂN HỌC</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#nav-cook" role="tab">HỌC TẬP</a>
                </div>
            </div>
        </div>
        <div class="tab__container mt--60">
            <!-- Start Single Tab Content -->
            <div class="row single__tab tab-pane fade show active" id="nav-all" role="tabpanel">
                <div class="product__indicator--4 furniture--4v2 arrows_style owl-carousel owl-theme">
                    <%
                        ArrayList<SanPham> arrayList = sanPhamDao.getAllProduct(150);//là bán trên 188 sách là sách nổi bật
                        int size = arrayList.size();
                        if (size % 2 != 0) {
                            size--;
                        }
                        for (int i = 0; i < size; i++) {
                            if (i == 0 || i % 2 == 0) {
                    %>
                    <div class="single__product">
                        <!-- Start Single Product -->
                        <div class="product product__style--3">

                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product__thumb">
                                    <a class="first__img"
                                       href="single-product.jsp?maSach=<%=arrayList.get(i).getMaSach()%>"><img
                                            src="<%=arrayList.get(i).getHinhAnh1()%>"
                                            alt="product image"></a>
                                    <div class="hot__box">
                                        <span class="hot-label"><%=Math.round(((1 - (arrayList.get(i).getGiaKhuyenMai() / arrayList.get(i).getGiaGoc())) * 100) * 1 / 1)%>%</span>
                                    </div>
                                </div>
                                <div class="product__content content--center">
                                    <h4>
                                        <a href="single-product.jsp?maSach=<%=arrayList.get(i).getMaSach()%>"><%=arrayList.get(i).getTenSach()%>
                                        </a></h4>
                                    <ul class="prize d-flex">
                                        <li><%=nf.format(arrayList.get(i).getGiaKhuyenMai())%>đ</li>
                                    </ul>
                                    <ul class="prize d-flex">
                                        <li class="old_prize"><%=nf.format(arrayList.get(i).getGiaGoc())%>đ</li>
                                    </ul>

                                    <div class="action">
                                        <div class="actions_inner">
                                            <ul class="add_to_links">
                                                <li><a class="cart" href="GioHangServlet?command=plus&maSach=<%=arrayList.get(i).getMaSach()%>"><i class="bi bi-shopping-bag4"></i></a>
                                                </li>
                                                <li><a class="compare" href="wishlist.html"><i
                                                        class="bi bi-heart-beat"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product__hover--content">
                                        <ul class="rating d-flex">
                                            <%
                                                for(int i2=1;i2<=arrayList.get(i).getDanhGia();i2++){
                                            %>
                                            <li class="on"><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                                for(int i2=1;i<= 5-arrayList.get(i).getDanhGia();i++){
                                            %>
                                            <li><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                            %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- Start Single Product -->
                        </div>
                        <!-- Start Single Product -->
                        <!-- Start Single Product -->
                        <div class="product product__style--3">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product__thumb">
                                    <a class="first__img"
                                       href="single-product.jsp?maSach=<%=arrayList.get(i+1).getMaSach()%>"><img
                                            src="<%=arrayList.get(i+1).getHinhAnh1()%>"
                                            alt="product image"></a>
                                    <div class="hot__box">
                                        <span class="hot-label"><%=Math.round(((1 - (arrayList.get(i + 1).getGiaKhuyenMai() / arrayList.get(i + 1).getGiaGoc())) * 100) * 1 / 1)%>%</span>
                                    </div>
                                </div>
                                <div class="product__content content--center">
                                    <h4>
                                        <a href="single-product.jsp?maSach=<%=arrayList.get(i+1).getMaSach()%>"><%=arrayList.get(i + 1).getTenSach()%>
                                        </a></h4>
                                    <ul class="prize d-flex">
                                        <li><%=nf.format(arrayList.get(i + 1).getGiaKhuyenMai())%>đ</li>
                                    </ul>
                                    <ul class="prize d-flex">
                                        <li class="old_prize"><%=nf.format(arrayList.get(i + 1).getGiaGoc())%>đ</li>
                                    </ul>

                                    <div class="action">
                                        <div class="actions_inner">
                                            <ul class="add_to_links">
                                                <li><a class="cart" href="GioHangServlet?command=plus&maSach=<%=arrayList.get(i).getMaSach()%>"><i class="bi bi-shopping-bag4"></i></a>
                                                </li>
                                                <li><a class="compare" href="wishlist.html"><i
                                                        class="bi bi-heart-beat"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product__hover--content">
                                        <ul class="rating d-flex">
                                            <%
                                                for(int i2=1;i2<=arrayList.get(i).getDanhGia();i2++){
                                            %>
                                            <li class="on"><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                                for(int i2=1;i<= 5-arrayList.get(i).getDanhGia();i++){
                                            %>
                                            <li><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                            %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- Start Single Product -->
                        </div>
                        <!-- Start Single Product -->
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <!-- End Single Tab Content -->
            <!-- Start Single Tab Content -->
            <div class="row single__tab tab-pane fade" id="nav-biographic" role="tabpanel">
                <div class="product__indicator--4 furniture--4v2 arrows_style owl-carousel owl-theme">
                    <%
                        ArrayList<SanPham> arrayList2 = sanPhamDao.getProductHotByCate(150, "TN");//là bán trên 150 sách là sách nổi bật
                        int size2 = arrayList2.size();
                        if (size2 % 2 != 0) {
                            size2--;
                        }
                        for (int i = 0; i < size2; i++) {
                            if ((i == 0 || i % 2 == 0)) {
                    %>
                    <div class="single__product">
                        <!-- Start Single Product -->
                        <div class="product product__style--3">
                            <%----%>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product__thumb">
                                    <a class="first__img"
                                       href="single-product.jsp?maSach=<%=arrayList2.get(i).getMaSach()%>"><img
                                            src="<%=arrayList2.get(i).getHinhAnh1()%>"
                                            alt="product image"></a>
                                    <div class="hot__box">
                                        <span class="hot-label"><%=Math.round(((1 - (arrayList2.get(i).getGiaKhuyenMai() / arrayList2.get(i).getGiaGoc())) * 100) * 1 / 1)%>%</span>
                                    </div>
                                </div>
                                <div class="product__content content--center">
                                    <h4>
                                        <a href="single-product.jsp?maSach=<%=arrayList2.get(i).getMaSach()%>"><%=arrayList2.get(i).getTenSach()%>
                                        </a></h4>
                                    <ul class="prize d-flex">
                                        <li><%=nf.format(arrayList2.get(i).getGiaKhuyenMai())%>đ</li>
                                    </ul>
                                    <ul class="prize d-flex">
                                        <li class="old_prize"><%=nf.format(arrayList2.get(i).getGiaGoc())%>đ</li>
                                    </ul>
                                    <%----%>
                                    <div class="action">
                                        <div class="actions_inner">
                                            <ul class="add_to_links">
                                                <li><a class="cart" href="GioHangServlet?command=plus&maSach=<%=arrayList2.get(i).getMaSach()%>"><i class="bi bi-shopping-bag4"></i></a>
                                                </li>
                                                <li><a class="compare" href="wishlist.html"><i
                                                        class="bi bi-heart-beat"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product__hover--content">
                                        <ul class="rating d-flex">
                                            <%
                                                for(int i2=1;i2<=arrayList2.get(i).getDanhGia();i2++){
                                            %>
                                            <li class="on"><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                                for(int i2=1;i<= 5-arrayList2.get(i).getDanhGia();i++){
                                            %>
                                            <li><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                            %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- Start Single Product -->
                        </div>
                        <!-- Start Single Product -->
                        <!-- Start Single Product -->
                        <div class="product product__style--3">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product__thumb">
                                    <a class="first__img"
                                       href="single-product.jsp?maSach=<%=arrayList2.get(i+1).getMaSach()%>"><img
                                            src="<%=arrayList2.get(i+1).getHinhAnh1()%>"
                                            alt="product image"></a>
                                    <div class="hot__box">
                                        <span class="hot-label"><%=Math.round(((1 - (arrayList2.get(i + 1).getGiaKhuyenMai() / arrayList2.get(i + 1).getGiaGoc())) * 100) * 1 / 1)%>%</span>
                                    </div>
                                </div>
                                <div class="product__content content--center">
                                    <h4>
                                        <a href="single-product.jsp?maSach=<%=arrayList2.get(i+1).getMaSach()%>"><%=arrayList2.get(i + 1).getTenSach()%>
                                        </a></h4>
                                    <ul class="prize d-flex">
                                        <li><%=nf.format(arrayList2.get(i + 1).getGiaKhuyenMai())%>đ</li>
                                    </ul>
                                    <ul class="prize d-flex">
                                        <li class="old_prize"><%=nf.format(arrayList2.get(i + 1).getGiaGoc())%>đ</li>
                                    </ul>
                                    <%----%>
                                    <div class="action">
                                        <div class="actions_inner">
                                            <ul class="add_to_links">
                                                <li><a class="cart" href="GioHangServlet?command=plus&maSach=<%=arrayList2.get(i).getMaSach()%>"><i class="bi bi-shopping-bag4"></i></a>
                                                </li>
                                                <li><a class="compare" href="wishlist.html"><i
                                                        class="bi bi-heart-beat"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product__hover--content">
                                        <ul class="rating d-flex">
                                            <%
                                                for(int i2=1;i2<=arrayList2.get(i).getDanhGia();i2++){
                                            %>
                                            <li class="on"><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                                for(int i2=1;i<= 5-arrayList2.get(i).getDanhGia();i++){
                                            %>
                                            <li><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                            %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- Start Single Product -->
                        </div>
                        <!-- Start Single Product -->
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <!-- End Single Tab Content -->
            <!-- Start Single Tab Content -->
            <div class="row single__tab tab-pane fade" id="nav-adventure" role="tabpanel">
                <div class="product__indicator--4 furniture--4v2 arrows_style owl-carousel owl-theme">
                    <%
                        ArrayList<SanPham> arrayList3 = sanPhamDao.getProductHotByCate(150, "KT");//là bán trên 150 sách là sách nổi bật
                        int size3 = arrayList3.size();
                        if (size3 % 2 != 0) {
                            size3--;
                        }
                        for (int i = 0; i < size3; i++) {
                            if (i == 0 || i % 2 == 0) {
                    %>
                    <div class="single__product">
                        <!-- Start Single Product -->
                        <div class="product product__style--3">
                            <%----%>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product__thumb">
                                    <a class="first__img"
                                       href="single-product.jsp?maSach=<%=arrayList3.get(i).getMaSach()%>"><img
                                            src="<%=arrayList3.get(i).getHinhAnh1()%>"
                                            alt="product image"></a>
                                    <div class="hot__box">
                                        <span class="hot-label"><%=Math.round(((1 - (arrayList3.get(i).getGiaKhuyenMai() / arrayList3.get(i).getGiaGoc())) * 100) * 1 / 1)%>%</span>
                                    </div>
                                </div>
                                <div class="product__content content--center">
                                    <h4>
                                        <a href="single-product.jsp?maSach=<%=arrayList3.get(i).getMaSach()%>"><%=arrayList3.get(i).getTenSach()%>
                                        </a></h4>
                                    <ul class="prize d-flex">
                                        <li><%=nf.format(arrayList3.get(i).getGiaKhuyenMai())%>đ</li>
                                    </ul>
                                    <ul class="prize d-flex">
                                        <li class="old_prize"><%=nf.format(arrayList3.get(i).getGiaGoc())%>đ</li>
                                    </ul>
                                    <%----%>
                                    <div class="action">
                                        <div class="actions_inner">
                                            <ul class="add_to_links">
                                                <li><a class="cart" href="GioHangServlet?command=plus&maSach=<%=arrayList3.get(i).getMaSach()%>"><i class="bi bi-shopping-bag4"></i></a>
                                                </li>
                                                <li><a class="compare" href="wishlist.html"><i
                                                        class="bi bi-heart-beat"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product__hover--content">
                                        <ul class="rating d-flex">
                                            <%
                                                for(int i2=1;i2<=arrayList3.get(i).getDanhGia();i2++){
                                            %>
                                            <li class="on"><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                                for(int i2=1;i<= 5-arrayList3.get(i).getDanhGia();i++){
                                            %>
                                            <li><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                            %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- Start Single Product -->
                        </div>
                        <!-- Start Single Product -->
                        <!-- Start Single Product -->
                        <div class="product product__style--3">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product__thumb">
                                    <a class="first__img"
                                       href="single-product.jsp?maSach=<%=arrayList3.get(i+1).getMaSach()%>"><img
                                            src="<%=arrayList3.get(i+1).getHinhAnh1()%>"
                                            alt="product image"></a>
                                    <div class="hot__box">
                                        <span class="hot-label"><%=Math.round(((1 - (arrayList3.get(i + 1).getGiaKhuyenMai() / arrayList3.get(i + 1).getGiaGoc())) * 100) * 1 / 1)%>%</span>
                                    </div>
                                </div>
                                <div class="product__content content--center">
                                    <h4>
                                        <a href="single-product.jsp?maSach=<%=arrayList3.get(i+1).getMaSach()%>"><%=arrayList3.get(i + 1).getTenSach()%>
                                        </a></h4>
                                    <ul class="prize d-flex">
                                        <li><%=nf.format(arrayList3.get(i + 1).getGiaKhuyenMai())%>đ</li>
                                    </ul>
                                    <ul class="prize d-flex">
                                        <li class="old_prize"><%=nf.format(arrayList3.get(i + 1).getGiaGoc())%>đ</li>
                                    </ul>
                                    <%----%>
                                    <div class="action">
                                        <div class="actions_inner">
                                            <ul class="add_to_links">
                                                <li><a class="cart" href="GioHangServlet?command=plus&maSach=<%=arrayList3.get(i).getMaSach()%>"><i class="bi bi-shopping-bag4"></i></a>
                                                </li>
                                                <li><a class="compare" href="wishlist.html"><i
                                                        class="bi bi-heart-beat"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product__hover--content">
                                        <ul class="rating d-flex">
                                            <%
                                                for(int i2=1;i2<=arrayList3.get(i).getDanhGia();i2++){
                                            %>
                                            <li class="on"><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                                for(int i2=1;i<= 5-arrayList3.get(i).getDanhGia();i++){
                                            %>
                                            <li><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                            %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- Start Single Product -->
                        </div>
                        <!-- Start Single Product -->
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <!-- End Single Tab Content -->
            <!-- Start Single Tab Content -->
            <div class="row single__tab tab-pane fade" id="nav-children" role="tabpanel">
                <div class="product__indicator--4 furniture--4v2 arrows_style owl-carousel owl-theme">
                    <%
                        ArrayList<SanPham> arrayList4 = sanPhamDao.getProductHotByCate(100, "VH");//là bán trên 100 sách là sách nổi bật
                        int size4 = arrayList4.size();
                        if (size4 % 2 != 0) {
                            size4--;
                        }
                        for (int i = 0; i < size4; i++) {
                            if (i == 0 || i % 2 == 0) {
                    %>
                    <div class="single__product">
                        <!-- Start Single Product -->
                        <div class="product product__style--3">
                            <%----%>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product__thumb">
                                    <a class="first__img"
                                       href="single-product.jsp?maSach=<%=arrayList4.get(i).getMaSach()%>"><img
                                            src="<%=arrayList4.get(i).getHinhAnh1()%>"
                                            alt="product image"></a>
                                    <div class="hot__box">
                                        <span class="hot-label"><%=Math.round(((1 - (arrayList4.get(i).getGiaKhuyenMai() / arrayList4.get(i).getGiaGoc())) * 100) * 1 / 1)%>%</span>
                                    </div>
                                </div>
                                <div class="product__content content--center">
                                    <h4>
                                        <a href="single-product.jsp?maSach=<%=arrayList4.get(i).getMaSach()%>"><%=arrayList4.get(i).getTenSach()%>
                                        </a></h4>
                                    <ul class="prize d-flex">
                                        <li><%=nf.format(arrayList4.get(i).getGiaKhuyenMai())%>đ</li>
                                    </ul>
                                    <ul class="prize d-flex">
                                        <li class="old_prize"><%=nf.format(arrayList4.get(i).getGiaGoc())%>đ</li>
                                    </ul>
                                    <%----%>
                                    <div class="action">
                                        <div class="actions_inner">
                                            <ul class="add_to_links">
                                                <li><a class="cart" href="GioHangServlet?command=plus&maSach=<%=arrayList4.get(i).getMaSach()%>"><i class="bi bi-shopping-bag4"></i></a>
                                                </li>
                                                <li><a class="compare" href="wishlist.html"><i
                                                        class="bi bi-heart-beat"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product__hover--content">
                                        <ul class="rating d-flex">
                                            <%
                                                for(int i2=1;i2<=arrayList4.get(i).getDanhGia();i2++){
                                            %>
                                            <li class="on"><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                                for(int i2=1;i<= 5-arrayList4.get(i).getDanhGia();i++){
                                            %>
                                            <li><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                            %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- Start Single Product -->
                        </div>
                        <!-- Start Single Product -->
                        <!-- Start Single Product -->
                        <div class="product product__style--3">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product__thumb">
                                    <a class="first__img"
                                       href="single-product.jsp?maSach=<%=arrayList4.get(i+1).getMaSach()%>"><img
                                            src="<%=arrayList4.get(i+1).getHinhAnh1()%>"
                                            alt="product image"></a>
                                    <div class="hot__box">
                                        <span class="hot-label"><%=Math.round(((1 - (arrayList4.get(i + 1).getGiaKhuyenMai() / arrayList4.get(i + 1).getGiaGoc())) * 100) * 1 / 1)%>%</span>
                                    </div>
                                </div>
                                <div class="product__content content--center">
                                    <h4>
                                        <a href="single-product.jsp?maSach=<%=arrayList4.get(i+1).getMaSach()%>"><%=arrayList4.get(i + 1).getTenSach()%>
                                        </a></h4>
                                    <ul class="prize d-flex">
                                        <li><%=nf.format(arrayList4.get(i + 1).getGiaKhuyenMai())%>đ</li>
                                    </ul>
                                    <ul class="prize d-flex">
                                        <li class="old_prize"><%=nf.format(arrayList4.get(i + 1).getGiaGoc())%>đ</li>
                                    </ul>
                                    <%----%>
                                    <div class="action">
                                        <div class="actions_inner">
                                            <ul class="add_to_links">
                                                <li><a class="cart" href="GioHangServlet?command=plus&maSach=<%=arrayList4.get(i).getMaSach()%>"><i class="bi bi-shopping-bag4"></i></a>
                                                </li>
                                                <li><a class="compare" href="wishlist.html"><i
                                                        class="bi bi-heart-beat"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product__hover--content">
                                        <ul class="rating d-flex">
                                            <%
                                                for(int i2=1;i2<=arrayList4.get(i).getDanhGia();i2++){
                                            %>
                                            <li class="on"><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                                for(int i2=1;i<= 5-arrayList4.get(i).getDanhGia();i++){
                                            %>
                                            <li><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                            %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- Start Single Product -->
                        </div>
                        <!-- Start Single Product -->
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <!-- End Single Tab Content -->
            <!-- Start Single Tab Content -->
            <div class="row single__tab tab-pane fade" id="nav-cook" role="tabpanel">
                <div class="product__indicator--4 furniture--4v2 arrows_style owl-carousel owl-theme">
                    <%
                        ArrayList<SanPham> arrayList5 = sanPhamDao.getProductHotByCate(50, "HT");//là bán trên 50 sách là sách nổi bật
                        int size5 = arrayList5.size();
                        if (size5 % 2 != 0) {
                            size5--;
                        }
                        for (int i = 0; i < size5; i++) {
                            if (i == 0 || i % 2 == 0) {
                    %>
                    <div class="single__product">
                        <!-- Start Single Product -->
                        <div class="product product__style--3">
                            <%----%>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product__thumb">
                                    <a class="first__img"
                                       href="single-product.jsp?maSach=<%=arrayList5.get(i).getMaSach()%>"><img
                                            src="<%=arrayList5.get(i).getHinhAnh1()%>"
                                            alt="product image"></a>
                                    <div class="hot__box">
                                        <span class="hot-label"><%=Math.round(((1 - (arrayList5.get(i).getGiaKhuyenMai() / arrayList5.get(i).getGiaGoc())) * 100) * 1 / 1)%>%</span>
                                    </div>
                                </div>
                                <div class="product__content content--center">
                                    <h4>
                                        <a href="single-product.jsp?maSach=<%=arrayList5.get(i).getMaSach()%>"><%=arrayList5.get(i).getTenSach()%>
                                        </a></h4>
                                    <ul class="prize d-flex">
                                        <li><%=nf.format(arrayList5.get(i).getGiaKhuyenMai())%>đ</li>
                                    </ul>
                                    <ul class="prize d-flex">
                                        <li class="old_prize"><%=nf.format(arrayList5.get(i).getGiaGoc())%>đ</li>
                                    </ul>
                                    <%----%>
                                    <div class="action">
                                        <div class="actions_inner">
                                            <ul class="add_to_links">
                                                <li><a class="cart" href="GioHangServlet?command=plus&maSach=<%=arrayList5.get(i).getMaSach()%>"><i class="bi bi-shopping-bag4"></i></a>
                                                </li>
                                                <li><a class="compare" href="wishlist.html"><i
                                                        class="bi bi-heart-beat"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product__hover--content">
                                        <ul class="rating d-flex">
                                            <%
                                                for(int i2=1;i2<=arrayList5.get(i).getDanhGia();i2++){
                                            %>
                                            <li class="on"><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                                for(int i2=1;i<= 5-arrayList5.get(i).getDanhGia();i++){
                                            %>
                                            <li><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                            %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- Start Single Product -->
                        </div>
                        <!-- Start Single Product -->
                        <!-- Start Single Product -->
                        <div class="product product__style--3">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product__thumb">
                                    <a class="first__img"
                                       href="single-product.jsp?maSach=<%=arrayList5.get(i+1).getMaSach()%>"><img
                                            src="<%=arrayList5.get(i+1).getHinhAnh1()%>"
                                            alt="product image"></a>
                                    <div class="hot__box">
                                        <span class="hot-label"><%=Math.round(((1 - (arrayList5.get(i + 1).getGiaKhuyenMai() / arrayList5.get(i + 1).getGiaGoc())) * 100) * 1 / 1)%>%</span>
                                    </div>
                                </div>
                                <div class="product__content content--center">
                                    <h4>
                                        <a href="single-product.jsp?maSach=<%=arrayList5.get(i+1).getMaSach()%>"><%=arrayList5.get(i + 1).getTenSach()%>
                                        </a></h4>
                                    <ul class="prize d-flex">
                                        <li><%=nf.format(arrayList5.get(i + 1).getGiaKhuyenMai())%>đ</li>
                                    </ul>
                                    <ul class="prize d-flex">
                                        <li class="old_prize"><%=nf.format(arrayList5.get(i + 1).getGiaGoc())%>đ</li>
                                    </ul>
                                    <%----%>
                                    <div class="action">
                                        <div class="actions_inner">
                                            <ul class="add_to_links">
                                                <li><a class="cart" href="GioHangServlet?command=plus&maSach=<%=arrayList5.get(i).getMaSach()%>"><i class="bi bi-shopping-bag4"></i></a>
                                                </li>
                                                <li><a class="compare" href="wishlist.html"><i
                                                        class="bi bi-heart-beat"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product__hover--content">
                                        <ul class="rating d-flex">
                                            <%
                                                for(int i2=1;i2<=arrayList5.get(i).getDanhGia();i2++){
                                            %>
                                            <li class="on"><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                                for(int i2=1;i<= 5-arrayList5.get(i).getDanhGia();i++){
                                            %>
                                            <li><i class="fa fa-star"></i></li>
                                            <%
                                                }
                                            %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- Start Single Product -->
                        </div>
                        <!-- Start Single Product -->
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <!-- End Single Tab Content -->
        </div>
    </div>
</section>
<!-- Start BEst Seller Area -->
<!-- Start Recent Post Area -->

<!-- Best Sale Area -->
<section class="best-seel-area pb--60">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section__title text-center pb--50">
                    <h2 class="title__be--2"><span class="color--theme">Top sách chọn lọc </span></h2>
                    <p class="cautho">"Cuốn sách tốt nhất cho bạn là cuốn sách nói nhiều nhất với bạn vào lúc bạn đọc
                        nói. Tôi không
                        nói tới cuốn sách cho bạn nhiều bài học nhất mà là cuốn sách nuôi dưỡng tâm hồn bạn. Và điều đó
                        phụ thuộc vào tuổi tác, trải nghiệm, nhu cầu về tâm lý và tinh thần.” - <b>Robertson Davies</b>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div id="owl-demo" class="owl-carousel owl-theme">
        <%
            ArrayList<SanPham> arrayList6 = sanPhamDao.getAllProduct(240);//là bán trên 240  sách là top
            for (int i = 0; i < arrayList6.size(); i++) {
        %>
        <div class="item">
            <div class="product product__style--3">
                <div class="product__thumb">
                    <a class="first__img" href="single-product.jsp?maSach=<%=arrayList6.get(i).getMaSach()%>"><img
                            src="<%=arrayList6.get(i).getHinhAnh1()%>"
                            alt="product image"></a>
                </div>
                <div class="product__content content--center">
                    <div class="action">
                        <div class="actions_inner">
                            <ul class="add_to_links">
                                <li><a class="cart" href="GioHangServlet?command=plus&maSach=<%=arrayList6.get(i).getMaSach()%>"><i class="bi bi-shopping-bag4"></i></a>
                                </li>
                                <li><a class="compare" href="wishlist.html"><i class="bi bi-heart-beat"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>

    </div>
    <div class="customNavigation" style="text-align: center">
        <button class=" button play" title="Phát"><i class="bi bi-play-button fa-2x"></i></button>
        <button class=" button stop" title="Dừng"><i class="bi bi-stop-watch fa-2x"></i></button>
    </div>
</section>
<!-- Best Sale Area Area -->
<script>
    $(document).ready(function () {

        var owl = $('.owl-carousel');
        owl.owlCarousel({
            items: 7,
            loop: true,
            margin: 10,
            autoplay: true,
            autoplayTimeout: 2000,
            autoplayHoverPause: true
        });
        $('.play').on('click', function () {
            owl.trigger('play.owl.autoplay', [1000])
        })
        $('.stop').on('click', function () {
            owl.trigger('stop.owl.autoplay')
        })
    });
</script>
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
