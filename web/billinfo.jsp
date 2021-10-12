<%@ page import="dao.HoaDonDAOIMP" %>
<%@ page import="Model.User" %>
<%@ page import="dao.TaiKhoanDaoIMP" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="Model.HoaDon" %>
<%@ page import="Model.ChiTietHoaDon" %>
<%@ page import="dao.ChiTietHoaDonDAOIMP" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <script type="text/javascript" src="https://mail-attachment.googleusercontent.com/injected/se.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Chi tiết đơn hàng</title>
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
                        <h2 class="bradcaump-title">Chi tiết đơn hàng</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item">Đơn hàng</span>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Chi tiết đơn hàng</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <%
        HoaDonDAOIMP hoaDonDAOIMP = new HoaDonDAOIMP();
        String userName = (String) session.getAttribute("userName");
        User user = new TaiKhoanDaoIMP().getTaiKhoanByUserName(userName);
        String maTK = user.getMaTK();
        NumberFormat nf = NumberFormat.getInstance();
        nf.setMinimumFractionDigits(0);
        String maHoaDon = request.getParameter("maHoaDon");
        HoaDon hoaDon = hoaDonDAOIMP.getHoaDonSingle(maHoaDon);
        int status = hoaDon.getStatus();
        String sta = "";
        int w = 0;
        int w2 = 0;
        if (status == 0) {
            sta = "Đơn hàng mới";
            w = 0;
            w2 = 0;
        } else if (status == 1) {
            sta = "Giao hàng";
            w = 100;
            w2 = 0;
        } else {
            sta = "Hoàn tất";
            w = 100;
            w2 = 100;
        }

        String staURL= request.getParameter("status");
        if(staURL!= null){
            sta = "Giao hàng";
            w = 100;
            w2 = 0;
            hoaDon.setStatus(1);
        }

        ChiTietHoaDonDAOIMP chiTietHoaDonDAOIMP = new ChiTietHoaDonDAOIMP();
        hoaDonDAOIMP.setStatus(maHoaDon, 1);

    %>
    <!-- cart-main-area start -->
    <section class="wn__checkout__area mt--30 bg__white">
        <div class="container">
            <div class="row">
                <div class="col-main col-lg-12 col-md-12 col-sm-12 col-xs-12 col-fhs-main-body">

                    <div class="my-account"><!-- ESI START DUMMY COMMENT [] -->
                        <!-- ESI URL DUMMY COMMENT -->


                        <!-- ESI END DUMMY COMMENT [] -->
                        <div class="page-title title-buttons mb-3" style="margin: 0px;">
                            <h1>
                                Order #<%=hoaDon.getMaHoaDon()%> - <%=sta%>
                            </h1>

                            <div class="contact-btn">
                            </div>
                        </div>
                        <div>
                            <div id="demo" class="collapse">
                                <table>
                                    <tbody>
                                    <tr>
                                        <th></th>
                                        <th>Đơn hàng #</th>
                                        <th>Ghi chú</th>
                                        <th>Thời gian</th>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <dl class="order-info-2">
                            <dd>
                                <ul id="order-info-tabs">
                                    <li class="current first last">Thông tin đơn hàng</li>
                                </ul>
                            </dd>
                        </dl>


                        <div class="col2-set order-shipping-info-box">
                            <div class="progress-info-division">
                                <div class="next-step next-step-dot next-step-horizontal order-status-progress-bar">
                                    <div class="next-step-item next-step-item-finish" style="width: auto;">
                                        <div class="next-step-item-tail">
                                            <div class="next-step-item-tail-underlay">
                                                <div class="next-step-item-tail-overlay" style="width: <%=w%>%;"></div>
                                            </div>
                                        </div>
                                        <div class="next-step-item-container">
                                            <div class="next-step-item-node"><span
                                                    class="next-step-item-node-dot"></span></div>
                                            <div class="next-step-item-title">Đơn hàng mới</div>
                                        </div>
                                    </div>
                                    <div class="next-step-item next-step-item-finish" style="width: auto;">
                                        <div class="next-step-item-tail">
                                            <div class="next-step-item-tail-underlay">
                                                <div class="next-step-item-tail-overlay" style="width: <%=w2%>%;"></div>
                                            </div>
                                        </div>
                                        <div class="next-step-item-container">
                                            <div class="next-step-item-node"><span
                                                    class="next-step-item-node-dot"></span></div>
                                            <div class="next-step-item-title">Giao hàng</div>
                                        </div>
                                    </div>
                                    <div class="next-step-item next-step-item-finish" style="width: auto;">
                                        <div class="next-step-item-tail">
                                            <div class="next-step-item-tail-underlay">
                                                <div class="next-step-item-tail-overlay" style="width: 0%;"></div>
                                            </div>
                                        </div>
                                        <div class="next-step-item-container">
                                            <div class="next-step-item-node"><span
                                                    class="next-step-item-node-dot"></span></div>
                                            <div class="next-step-item-title">Hoàn tất</div>
                                        </div>
                                    </div>
                                </div>
                                <%--                                <div class="tracking-list">--%>
                                <%--                                    <div class="translate" style="left: 86.9%;"></div>--%>
                                <%--                                    <div class="tracking-list-info-table">--%>
                                <%--                                        <div class="tracking-item">--%>
                                <%--                                            <div class="text desc info tracking-item-time light-gray"><%=hoaDon.getNgayMuaHang()%>--%>
                                <%--                                            </div>--%>
                                <%--                                            <div class="tracking-item-content"><span class="text desc">Đơn hàng đã hoàn tất.</span>--%>
                                <%--                                            </div>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="view-more">--%>
                                <%--                                        <a class="text link"><span--%>
                                <%--                                                class="tracking-view-btn" style="color: #1a9cb7">XEM THÊM</span></a>--%>
                                <%--                                        <a class="text link" href="#order-details"><span--%>
                                <%--                                                style="padding-left: 20px;">CHI TIẾT</span></a>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                            </div>
                        </div>

                        <div class="order-info-box-2 justify-content-center">
                            <div class="order-info-2-1 mr-2">
                                <div class="order-info-billing-address">
                                    <div class="box-title">
                                        <h2 class="sales mb-2">Địa chỉ giao hàng</h2>
                                    </div>
                                    <div class="box-content">
                                        <address><%=hoaDon.getDiaChi()%>
                                        </address>
                                    </div>
                                </div>
                            </div>
                            <div class="order-info-2-2 mr-2">
                                <div class="order-info-shipping-description">
                                    <div class="box-title">
                                        <h2 class="sales mb-2">Phương thức vận chuyển</h2>
                                    </div>
                                    <div class="box-content">
                                        <%=hoaDon.getPhuongThucGiaoHang()%>
                                    </div>
                                </div>
                                <div>
                                    <div class="box-title">
                                        <h2 class="sales mt-2">Phương thức thanh toán</h2>
                                    </div>
                                    <div class="box-content">
                                        <p><strong><%=hoaDon.getPhuongThucThanhToan()%>
                                        </strong></p>


                                    </div>
                                </div>
                            </div>
                            <%--                            <div class="order-info-2-3">--%>
                            <%--                                <div class="order-info-total">--%>
                            <%--                                    <div class="box-title">--%>
                            <%--                                        <h2 id="order-final-total" class="sales">Tổng cộng:&nbsp;<span class="price"><%=nf.format(hoaDon.getTongtien())%></span>--%>
                            <%--                                            đ</h2>--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="order-info-VAT">--%>
                            <%--                                    <div class="box-title">--%>
                            <%--                                        <h2 class="sales">Thông tin Xuất Hóa Đơn</h2>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="box-content">--%>
                            <%--                                        <i>(Không có)</i>--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="order-info-description">--%>
                            <%--                                    <div class="box-title">--%>
                            <%--                                        <h2 class="sales">Ghi chú</h2>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="box-content">--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>
                        </div>
                        <script>
                            $jq(document).ready(function () {
                                var order_tracking = [{
                                    "date": "22\/09\/2019 - 04:00",
                                    "status": "\u0110\u01a1n h\u00e0ng \u0111\u00e3 ho\u00e0n t\u1ea5t."
                                }, {
                                    "date": "20\/09\/2019 - 21:00",
                                    "status": "\u0110\u01a1n h\u00e0ng \u0111\u00e3 x\u00e1c nh\u1eadn v\u00e0 \u0111ang x\u1eed l\u00fd."
                                }, {
                                    "date": "20\/09\/2019 - 20:56",
                                    "status": "\u0110\u00e3 t\u1ea1o \u0111\u01a1n h\u00e0ng m\u1edbi."
                                }];
                                tracking_info = "<div class='tracking-item'><div class='text desc info tracking-item-time light-gray'>" + order_tracking[0].date + "</div><div class='tracking-item-content'><span class='text desc'>" + order_tracking[0].status + "</span></div></div>";
                                $jq(".tracking-list-info-table").html(tracking_info);

                                jQuery('.tracking-view-btn').click(function () {
                                    var tracking_info = "";
                                    var tracking_btn_text = $jq(".tracking-view-btn").html();
                                    if (tracking_btn_text == "XEM THÊM") {
                                        order_tracking.forEach(function (value) {
                                            var temp = "<div class='tracking-item'><div class='text desc info tracking-item-time light-gray'>" + value.date + "</div><div class='tracking-item-content'><span class='text desc'>" + value.status + "</span></div></div>";
                                            tracking_info += temp;
                                        });
                                        $jq(".tracking-list-info-table").html(tracking_info);
                                        $jq(".tracking-view-btn").html("RÚT GỌN");
                                    } else {
                                        var value = order_tracking[0];
                                        tracking_info = "<div class='tracking-item'><div class='text desc info tracking-item-time light-gray'>" + value.date + "</div><div class='tracking-item-content'><span class='text desc'>" + value.status + "</span></div></div>";
                                        $jq(".tracking-list-info-table").html(tracking_info);
                                        $jq(".tracking-view-btn").html("XEM THÊM");
                                    }
                                });
                                $jq('a[hrefs^="#"]').on('click', function (event) {
                                    var target = $jq(this.getAttribute('hrefs'));
                                    var sub_order_data_target = $jq(this.getAttribute('data-target'));
                                    if (sub_order_data_target.length) {
                                        if (!$jq(this).hasClass("collapsed")) {
                                            return;
                                        }
                                    }
                                    if (target.length) {
                                        event.preventDefault();
                                        $jq('html, body').stop().animate({
                                            scrollTop: target.offset().top
                                        }, 1000);
                                    }
                                });
                            });
                        </script>
                        <div id="order-details" class="order-items order-details">
                            <h2 class="table-caption" style="border-bottom: 1px solid #d0cbc1;margin-bottom: 15px;">Tổng
                                đơn hàng </h2>

                            <div class="panel">
                                <div id="sub_order_sroll_20105312" class="panel panel-success">
                                    <a role="button" data-toggle="collapse" href="#." hrefs="#sub_order_sroll_20105312"
                                       data-target="#sub_order_20105312" aria-expanded="true" class="panel-collapse">
                                        <div class="panel-heading">
                                            <div style="float: left;width: 50%;">
                                                #<%=hoaDon.getMaHoaDon()%>
                                            </div>
                                            <%--                                            <div style="float: left;width: 26%;">--%>
                                            <%--                                                <span class="price"></span>--%>
                                            <%--                                            </div>--%>
                                            <%
                                                int i = 0;
                                                for (ChiTietHoaDon chiTietHoaDon : chiTietHoaDonDAOIMP.getCTHD(maHoaDon)) {
                                                    i++;
                                                }

                                            %>
                                            <div style="float: left;width: 50%;">
                                                <%=i%> sản phẩm
                                            </div>
                                            <%--                                            <div style="float: left; width: 12%;">--%>
                                            <%--                                                Hoàn tất--%>
                                            <%--                                            </div>--%>
                                            <div class="panel-icon"></div>
                                            <div style="clear: both;"></div>
                                        </div>
                                    </a>
                                    <div id="sub_order_20105312" class="collapse in" style="height: auto;">
                                        <%--                                        <table class="suborder-table-2 nonborder-table">--%>
                                        <%--                                            <thead>--%>
                                        <%--                                            <tr>--%>
                                        <%--                                                <th>Đang xử lý</th>--%>
                                        <%--                                                <th>Sẵn sàng giao hàng</th>--%>
                                        <%--                                                <th>Đang giao hàng</th>--%>
                                        <%--                                                <th>Hoàn tất</th>--%>
                                        <%--                                            </tr>--%>
                                        <%--                                            </thead>--%>
                                        <%--                                            <tbody>--%>
                                        <%--                                            <tr>--%>
                                        <%--                                                <td>20/09/2019 - 21:10</td>--%>
                                        <%--                                                <td>21/09/2019 - 08:30</td>--%>
                                        <%--                                                <td>21/09/2019 - 12:06</td>--%>
                                        <%--                                                <td>21/09/2019 - 17:13</td>--%>
                                        <%--                                            </tr>--%>
                                        <%--                                            </tbody>--%>
                                        <%--                                        </table>--%>
                                        <div style="overflow-x: auto;">
                                            <table cellspacing="0" cellpadding="0" border="0" width="100%"
                                                   class="suborder-table nonborder-table"
                                                   style="margin-top: 0px;border-top-width: 0px;">
                                                <thead>
                                                <tr>
                                                    <th style="padding-left: 15px; min-width: 25vh; width: 40%; text-align:left;">
                                                        Tên sản phẩm
                                                    </th>
                                                    <th style="text-align:left; min-width: 15vh; width: 15%;">SKU</th>
                                                    <th style="text-align:left;">Giá gốc</th>
                                                    <th style="text-align:center;">Giảm giá</th>
                                                    <th style="width: 8%; text-align:right;">Số lượng</th>
                                                    <th style="width: 15%; text-align:right;">Thành tiền</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <%
                                                    double tt = 0;
                                                    double ck = 0;
                                                    double tong = 0;
                                                    double goc=0;
                                                    for (ChiTietHoaDon chiTietHoaDon : chiTietHoaDonDAOIMP.getCTHD(maHoaDon)) {
                                                        tt += chiTietHoaDon.getGiamGia();
                                                        ck += (chiTietHoaDon.getDonGia() - chiTietHoaDon.getGiamGia());
                                                        tong += (chiTietHoaDon.getGiamGia() * chiTietHoaDon.getSoLuong());
                                                        goc += chiTietHoaDon.getDonGia();

                                                %>
                                                <tr>
                                                    <td style="padding-left: 15px; text-align: left;">
                                                        <h3 style="width: inherit;" class="product-name">
                                                            <a href="https://www.fahasa.com/toi-thay-hoa-vang-tren-co-xanh-ban-in-moi-2018.html"
                                                               style="height: auto;">
                                                                <%=chiTietHoaDon.getSanPham().getTenSach()%>
                                                            </a>
                                                        </h3>
                                                    </td>
                                                    <td style="text-align: left;"><%=chiTietHoaDon.getSanPham().getMaSach()%>
                                                    </td>
                                                    <td style="text-align: left;"><span
                                                            class="price"><%=nf.format(chiTietHoaDon.getDonGia())%>VND</span>
                                                    </td>
                                                    <td style="text-align: center;"><span
                                                            class="price"><%=nf.format(chiTietHoaDon.getDonGia()-chiTietHoaDon.getGiamGia())%>VND</span>
                                                    </td>
                                                    <td style="text-align: center;"><%=chiTietHoaDon.getSoLuong()%>
                                                    </td>
                                                    <td style="text-align: right;"><span
                                                            class="price"><%=nf.format(chiTietHoaDon.getGiamGia() * chiTietHoaDon.getSoLuong())%>VND</span>
                                                    </td>
                                                </tr>
                                                <%
                                                    }
                                                %>
                                                </tbody>
                                            </table>
                                        </div>
                                        <table class="suborder-table-2 nonborder-table">
                                            <thead>
                                            <tr>
                                                <th>Tổng giá gốc</th>
                                                <th>Phí vận chuyển</th>
                                                <th>Tổng giảm giá</th>
                                                <th>Tổng thanh toán (gồm VAT)</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><span class="price"><%=nf.format(goc)%></span>VND</td>
                                                <td><span class="price">0</span></td>
                                                <td><span class="price"><%=nf.format(ck)%></span>VND</td>
                                                <td><span class="price"><%=nf.format(tong)%></span>VND</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                            <script>
                                $jq(document).ready(function () {
                                    $jq("#order-final-total").html("Tổng cộng:&nbsp;<span class=\"price\">160.500</span> đ");
                                });
                            </script>
                            <script>
                                $jq('#btn_cancel_order').html('');
                            </script>

                            <div class="buttons-set mb-3">
                                <p class="back-link"><a
                                        href="bill.jsp">
                                    <button class="btn btn-outline-danger">« Quay về</button>
                                </a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
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