<%@ page import="Model.DanhMuc" %>
<%@ page import="dao.DanhMucDaoIMP" %>
<%@ page import="Model.GioHang" %>
<%@ page import="Util.Util" %>
<%@ page import="Model.NhaXuatBan" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24/11/2019
  Time: 5:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>

        // Safari reports success of list attribute, so doing ghetto detection instead
        yepnope({
            test: (!Modernizr.input.list || (parseInt($.browser.version) > 400)),
            yep: [
                'https://raw2.github.com/CSS-Tricks/Relevant-Dropdowns/master/js/jquery.relevant-dropdown.js',
                'https://raw2.github.com/CSS-Tricks/Relevant-Dropdowns/master/js/load-fallbacks.js'
            ]
        });
    </script>
</head>
<body>
<%
    DanhMucDaoIMP danhMucDao = new DanhMucDaoIMP();
    String userName = "";
    if (session.getAttribute("userName") != null) {
        userName = (String) session.getAttribute("userName");
    } else {
        userName = "Tài khoản";
    }
    //
    GioHang cart = (GioHang) session.getAttribute("cart");
    if (cart == null) {
        cart = new GioHang();
        session.setAttribute("cart", cart);
    }
    String mode = (String) session.getAttribute("mode");
    if (mode == null) {
        mode = "none";
    }
    String modeHidden = (String) session.getAttribute("modeHidden");
    if (modeHidden == null) {
        modeHidden = "block";
    }
    String modeUser = (String) session.getAttribute("modeUser");
    if (modeUser == null) {
        modeUser = "none";
    }
    String modeMain = (String) session.getAttribute("modeMain");
    if (modeMain == null) {
        modeMain = "none";
    }
%>
<!-- Header -->
<header id="wn__header" class="header__area header__absolute sticky__header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-6 col-lg-2">
                <div class="logo">
                    <a href="index.html">
                        <img src=<%=Util.utilUser("images/Logo2.png")%> alt="logoimages">
                    </a>
                </div>
            </div>
            <div class="col-lg-8 d-none d-lg-block">
                <nav class="mainmenu__nav">
                    <ul class="meninmenu d-flex justify-content-start">
                        <li class="drop with--one--item"><a class="active" href="index.jsp">Trang chủ</a></li>
                        <li class="drop"><a href="#"> Thể loại </a>
                            <div class="megamenu mega03">
                                <%for (DanhMuc danhmucCha : danhMucDao.getList()) {%>
                                <ul class="item item03">
                                    <a href="shop-grid.jsp?maDanhMuc=<%=danhmucCha.getMaDanhMuc()%>">
                                        <li class="title"><%=danhmucCha.getTenDanhMuc()%>
                                        </li>
                                    </a>
                                    <%
                                        for (DanhMuc danhmucCon : danhMucDao.getListCon(danhmucCha.getMaDanhMuc())) {
                                    %>
                                    <li>
                                        <a href="shop-grid.jsp?maDanhMuc=<%=danhmucCon.getMaDanhMuc()%>"><%=danhmucCon.getTenDanhMuc()%>
                                        </a></li>
                                    <%
                                        }
                                    %>
                                </ul>
                                <%
                                    }
                                %>
                            </div>
                        </li>
                        <%
                            DanhMucDaoIMP danhMucDaoIMP = new DanhMucDaoIMP();
                            ArrayList<NhaXuatBan> listNXB = danhMucDaoIMP.getListNXB();
                        %>
                        <li class="drop"><a href="#">Nhà xuất bản</a>
                            <div class="megamenu dropdown">
                                <ul class="item item01">
                                    <%
                                        for (int i = 0; i < listNXB.size(); i++) {
                                    %>
                                    <li>
                                        <a href="shop-grid.jsp?maNhaXuatBan=<%=listNXB.get(i).getMaNhaXuatBan()%>"><%=listNXB.get(i).getTenNhaXuatBan()%>
                                        </a>
                                    </li>
                                    <%
                                        }
                                    %>
                                    <%--                                    <li class="title">"Đọc sách cho tâm trí cũng cần như tập thể dục cho cơ thể. "--%>
                                    <%--                                    </li>--%>
                                    <%--                                    <li><a href="single-product.jsp">Yêu đi đừng sợ</a></li>--%>
                                    <%--                                    <li><a href="single-product.jsp">Đối nhân khéo - Xử thế hay</a></li>--%>
                                    <%--                                    <li><a href="single-product.jsp">Lãnh đạo bằng câu hỏi</a></li>--%>
                                    <%--                                    <li><a href="single-product.jsp">Sức mạnh tình bạn</a></li>--%>
                                    <%--                                    <li><a href="single-product.jsp">Mặt nạ sự sống</a></li>--%>
                                    <%--                                    <li><a href="single-product.jsp">Yêu thương cuộc sống</a></li>--%>
                                </ul>
                            </div>
                        </li>
                        <li class="drop"><a href="blog.jsp">Tin tức</a>
                        </li>
                        <li><a href="contact.jsp">Liên hệ</a></li>
                    </ul>

                </nav>
            </div>
            <div class="col-md-6 col-sm-6 col-6 col-lg-2 d-none d-lg-block">
                <ul class="header__sidebar__right d-flex justify-content-end  align-items-center">
                    <li class="shop_search wishlist"><a class="search__active" href="#"><i class="fa fa-search"></i>
                        Tìm kiếm</a></li>
                    <li class="wishlist"><a href="wishlist.jsp"><i class="fa fa-heart"></i> Yêu thích</a></li>
                    <li class="shopcart wishlist" style="border: none">

                        <a href="cart.jsp">
                            <div>
                                <i class="fa fa-shopping-cart"></i><span> Giỏ hàng<span
                                    class="product_qun"><%=cart.countItems()%></span></span>
                            </div>

                        </a>
                    </li>
                    <li class="setting__bar__icon wishlist"><a class="setting__active" href="#"><i
                            class="fa fa-user-circle"></i>Tài khoản</a>
                        <div class="searchbar__content setting__block">
                            <div class="content-inner">
                                <div class="switcher-currency">
                                    <strong class="label switcher-label">
                                        <span><%=userName%></span>
                                    </strong>
                                    <div class="switcher-options">
                                        <div class="switcher-currency-trigger">
                                            <div class="setting__menu">
                                                <div class="login" style="display:<%=modeHidden%>"><a href="login.jsp"><i
                                                        class="fa fa-sign-in"></i> Đăng
                                                    nhập</a></div>
                                                <div class="register" style="display:<%=modeHidden%>"><a href="register.jsp"><i
                                                        class="fa fa-registered"></i> Đăng kí</a></div>
                                                <div class="update" style="display:<%=modeMain%>"><a href="updateaccount.jsp"><i
                                                        class="fa fa-upload"></i> Cập nhật tài khoản</a></div>
                                                <div class="update" style="display:<%=modeMain%>"><a href="bill.jsp"><i
                                                        class="fa fa-history"></i> Lịch sử đơn hàng</a></div>
                                                <div class="logout" style="display:<%=modeMain%>"><a href="DangNhapServlet?command=logout"><i
                                                        class="fa fa-sign-out"></i> Đăng
                                                    xuất</a></div>
                                                <div class="register" style="display:<%=mode%>"><a href="trangchuAdmin"><i
                                                        class="fa fa-sign-out"></i> Vào trang quản lý</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Start Mobile Menu -->
        <div class="row d-none">
            <div class="col-lg-12 d-none">
                <nav class="mobilemenu__nav">

                    <ul class="meninmenu">
                        <li><a href="index.html">Trang chủ</a></li>
                        <li><a href="#">Thể loại</a>
                            <ul>
                                <%for (DanhMuc danhmucCha : danhMucDao.getList()) {%>
                                <li><a href="shop-grid.jsp?maDanhMuc=<%=danhmucCha.getMaDanhMuc()%>">
                                    <%=danhmucCha.getTenDanhMuc()%>
                                </a>
                                    <ul>
                                        <%
                                            for (DanhMuc danhmucCon : danhMucDao.getListCon(danhmucCha.getMaDanhMuc())) {
                                        %>
                                        <li>
                                            <a href="shop-grid.jsp?maDanhMuc=<%=danhmucCon.getMaDanhMuc()%>"><%=danhmucCon.getTenDanhMuc()%>
                                            </a></li>
                                        <%
                                            }
                                        %>
                                    </ul>
                                </li>
                                <%
                                    }
                                %>
                            </ul>
                        </li>
                        <li><a href="shop-grid.html">Khuyên đọc</a>
                            <ul>
                                <li><a href="single-product.html">Yêu đi đừng sợ</a></li>
                                <li><a href="single-product.html">Đối nhân khéo - Xử thế hay</a></li>
                                <li><a href="single-product.html">Lãnh đạo bằng câu hỏi</a></li>
                                <li><a href="single-product.html">Sức mạnh tình bạn</a></li>
                                <li><a href="single-product.html">Mặt nạ sự sống</a></li>
                                <li><a href="single-product.html">Yêu thương cuộc sống</a></li>
                            </ul>
                        </li>
                        <li><a href="blog.html">Tin tức</a></li>
                        <li><a href="contact.html">Liên hệ</a></li>
                    </ul>

                </nav>
            </div>
        </div>
        <!-- End Mobile Menu -->
        <div class="mobile-menu d-block d-lg-none">
        </div>
        <!-- Mobile Menu -->
    </div>
</header>
<!-- //Header -->
<script type="text/javascript">
    var name = document.formSearch.name.value;

    function Search() {
        var xhttp;
        var name = document.formSearch.name.value;

        // var request;
        if (name != "") {
            var url = "SearchServlet?name=" + name;
            if (window.XMLHttpRequest) {
                xhttp = new XMLHttpRequest();
            } else {
                xhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }


        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4) {
                var data = xhttp.responseText;
                document.getElementById("searchResult").innerHTML = data;
            }
        }
        xhttp.open("POST", url, true);

        xhttp.send();
        }else{
            document.getElementById("searchResult").innerHTML = "";
        }

    }
</script>
<!-- Start Search Popup -->
<div class="brown--color box-search-content search_active block-bg close__top">
    <%--    <form id="search_mini_form" class="minisearch" action="SearchSevrlet" method="post">--%>
    <form class="minisearch" name="formSearch">
        <div class="field__search">
            <input type="text" placeholder="Nhập từ khóa..." name="name" onkeyup="Search ()"/>
            <%--            <div class="action">--%>
            <%--                <input type="button" onclick="Search ()" value="Search"/>--%>
            <%--            </div>--%>
            <div id="searchResult" style="background: white"></div>
            <%--            <datalist id="sach">--%>
            <%--                <option value="Cổ tích của người điên">Cổ tích của người điên</option>--%>
            <%--                <option value="Nếu chỉ còn một ngày để sống">Nếu chỉ còn một ngày để sống</option>--%>
            <%--                <option value="Tôi thấy hoa vàng trên cỏ xanh">Tôi thấy hoa vàng trên cỏ xanh</option>--%>
            <%--                <option value="Khi lỗi thuộc về những vì sao">Khi lỗi thuộc về những vì sao</option>--%>
            <%--                <option value="Ông già và biển cả">Ông già và biển cả</option>--%>
            <%--            </datalist>--%>
            <%--            <% String a="";%>--%>
            <%--            <script>--%>
            <%--                function textthaydoi() {--%>
            <%--                    var value = $( this ).val();--%>
            <%--                    $( <%=a%> ).text( value );--%>
            <%--                }--%>

            <%--                // //Bắt sự kiện keyup của textbox--%>
            <%--                // $( "#inputtext" ).keyup(textthaydoi);--%>
            <%--                //--%>
            <%--                // //Cho #inputext phát sinh một sự kiện keyup ban đầu--%>
            <%--                // $( "#inputtext" ).keyup();--%>

            <%--            </script>--%>
            <%--                        <div class="action">--%>
            <%--                            <a href="#"><i class="zmdi zmdi-search"></i></a>--%>
            <%--                        </div>--%>
        </div>
    </form>
    <div class="close__wrap">
        <span>Đóng</span>
    </div>
</div>
<!-- End Search Popup -->
</body>
</html>
