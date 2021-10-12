<%@ page import="dao.SanPhamDaoIMP" %>
<%@ page import="Model.SanPham" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.nio.Buffer" %>
<%@ page import="java.io.*" %>
<%@ page import="sun.nio.cs.StandardCharsets" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="Model.GioHang" %>
<%@ page import="dao.ReviewDaoIMP" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Review" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 22/11/2019
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <script type="text/javascript" src="https://mail-attachment.googleusercontent.com/injected/se.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shop-Single | Bookshop Responsive Bootstrap4 Template</title>
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
    <%--    <%--%>
    <%--        String abc="block";--%>
    <%--    %>--%>
    <script type="text/javascript">
        function Review() {
            var xhttp;
            var subject = document.formReview.subject.value;
            var review = document.formReview.review.value;
            var u = new URL(document.URL);
            var maSach = u.searchParams.get("maSach");
            <%--            <%=abc%>="none";--%>
            // var request;
            var url = "ReviewServlet?subject=" + subject + "&review=" + review + "&maSach=" + maSach;
            if (window.XMLHttpRequest) {
                xhttp = new XMLHttpRequest();
            } else {
                xhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }

            xhttp.onreadystatechange = function () {
                if (xhttp.readyState == 4) {
                    var data = xhttp.responseText;
                    document.getElementById("review").innerHTML = data;
                }
            }
            xhttp.open("POST", url, true);
            xhttp.send();
            // document.getElementById("abc").style.display = 'none';
        }

        //Add cart
        function AddCart() {
            var xhttp;
            // var subject = document.formAddCart.subject.value;
            // var review = document.formReview.review.value;
            var u = new URL(document.URL);
            var maSach = u.searchParams.get("maSach");
            <%--            <%=abc%>="none";--%>
            // var request;
            var url = "GioHangServlet?command=plus2&maSach=" + maSach;
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

<div id="fb-root"></div>
<script async defer crossorigin="anonymous"
        src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v5.0&appId=1207869516085168&autoLogAppEvents=1"></script>

<!-- Main wrapper -->
<div class="wrapper" id="wrapper">

    <!-- Header -->
    <div id="headermain" style="display: block">
        <jsp:include page="header.jsp"></jsp:include>
    </div>
    <div id="cart">
<%--        <jsp:include page="header.jsp"></jsp:include>--%>
    </div>
    <!-- Start Bradcaump area -->
    <div class="ht__bradcaump__area bg-image--6" style="margin-top: 6.3%">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">Chi tiết sản phẩm</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item">Danh sách sản phẩm</span>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Chi tiết sản phẩm</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- Start main Content -->
    <div class="maincontent bg--white pt--80 pb--55">
        <%
            //            String abc="block";
            SanPhamDaoIMP sanPhamDao = new SanPhamDaoIMP();
            NumberFormat nf = NumberFormat.getInstance();
            nf.setMinimumIntegerDigits(0);
            String maSach = request.getParameter("maSach");
            SanPham sp = sanPhamDao.getSingleProduct(request.getParameter("maSach"));

            //gio hang
            GioHang cart = (GioHang) session.getAttribute("cart");
            if (cart == null) {
                cart = new GioHang();
                session.setAttribute("cart", cart);
            }

            //mota
//            String file1 = sp.getMoTa();
//            InputStream ins1 = application.getResourceAsStream(file1);
//            BufferedReader input1 = new BufferedReader(new InputStreamReader(ins1, "UTF-8"));
            //motachitiet
            String file = sp.getChiTietMoTa();
            InputStream ins = application.getResourceAsStream(file);
            BufferedReader input = new BufferedReader(new InputStreamReader(ins, "UTF-8"));
            String[] arrStr = new String[21];
            for (int i = 0; i < 21; i++) {
                arrStr[i] = input.readLine();
            }
            input.close();
        %>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-12">
                    <div class="wn__single__product">
                        <div class="row">
                            <div class="col-lg-5 col-12">
                                <div class="wn__fotorama__wrapper">
                                    <div class="fotorama wn__fotorama__action" data-nav="thumbs">
                                        <a href="1.jpg"><img src="<%=sp.getHinhAnh1()%>" alt=""></a>
                                        <a href="2.jpg"><img src="<%=sp.getHinhAnh2()%>" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="product__info__main">
                                    <h1><%=sp.getTenSach()%>
                                    </h1>
                                    <div class="product__hover--content">
                                        <ul class="rating d-flex">
                                            <li class="on"><i class="fa fa-star"></i></li>
                                            <li class="on"><i class="fa fa-star"></i></li>
                                            <li class="on"><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                        </ul>
                                    </div>
                                    <div class="price-box">
                                        <span><b><%=nf.format(sp.getGiaKhuyenMai())%>đ</b></span>
                                        <span style="color: #1b1e21"><strike><%=nf.format(sp.getGiaGoc())%>đ</strike></span>
                                        <div class="product__overview">
                                            <%
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
                                            %>
                                            <a href="#detail-this" style="color: crimson">...Xem thêm</a></br></br>
                                            <p>• Tên nhà xuất bản: <%=arrStr[4]%>
                                            </p>
                                            <p>• Tác giả: <%=arrStr[6]%>
                                            </p>
                                            <p><a href="contact.html">• Chính sách giao hàng</a></p>
                                        </div>
                                        <div class="product-addto-links clearfix">
                                            <a class="wishlist" href="wishlist.html"><i
                                                    class="fa fa-heart"></i></a>
                                            <a class="compare" href="#nhanxet"><i
                                                    class="fa fa-pencil"></i></a>
                                        </div>
                                    </div>
                                    <div class="box-tocart d-flex">
                                        <span>SL:</span>
                                        <form name="formAddCart">
                                            <input id="qty" class="input-text qty" name="qty" min="1" value="1"
                                                   title="Qty"
                                                   type="number">
                                            <div class="addtocart__actions" id="detail-this">
                                                <a id="addToCart">
                                                    <button class="tocart" type="button" onclick="AddCart ()"><i
                                                            class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
                                                    </button>
                                                </a>
                                            </div>
                                        </form>
                                    </div>
                                    <%--                                    <script type="text/javascript">--%>
                                    <%--                                        $(document).ready(function () {--%>
                                    <%--                                            $('#addToCart').click(function (e) {--%>
                                    <%--                                                e.preventDefault();--%>
                                    <%--                                            });--%>
                                    <%--                                        });--%>
                                    <%--                                    </script>--%>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="product__info__detailed">
                        <div class="review__attribute">
                            <h2 class="col-2">Nội dung sách</h2>
                        </div>
                        <div class="tab__container">
                            <!-- Start Single Tab Content -->
                            <div id="nav-details1">
                                <div class="description__attribute">
                                    <p>
                                        <%
                                            String file3 = sp.getMoTa();
                                            InputStream ins3 = application.getResourceAsStream(file3);
                                            BufferedReader input3 = new BufferedReader(new InputStreamReader(ins3, "UTF-8"));
                                            String line3 = "";
                                            while ((line3 = input3.readLine()) != null) {
                                                out.println(line3 + "</br>");
                                            }
                                            input3.close();
                                        %>
                                    </p>
                                </div>
                            </div>
                            <!-- End Single Tab Content -->
                        </div>
                    </div>
                    <div class="product__info__detailed">
                        <div class="review__attribute">
                            <h2 class="col-2">Thông tin sách</h2>
                        </div>
                        <div class="tab__container">
                            <!-- Start Single Tab Content -->
                            <div id="nav-details">
                                <div class="white-panel">
                                    <div class="attribute-table single-table"></div>
                                    <table id="chi-tiet" cellspacing="0"
                                           class="table table-bordered table-detail table-striped">
                                        <colgroup>
                                            <col style="width: 25%;">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <%
                                            int a = 1;
                                            int b = 2;
                                            for (int i = 0; i < 10; i++) {
                                        %>
                                        <tr>
                                            <td rel="publisher_vn"><%=arrStr[a]%>
                                            </td>
                                            <td class="last">
                                                <%=arrStr[b]%>
                                            </td>
                                        </tr>
                                        <%
                                                a = a + 2;
                                                b = b + 2;
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- End Single Tab Content -->
                        </div>
                    </div>
                    <div class="product__info__detailed">
                        <div class="tab__container">
                            <!-- Start Single Tab Content -->
                            <div id="nhanxet">
                                <div class="review__attribute">
                                    <h2 class="col-2">Nhận xét</h2>
                                </div>
                                <form name="formReview">
                                    <div class="review-fieldset">
                                        <h5>Đánh giá</h5>
                                        <div class="review-field-ratings">
                                            <div class="product-review-table">
                                                <div class="review-field-rating d-flex">
                                                    <!--													<span>Value</span>-->
                                                    <ul class="rating d-flex">
                                                        <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                        <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                        <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                        <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                        <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review_form_field">
                                            <div class="input__box">
                                                <span>Tiêu đề</span>
                                                <input type="text" name="subject"/>
                                            </div>
                                            <div class="input__box">
                                                <span>Nhận xét</span>
                                                <textarea name="review"></textarea>
                                            </div>
                                            <div class="review-form-actions">
                                                <button type="button" onclick="Review ()">Gửi</button>
                                                <%--                                                <input type="button" value="Gửi" onclick="Review ()"/>--%>

                                            </div>
                                        </div>
                                    </div>
                                    <%--                                Display review--%>
                                    <%--                                    <%--%>
                                    <%--                                        ReviewDaoIMP reviewDaoIMP = new ReviewDaoIMP();--%>
                                    <%--                                        ArrayList<Review> arrayListReview = reviewDaoIMP.getReview(request.getParameter("maSach"));--%>
                                    <%--                                        for (Review re : arrayListReview--%>
                                    <%--                                        ) {--%>
                                    <%--                                    %>--%>
                                    <%--                                    <div id="abc" style="display: block">--%>
                                    <%--                                        <p><%=re.getSubject()%>--%>
                                    <%--                                        </p>--%>
                                    <%--                                        <p><%=re.getReview()%>--%>
                                    <%--                                        </p>--%>
                                    <%--                                    </div>--%>
                                    <%--                                    <%--%>
                                    <%--                                        }--%>
                                    <%--                                    %>--%>
                                </form>
                                <div class="box-collateral box-reviews mt-3" id="customer-reviews">
                                    <div class="ma-review-col1 span5">
                                        <h2 class="own-review col-4 text--normal">Khách hàng nhận xét</h2>
                                        <dl class="f-review">
                                            <div id="review">

                                            </div>
                                        </dl>
                                        <style>
                                            .toolbar .pager .pages li.current {
                                                width: 40px;
                                            }
                                        </style>


                                    </div>
                                    <div class="ma-review-col2 span6">
                                        <!-- ESI START DUMMY COMMENT [] -->
                                        <!-- ESI URL DUMMY COMMENT -->

                                        <div class="form-add">
                                            <div class="review-rule col-md-12 col-sm-12 col-sms-12">
                                                <div class="fhs-review-rule"><span class="review-rule-header">Tiêu chí xét duyệt nhận xét:</span>
                                                    <ul class="review-item">
                                                        <li>Được viết bằng tiếng Việt, viết hoa đầu dòng, có dấu, không
                                                            được viết tắt, ký tự không rõ nghĩa và không được trùng lặp.
                                                        </li>
                                                        <li>Nội dung phải do chính người gửi nhận xét viết và chưa từng
                                                            được đăng trên các website, diễn đàn khác.
                                                        </li>
                                                        <li>Nhận xét phải dựa trên trải nghiệm, cảm nhận thực tế của
                                                            khách hàng về sản phẩm, nêu rõ điểm tốt hoặc chưa tốt của
                                                            sản phẩm.
                                                        </li>
                                                        <li>Nhận xét mang tính quảng cáo, kêu gọi mua sản phẩm không
                                                            liên quan sẽ không được chấp nhận.
                                                        </li>
                                                        <li>Không nhận xét ác ý, tiêu cực nhằm bôi xấu sản phẩm.</li>
                                                        <li>Bài viết sẽ được Fahasa.com phê duyệt trước khi được đăng
                                                            công khai trên website.
                                                        </li>
                                                        <li>Mọi thắc mắc liên quan đến sản phẩm hoặc dịch vụ của Fahasa
                                                            bạn vui lòng gửi mail về hoặc gọi vào Hotline 1900 63 64 67
                                                            để được hỗ trợ nhanh nhất.
                                                        </li>
                                                    </ul>
                                                    <span class="review-rule-header">Tiêu chí Review Hay - Nhận F-Point:</span>
                                                    <ul class="review-item">
                                                        <li><strong>Nhận xét từ 500 ký tự trở lên (tính từ 250 từ trở
                                                            lên)&nbsp; và đạt tiêu chí xét duyệt như nhận xét sẽ được
                                                            tính là REVIEW.</strong></li>
                                                        <li>Bài review hợp lệ đã được xét duyệt và hiển thị trên website
                                                            sẽ được nhận thêm&nbsp;<strong>5.000 F-Point</strong>&nbsp;vào
                                                            tài khoản mua hàng tại Fahasa.com.&nbsp;
                                                        </li>
                                                        <li><span>Bài review được nhiều lượt thích sẽ nhận được thêm F-Point theo cơ chế:&nbsp;</span><strong>Từ
                                                            10 lượt thích trở lên sẽ nhận thêm được tối đa 2.000 F-Point
                                                            trên mỗi bài review</strong><span>.</span></li>
                                                    </ul>
                                                </div>
                                                <p><a title="" href="review-hay-nhan-ngay-fpoint"> <img
                                                        style="padding-top: 10px; padding-right: 15px;"
                                                        src="https://www.fahasa.com/media/wysiwyg/Thang-10-2018/REVIEW-1263x80-446ae7.jpg"
                                                        alt=""> </a></p></div>

                                            <script type="text/javascript">
                                                //<![CDATA[
                                                var dataForm = new VarienForm('review-form');
                                                Validation.addAllThese(
                                                    [
                                                        ['validate-rating', 'Vui lòng cho một mức đánh giá trên', function (v) {
                                                            var trs = $('product-review-table').select('tr');
                                                            var inputs;
                                                            var error = 1;

                                                            for (var j = 0; j < trs.length; j++) {
                                                                var tr = trs[j];
                                                                if (j > 0) {
                                                                    inputs = tr.select('input');

                                                                    for (i in inputs) {
                                                                        if (inputs[i].checked == true) {
                                                                            error = 0;
                                                                        }
                                                                    }

                                                                    if (error == 1) {
                                                                        return false;
                                                                    } else {
                                                                        error = 1;
                                                                    }
                                                                }
                                                            }
                                                            return true;
                                                        }]
                                                    ]
                                                );
                                                //]]>
                                            </script>
                                        </div>
                                        <script type="text/javascript">
                                            //<![CDATA[
                                            var curCount = 0;
                                            $jq("#count-message").html(curCount + " ký tự");
                                            $jq("#review_field").keyup(function () {
                                                var count = $jq("#review_field").val().replace(/ /g, "").replace(/\r\t/g, "").replace(/\n/g, "").length;
                                                $jq("#count-message").html(count + " ký tự");
                                            });
                                            //]]>
                                        </script>

                                        <script type="text/javascript">
                                            //<![CDATA[
                                            var curCount = 0;
                                            $jq("#count-title").html(curCount + " ký tự");
                                            $jq("#summary_field").keyup(function () {
                                                var count = $jq("#summary_field").val().length;
                                                $jq("#count-title").html(count + " ký tự");
                                            });
                                            //]]>
                                        </script>

                                        <!-- ESI END DUMMY COMMENT [] -->
                                    </div>
                                </div>
                                <%--                                <div id="review">--%>
                                <%--                                </div>--%>
                            </div>
<%--                            <ul class="wn__pagination" style="margin-top: 3%">--%>
<%--                                <li><a href="#"><i class="zmdi zmdi-chevron-left"></i></a></li>--%>
<%--                                <li class="active"><a href="#">1</a></li>--%>
<%--                                <li><a href="#">2</a></li>--%>
<%--                                <li><a href="#">3</a></li>--%>
<%--                                <li><a href="#">4</a></li>--%>
<%--                                <li><a href="#"><i class="zmdi zmdi-chevron-right"></i></a></li>--%>
<%--                            </ul>--%>
                            <!-- End Single Tab Content -->
                        </div>
                    </div>
                    <div class="fb-comments"
                         data-href="single-product.jsp?maSach=<%=sp.getMaSach()%>"
                         data-width="1000px" data-numposts="5">
                    </div>


                </div>

            </div>
            <%--            <ul class="wn__pagination" style="margin-top: 3%">--%>
            <%--                <li><a href="#"><i class="zmdi zmdi-chevron-left"></i></a></li>--%>
            <%--                <li class="active"><a href="#">1</a></li>--%>
            <%--                <li><a href="#">2</a></li>--%>
            <%--                <li><a href="#">3</a></li>--%>
            <%--                <li><a href="#">4</a></li>--%>
            <%--                <li><a href="#"><i class="zmdi zmdi-chevron-right"></i></a></li>--%>
            <%--            </ul>--%>
        </div>
    </div>
    <section class="wn__product__area brown--color pt--80">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section__title text-center">
                        <h2 class="title__be--2"><span class="color--theme">Có thể bạn quan tâm</span></h2>
                        <p class="cautho">"Một cuốn sách hay thực sự hay dạy tôi nhiều điều hơn là đọc nó, Tôi phải
                            nhanh chóng đặt nó xuống, bắt đầu sống theo những điều nó chỉ dẫn. Điều tôi bắt đầu bằng
                            cách đọc, tôi phải kết thúc bằng hành động", <b>Henry David Thoreau</b></p>
                    </div>
                </div>
            </div>
            <!-- Start Single Tab Content -->
            <div class="furniture--4 furniture--4v2 border--round arrows_style owl-carousel owl-theme row mt--50">
                <%
                    for (SanPham spFocus : sanPhamDao.getListProductByCategory(sp.getDanhMuc().getMaDanhMuc())) {
                %>
                <!-- Start Single Product -->
                <div class="product product__style--3">
                    <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                        <div class="product__thumb">
                            <a class="first__img" href="single-product.jsp?maSach=<%=spFocus.getMaSach()%>"><img
                                    src="<%=spFocus.getHinhAnh1()%>"
                                    alt="product image"></a>
                            <div class="hot__box">
                                <span class="hot-label"><%=Math.round(((1 - (spFocus.getGiaKhuyenMai() / spFocus.getGiaGoc())) * 100) * 1 / 1)%>%</span>
                            </div>
                        </div>
                    </div>
                    <div class="product__content content--center">
                        <h4><a href="single-product.jsp?maSach=<%=spFocus.getMaSach()%>"><%=spFocus.getTenSach()%>
                        </a></h4>
                        <ul class="prize d-flex">
                            <li><%=nf.format(spFocus.getGiaKhuyenMai())%>đ</li>
                        </ul>
                        <ul class="prize d-flex">
                            <li class="old_prize"><%=nf.format(spFocus.getGiaGoc())%>đ</li>
                        </ul>

                        <div class="action">
                            <div class="actions_inner">
                                <ul class="add_to_links">
                                    <li><a class="cart" href="cart.html"><i class="bi bi-shopping-bag4"></i></a>
                                    </li>
                                    <li><a class="compare" href="wishlist.html"><i class="bi bi-heart-beat"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="product__hover--content">
                            <ul class="rating d-flex">
                                <li class="on"><i class="fa fa-star"></i></li>
                                <li class="on"><i class="fa fa-star"></i></li>
                                <li class="on"><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Start Single Product -->
                <%
                    }
                %>
            </div>
            <!-- Start Single Product -->
        </div>
        <!-- End Single Tab Content -->
        <%--        </div>--%>
    </section>

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
