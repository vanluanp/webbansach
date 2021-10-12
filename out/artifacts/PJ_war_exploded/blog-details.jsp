<%@ page import="dao.TinTucDaoIMP" %>
<%@ page import="Model.TinTuc" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 19/11/2019
  Time: 8:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Nội dung tin tức</title>
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
<%
    TinTucDaoIMP tinTucDaoIMP= new TinTucDaoIMP();
    TinTuc tinTuc = tinTucDaoIMP.getTinTuc(request.getParameter("maTinTuc"));
%>
    <!-- Header -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- Start Bradcaump area -->
    <div class="ht__bradcaump__area bg-image--6" style="margin-top: 6.3%">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">Tin tức</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                            <span class="brd-separetor">/</span>
                            <a class="breadcrumb_item" href="index.html">Tin tức</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Nội dung tin tức</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <div class="page-blog-details section-padding--lg bg--white">
        <div class="container blogcont">
            <div class="row">
                <div class="col-lg-9 col-12">
                    <div class="blog-details content">
                        <article class="blog-post-details">
                            <div class="post_wrapper">
                                <div class="post_header">
                                    <h2> <%=tinTuc.getTieuDe()%></h2>
                                    <div class="blog-date-categori">
                                        <ul>
                                            <li><%=tinTuc.getTime()%></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="post_content">
                                    <%=tinTuc.getNoiDung()%>
                                </div>
                            </div>
                            <div class="blog-page">
                                <div class="page__header">
                                    <h2>Tin khác</h2>
                                </div>
                                <!-- Start Single Post -->
                                <article class="blog__post d-flex flex-wrap">
                                    <div class="thumb">
                                        <a href="blog-details.html">
                                            <img src="images/blog/blog-3/12-2.jpg" alt="blog images">
                                        </a>
                                    </div>
                                    <div class="content">
                                        <h4><a href="blog-details.html">Tích điểm</a></h4>
                                        <ul class="post__meta">
                                            <li>Đăng vào: 13-11-2019</li>
                                        </ul>
                                        <p>Mua sách giảm tới 50%</p>
                                        <div class="blog__btn">
                                            <a href="blog-details.html">Đọc thêm</a>
                                        </div>
                                    </div>
                                </article>
                                <!--							-->
                                <article class="blog__post d-flex flex-wrap">
                                    <div class="thumb">
                                        <a href="blog-details.html">
                                            <img src="images/blog/blog-3/981.jpg" alt="blog images">
                                        </a>
                                    </div>
                                    <div class="content">
                                        <h4><a href="blog-details.html">Thử thách đọc sách</a></h4>
                                        <ul class="post__meta">
                                            <li>Đăng vào: 10-10-2019</li>
                                        </ul>
                                        <p>Đọc sách hàng tháng để tham gia ưu đãi</p>
                                        <div class="blog__btn">
                                            <a href="blog-details.html">Đọc thêm</a>
                                        </div>
                                    </div>
                                </article>
                                <!-- End Single Post -->
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
