<%@ page import="dao.HoaDonDAOIMP" %>
<%@ page import="Model.HoaDon" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="dao.TaiKhoanDaoIMP" %>
<%@ page import="Model.User" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <script type="text/javascript" src="https://mail-attachment.googleusercontent.com/injected/se.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Đơn hàng của tôi</title>
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
                        <h2 class="bradcaump-title">Đơn hàng của tôi</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Đơn hàng của tôi</span>
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
        int s = 0;
        for (HoaDon hoaDon : hoaDonDAOIMP.getHoaDon(maTK)) {
            s++;
        }
    %>
    <!-- cart-main-area start -->
    <section class="wn__checkout__area pt--30 bg__white">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="page-title">
                        <h1>Đơn hàng của tôi</h1>
                    </div>
                    <div class="order-pager">

                        <p class="amount">
                            <strong><%=s%> đơn hàng</strong>
                        </p>


                        <%--                        <div class="limiter" style="margin-left: 10px; padding-right: 10px">--%>
                        <%--                            <label>Hiển thị</label>--%>
                        <%--                            <select onchange="setLocation(this.value)">--%>
                        <%--                                <option value="https://www.fahasa.com/sales/order/history/?limit=10">--%>
                        <%--                                    10            </option>--%>
                        <%--                                <option value="https://www.fahasa.com/sales/order/history/?limit=20" selected="selected">--%>
                        <%--                                    20            </option>--%>
                        <%--                                <option value="https://www.fahasa.com/sales/order/history/?limit=50">--%>
                        <%--                                    50            </option>--%>
                        <%--                            </select>     </div>--%>


                    </div>
                    <div style="overflow-x: auto; max-width: 100vw; min-height: 50vh;" class="mt-3">
                        <table cellspacing="0" cellpadding="0" border="0" width="100%" class="order-history-table">
                            <thead>
                            <tr>
                                <th class="text-center">Đơn hàng #</th>
                                <th class="text-center">Ngày đặt hàng</th>
                                <th class="text-center">Giao hàng đến</th>
                                <th class="text-center">Tổng Tiền Hàng</th>
                                <th class="order-status-dropdown text-center panel-icon">
                                    Trạng Thái
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for (HoaDon hoaDon : hoaDonDAOIMP.getHoaDon(maTK)) {
                                    int status = hoaDon.getStatus();
                                    String sta = "";
                                    if (status == 0) {
                                        sta = "Đơn hàng mới";
                                    } else if (status == 1) {
                                        sta = "Giao hàng";
                                    } else {
                                        sta = "Hoàn tất";
                                    }
                            %>
                            <tr data-href="wishlist.html" class="order-history-table-row order-history-table-row1">
                                <td><a href="billinfo.jsp?maHoaDon=<%=hoaDon.getMaHoaDon()%>"><%=hoaDon.getMaHoaDon()%>
                                </a></td>
                                <td><span class="nobr"><%=hoaDon.getNgayMuaHang()%></span></td>
                                <td><%=hoaDon.getDiaChi()%>
                                </td>
                                <td class="text-right"><span class="price"><%=nf.format(hoaDon.getTongtien())%></span>VND
                                </td>
                                <td class="text-center"><%=sta%></td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
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