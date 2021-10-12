<%@ page import="dao.TinTucDaoIMP" %>
<%@ page import="Model.TinTuc" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 19/11/2019
  Time: 8:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Tin tức</title>
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
                            <span class="breadcrumb_item active">Tin tức</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- Start Blog Area -->
    <div class="page-blog bg--white section-padding--lg blog-sidebar right-sidebar">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 col-12">
                    <div class="blog-page">
                        <div class="page__header">
                            <h2>Tin tức: H&B</h2>
                        </div>
                        <!-- Start Single Post -->
                        <article class="blog__post d-flex flex-wrap">
                            <div class="thumb">
                                <a href="blog-details.jsp">
                                    <img src="images/blog/blog-3/981.jpg" alt="blog images">
                                </a>
                            </div>
                            <div class="thumb">
                                <a href="blog-details.jsp">
                                    <img src="images/blog/blog-3/12-2.jpg" alt="blog images">
                                </a>
                            </div>
                        </article>
                        <!--							-->
                        <article class="blog__post d-flex flex-wrap">
                            <%
                                for (TinTuc tinTuc : tinTucDaoIMP.getListTinTuc()){
                            %>
                            <div class="content">
                                <h4><a href="blog-details.jsp?maTinTuc=<%=tinTuc.getMaTinTuc()%>"><%=tinTuc.getTieuDe()%></a></h4>
                                <ul class="post__meta">
                                    <li>Đăng vào: <%=tinTuc.getTime()%></li>
                                </ul>
<%--                                <p>Mua sách giảm tới 50%</p>--%>
                                <div class="blog__btn">
                                    <a href="blog-details.html">Đọc thêm</a>
                                </div>
                            </div>
                            <%
                                }
                            %>
<%--                            <div class="content">--%>
<%--                                <h4><a href="blog-details.html">Thử thách đọc sách</a></h4>--%>
<%--                                <ul class="post__meta">--%>
<%--                                    <li>Đăng vào: 10-10-2019</li>--%>
<%--                                </ul>--%>
<%--                                <p>Đọc sách hàng tháng để tham gia ưu đãi</p>--%>
<%--                                <div class="blog__btn">--%>
<%--                                    <a href="blog-details.html">Đọc thêm</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </article>
                        <!-- End Single Post -->
                        <!-- Start Single Post -->
<%--                        <article class="blog__post d-flex flex-wrap">--%>
<%--                            <div class="thumb">--%>
<%--                                <a href="blog-details.html">--%>
<%--                                    <img src="images/blog/blog-3/ramdisk_crop_181933454_Ca0h.jpg" alt="blog images">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="thumb">--%>
<%--                                <a href="blog-details.html">--%>
<%--                                    <img src="images/blog/blog-3/1206_Affiliate_Sach_1200x630.jpg" alt="blog images">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                        </article>--%>
<%--                        <!--							-->--%>
<%--                        <article class="blog__post d-flex flex-wrap">--%>
<%--                            <div class="content">--%>
<%--                                <h4><a href="blog-details.html">Miễn phí vận chuyển</a></h4>--%>
<%--                                <ul class="post__meta">--%>
<%--                                    <li>Đăng vào 10-01-2019</li>--%>
<%--                                </ul>--%>
<%--                                <p>Miễn phí vận chuyển dù là một quyển sách</p>--%>
<%--                                <div class="blog__btn">--%>
<%--                                    <a href="blog-details.html">Đọc thêm</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="content">--%>
<%--                                <h4><a href="blog-details.html">Giảm giá sát sàn</a></h4>--%>
<%--                                <ul class="post__meta">--%>
<%--                                    <li>Đăng vào: 12-10-2019</li>--%>
<%--                                </ul>--%>
<%--                                <p>Giảm ít nhất 25% trên 1000 tựa sách</p>--%>
<%--                                <div class="blog__btn">--%>
<%--                                    <a href="blog-details.html">Đọc thêm</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </article>--%>
                        <!-- End Single Post -->
                    </div>
<%--                    <ul class="wn__pagination">--%>
<%--                        <li class="active"><a href="#">1</a></li>--%>
<%--                        <li><a href="#">2</a></li>--%>
<%--                        <li><a href="#">3</a></li>--%>
<%--                        <li><a href="#">4</a></li>--%>
<%--                        <li><a href="#"><i class="zmdi zmdi-chevron-right"></i></a></li>--%>
<%--                    </ul>--%>
                </div>
                <div class="col-lg-3 col-12 md-mt-40 sm-mt-40">
                    <div class="wn__sidebar">
                        <!-- Start Single Widget -->
                        <aside class="widget search_widget">
                            <h3 class="widget-title">Big sale</h3>
                            <!--        						<form action="#">-->
                            <!--        							<div class="form-input">-->
                            <!--        								<input type="text" placeholder="Search...">-->
                            <!--        								<button><i class="fa fa-search"></i></button>-->
                            <!--        							</div>-->
                            <!--        						</form>-->
                            <a href="#"><img src="images/blog/blog-3/bigsale.jpg"></a>
                        </aside>
                        <!-- End Single Widget -->
                        <!-- Start Single Widget -->
                        <aside class="widget search_widget">
                            <h3 class="widget-title">Sale 50%</h3>
                            <!--        						<form action="#">-->
                            <!--        							<div class="form-input">-->
                            <!--        								<input type="text" placeholder="Search...">-->
                            <!--        								<button><i class="fa fa-search"></i></button>-->
                            <!--        							</div>-->
                            <!--        						</form>-->
                            <a href="#"><img src="images/blog/blog-3/sale50.jpg"></a>
                        </aside>
                        <!-- End Single Widget -->
                        <!-- Start Single Widget -->
                        <aside class="widget search_widget">
                            <h3 class="widget-title">Sale 8/3</h3>
                            <!--        						<form action="#">-->
                            <!--        							<div class="form-input">-->
                            <!--        								<input type="text" placeholder="Search...">-->
                            <!--        								<button><i class="fa fa-search"></i></button>-->
                            <!--        							</div>-->
                            <!--        						</form>-->
                            <a href="#"><img src="images/blog/blog-3/sale8-3.png"></a>
                        </aside>
                        <!-- End Single Widget -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Blog Area -->

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
