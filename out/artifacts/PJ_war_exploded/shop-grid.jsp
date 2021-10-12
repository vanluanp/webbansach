<%@ page import="Model.SanPham" %>
<%@ page import="dao.SanPhamDaoIMP" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.DanhMuc" %>
<%@ page import="dao.DanhMucDaoIMP" %>
<%@ page import="Model.NhaXuatBan" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 22/11/2019
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <script type="text/javascript" src="https://mail-attachment/injected/se.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Danh sách</title>
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
                        <h2 class="bradcaump-title">Danh sách sản phẩm</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Danh sách sản phẩm</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- Start Shop Page -->
    <div class="page-shop-sidebar left--sidebar bg--white section-padding--lg">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-12 order-2 order-lg-1 md-mt-40 sm-mt-40">
                    <div class="shop__sidebar">
                        <%--                        <aside class="wedget__categories poroduct--cat">--%>
                        <%--                            <h3 class="wedget__title">Thể loại</h3>--%>
                        <%--                            <ul>--%>
                        <%--                                <li><a href="#">Tiểu thuyết <span>(10)</span></a></li>--%>
                        <%--                                <li><a href="#">Truyện ngắn <span>(15)</span></a></li>--%>
                        <%--                                <li><a href="#">Ngôn tình <span>(15)</span></a></li>--%>
                        <%--                                <li><a href="#">Tác phẩm nước ngoài <span>(12)</span></a></li>--%>
                        <%--                            </ul>--%>
                        <%--                        </aside>--%>
                        <aside class="wedget__categories poroduct--tag">
                            <h3 class="wedget__title">Giá</h3>
                            <ul>
                                <li><a href="shop-grid.jsp?p1=150000&p2=500000">Trên 150.000đ</a></li>
                                <li><a href="shop-grid.jsp?p1=100000&p2=150000">Dưới 150.000đ</a></li>
                                <li><a href="shop-grid.jsp?p1=50000&p2=100000">Dưới 100.000đ</a></li>
                                <li><a href="shop-grid.jsp?p1=10000&p2=50000">Dưới 50.000đ</a></li>
                            </ul>
                        </aside>
                        <%
                            DanhMucDaoIMP danhMucDaoIMP = new DanhMucDaoIMP();
                            ArrayList<NhaXuatBan> listNXB = danhMucDaoIMP.getListNXB();
                        %>
                        <aside class="wedget__categories poroduct--cat">
                            <h3 class="wedget__title">Nhà xuất bản</h3>
                            <ul>
                                <%
                                    for (int i = 0; i < listNXB.size(); i++) {
                                %>
                                <li>
                                    <a href="shop-grid.jsp?maNhaXuatBan=<%=listNXB.get(i).getMaNhaXuatBan()%>"><%=listNXB.get(i).getTenNhaXuatBan()%><span>(<%=danhMucDaoIMP.getNumListNXB(listNXB.get(i).getMaNhaXuatBan())%>)</span></a>
                                </li>
                                <%
                                    }
                                %>
                                <%--                                <li><a href="#">Bách Việt <span>(15)</span></a></li>--%>
                                <%--                                <li><a href="#">NXB Phụ Nữ <span>(15)</span></a></li>--%>
                                <%--                                <li><a href="#">Alpha Books <span>(22)</span></a></li>--%>
                            </ul>
                        </aside>
                        <aside>
                            <%--                            /////////////SALE////////////////--%>
                            <div class="wn__sidebar">
                                <!-- Start Single Widget -->
                                <%
                                    ArrayList<SanPham> arrSale = new SanPhamDaoIMP().getProductByStatus(4);
                                    for (int i = 0; i < arrSale.size(); i++) {
                                        SanPham spSale = arrSale.get(i);
                                %>
                                <aside class="widget search_widget">
                                    <h3 class="widget-title"><%=spSale.getTenSach()%>
                                    </h3>
                                    <!--        						<form action="#">-->
                                    <!--        							<div class="form-input">-->
                                    <!--        								<input type="text" placeholder="Search...">-->
                                    <!--        								<button><i class="fa fa-search"></i></button>-->
                                    <!--        							</div>-->
                                    <!--        						</form>-->
                                    <a href="#"><img src="<%=spSale.getHinhAnh1()%>"></a>
                                </aside>
                                <%
                                    }
                                %>
                                <!-- End Single Widget -->
                                <%--                                <!-- Start Single Widget -->--%>
                                <%--                                <aside class="widget search_widget">--%>
                                <%--                                    <h3 class="widget-title">Sale 50%</h3>--%>
                                <%--                                    <!--        						<form action="#">-->--%>
                                <%--                                    <!--        							<div class="form-input">-->--%>
                                <%--                                    <!--        								<input type="text" placeholder="Search...">-->--%>
                                <%--                                    <!--        								<button><i class="fa fa-search"></i></button>-->--%>
                                <%--                                    <!--        							</div>-->--%>
                                <%--                                    <!--        						</form>-->--%>
                                <%--                                    <a href="#"><img src="images/blog/blog-3/5e26e38df1b4471f732e7b89f3cd6601.jpg"></a>--%>
                                <%--                                </aside>--%>
                                <%--                                <!-- End Single Widget -->--%>
                                <%--                                <!-- Start Single Widget -->--%>
                                <%--                                <aside class="widget search_widget">--%>
                                <%--                                    <h3 class="widget-title">Sale 8/3</h3>--%>
                                <%--                                    <!--        						<form action="#">-->--%>
                                <%--                                    <!--        							<div class="form-input">-->--%>
                                <%--                                    <!--        								<input type="text" placeholder="Search...">-->--%>
                                <%--                                    <!--        								<button><i class="fa fa-search"></i></button>-->--%>
                                <%--                                    <!--        							</div>-->--%>
                                <%--                                    <!--        						</form>-->--%>
                                <%--                                    <a href="#"><img--%>
                                <%--                                            src="images/blog/blog-3/52999962-994063307450168-3207249248986857472-n.png"></a>--%>
                                <%--                                </aside>--%>
                                <%--                                <!-- End Single Widget -->--%>
                            </div>

                            <%--                            <img src="images/png-img/momo.jpg" height="700" width="400"/>--%>
                        </aside>
                    </div>
                </div>
                <div class="col-lg-9 col-12 order-1 order-lg-2">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="shop__list__wrapper d-flex flex-wrap flex-md-nowrap justify-content-between">
                                <div class="shop__list nav justify-content-center" role="tablist">
                                    <a class="nav-item nav-link active" data-toggle="tab" href="#nav-grid" role="tab"><i
                                            class="fa fa-th"></i></a>
                                    <a class="nav-item nav-link" data-toggle="tab" href="#nav-list" role="tab"><i
                                            class="fa fa-list"></i></a>
                                </div>
                                <p>Hiển thị 12 quyển sách</p>
                            </div>
                        </div>
                    </div>
                    <%
                        SanPhamDaoIMP sanPhamDao = new SanPhamDaoIMP();
                        NumberFormat nf = NumberFormat.getInstance();
                        nf.setMinimumIntegerDigits(0);
                        ArrayList<SanPham> arr = new ArrayList<>();
                        if (request.getParameter("maDanhMuc") != null) {
                            arr = sanPhamDao.getListProductByCategory(request.getParameter("maDanhMuc"));
                        }
                        if (request.getParameter("maNhaXuatBan") != null) {
                            arr = sanPhamDao.getListProductByComp(request.getParameter("maNhaXuatBan"));
                        }
                        if (request.getParameter("p1") != null && request.getParameter("p2") != null) {
                            arr = sanPhamDao.getListProductByPrice(Double.parseDouble(request.getParameter("p1")), Double.parseDouble(request.getParameter("p2")));
                        }
                        int start = 0, end = 12;
                        if (arr.size() < 12) {
                            end = arr.size();
                        }
                        if (request.getParameter("start") != null) {
                            start = Integer.parseInt(request.getParameter("start"));
                        }
                        if (request.getParameter("end") != null) {
                            end = Integer.parseInt(request.getParameter("end"));
                        }
                        ArrayList<SanPham> list = sanPhamDao.getListByPage(arr, start, end);
                    %>
                    <div class="tab__container">
                        <div class="shop-grid tab-pane fade show active" id="nav-grid" role="tabpanel">
                            <div class="row">
                                <!-- Start Single Product -->
                                <%
                                    for (SanPham sp : list) {
                                %>
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
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
                                                    <li><a class="cart"
                                                           href="GioHangServlet?command=plus&maSach=<%=sp.getMaSach()%>"><i
                                                            class="bi bi-shopping-bag4"></i></a>
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
                                <%
                                    }
                                %>
                                <!-- Start Single Product -->


                            </div>
                            <ul class="wn__pagination">
                                <% if (start >= 12) {%>
                                <li>
                                    <a href="shop-grid.jsp?start=<%=start-12%>&end=<%=(end%12==0)?(end-12): end-(end%12)%>&maDanhMuc=<%=request.getParameter("maDanhMuc")%>&maNhaXuatBan=<%=request.getParameter("maNhaXuatBan")%>"><i
                                            class="zmdi zmdi-chevron-left"></i></a></li>
                                <%}%>
                                <%
                                    int a, b;
                                    int limit = arr.size() / 12;
                                    if (limit * 12 < arr.size()) {
                                        limit += 1;
                                    }
                                    for (int i = 1; i <= limit; i++) {
                                        a = (i - 1) * 12;
                                        b = i * 12;
                                        if (b > arr.size()) {
                                            b = arr.size();
                                        }
                                %>
                                <li>
                                    <a href="shop-grid.jsp?start=<%=a%>&end=<%=b%>&maDanhMuc=<%=request.getParameter("maDanhMuc")%>&maNhaXuatBan=<%=request.getParameter("maNhaXuatBan")%>"><%=i%>
                                    </a></li>
                                <%
                                    }
                                    if (end < arr.size()) {
                                %>
                                <li>
                                    <a href="shop-grid.jsp?start=<%=start+12%>&end=<%=((end+12)>arr.size()?arr.size():end+12)%>&maDanhMuc=<%=request.getParameter("maDanhMuc")%>&maNhaXuatBan=<%=request.getParameter("maNhaXuatBan")%>"><i
                                            class="zmdi zmdi-chevron-right"></i></a></li>
                                <%}%>
                            </ul>
                        </div>
                        <div class="shop-grid tab-pane fade" id="nav-list" role="tabpanel">
                            <div class="list__view__wrapper">
                                <%
                                    for (SanPham sp : list) {
                                %>
                                <!-- Start Single Product -->
                                <div class="list__view">
                                    <div class="thumb">
                                        <a class="first__img" href="single-product.jsp?maSach=<%=sp.getMaSach()%>"><img
                                                src="<%=sp.getHinhAnh1()%>"
                                                alt="product image"></a>
                                    </div>
                                    <div class="content">
                                        <h2>
                                            <a href="single-product.jsp?maSach=<%=sp.getMaSach()%>"><%=sp.getTenSach()%>
                                            </a></h2>
                                        <ul class="prize__box">
                                            <li><%=nf.format(sp.getGiaKhuyenMai())%>đ</li>
                                            <li class="old_prize" style="color: #2b2929">
                                                <strike><%=nf.format(sp.getGiaGoc())%>đ</strike></li>
                                        </ul>
                                        <p><%
                                            String file2 = sp.getMoTa();
                                            InputStream ins2 = application.getResourceAsStream(file2);
                                            BufferedReader input2 = new BufferedReader(new InputStreamReader(ins2, "UTF-8"));
                                            String line2 = "";
                                            int temp = 0;
                                            a:
                                            while ((line2 = input2.readLine()) != null) {
                                                temp++;
                                                out.println(line2 + "</br>");
                                                if (temp == 2) {
                                                    break a;
                                                }
                                            }
                                            input2.close();
                                        %>...</p>

                                        <ul class="cart__action d-flex">
                                            <li class="cart"><a
                                                    href="GioHangServlet?command=plus&maSach=<%=sp.getMaSach()%>"><i
                                                    class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</a></li>
                                            <li class="cart"><a href="cart.html"><i
                                                    class="fa fa-heart"></i> Yêu thích</a></li>
                                        </ul>

                                    </div>
                                </div>
                                <!-- End Single Product -->
                                <%
                                    }
                                %>
                            </div>
                            <ul class="wn__pagination">
                                <% if (start >= 12) {%>
                                <li>
                                    <a href="shop-grid.jsp?start=<%=start-12%>&end=<%=(end%12==0)?(end-12): end-(end%12)%>&maDanhMuc=<%=request.getParameter("maDanhMuc")%>"><i
                                            class="zmdi zmdi-chevron-left"></i></a></li>
                                <%}%>
                                <%
                                    if (limit * 12 < arr.size()) {
                                        limit += 1;
                                    }
                                    for (int i = 1; i <= limit; i++) {
                                        a = (i - 1) * 12;
                                        b = i * 12;
                                        if (b > arr.size()) {
                                            b = arr.size();
                                        }
                                %>
                                <li>
                                    <a href="shop-grid.jsp?start=<%=a%>&end=<%=b%>&maDanhMuc=<%=request.getParameter("maDanhMuc")%>"><%=i%>
                                    </a></li>
                                <%
                                    }
                                    if (end < arr.size()) {
                                %>
                                <li>
                                    <a href="shop-grid.jsp?start=<%=start+12%>&end=<%=((end+12)>arr.size()?arr.size():end+12)%>&maDanhMuc=<%=request.getParameter("maDanhMuc")%>"><i
                                            class="zmdi zmdi-chevron-right"></i></a></li>
                                <%}%>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Shop Page -->
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
