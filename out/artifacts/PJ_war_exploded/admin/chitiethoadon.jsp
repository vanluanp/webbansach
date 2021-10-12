<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Util.Util" %>
<%@ page import="dao.HoaDonDAOIMP" %>
<%@ page import="Model.HoaDon" %>
<%@ page import="Model.ChiTietHoaDon" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="dao.ChiTietHoaDonDAOIMP" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Chi tiết hóa đơn</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("plugins/fontawesome-free/css/all.min.css")%>>
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("plugins/datatables-bs4/css/dataTables.bootstrap4.css")%>>
  <!-- Theme style -->
  <link rel="stylesheet" type="text/css" href=<%=Util.utilAdmin("dist/css/adminlte.min.css")%>>
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link rel="stylesheet" href="dist/css/custom.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar -->
  <jsp:include page="header.jsp"></jsp:include>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Chi tiết hóa đơn</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="trangchu.html">Trang chủ</a></li>
              <li class="breadcrumb-item active"><a href="quanlidonhang.html">Quản lý hóa đơn</a></li>
              <li class="breadcrumb-item active">Chi tiết hóa đơn</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <%
      HoaDonDAOIMP hoaDonDAOIMP= new HoaDonDAOIMP();
      HoaDon hoaDon = hoaDonDAOIMP.getHoaDonSingle(request.getParameter("maHoaDon"));
        int status = hoaDon.getStatus();
        String sta = "";
        if (status == 0) {
          sta = "Đơn hàng mới";
        } else if (status == 1) {
          sta = "Giao hàng";
        } else {
          sta = "Hoàn tất";
        }
      NumberFormat nf = NumberFormat.getInstance();
      nf.setMinimumFractionDigits(0);
      ChiTietHoaDonDAOIMP chiTietHoaDonDAOIMP = new ChiTietHoaDonDAOIMP();
    %>
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <div class="row">
                <div class=" col-6">
                  <a class="card-title text-uppercase">
                    Thông tin hóa đơn của khách hàng</a>
                </div>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">

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
<!--                      <dl class="order-info-2">-->
<!--                        <dd>-->
<!--                          <ul id="order-info-tabs">-->
<!--                            <li class="current first last">Thông tin đơn hàng</li>-->
<!--                          </ul>-->
<!--                        </dd>-->
<!--                      </dl>-->




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
                                  for (ChiTietHoaDon chiTietHoaDon : chiTietHoaDonDAOIMP.getCTHD(request.getParameter("maHoaDon"))) {
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
                                    for (ChiTietHoaDon chiTietHoaDon : chiTietHoaDonDAOIMP.getCTHD(request.getParameter("maHoaDon"))) {
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
                            href="quanlidonhang.jsp"><button class="btn btn-info"><i class="fa fa-arrow-alt-circle-left"></i> Trở về</button></a>
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>

                </div>
              </div>

            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="footer.jsp"></jsp:include>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src=<%=Util.utilAdmin("plugins/jquery/jquery.min.js")%>></script>
<!-- Bootstrap 4 -->
<script src=<%=Util.utilAdmin("plugins/bootstrap/js/bootstrap.bundle.min.js")%>></script>
<!-- Select2 -->
<script src=<%=Util.utilAdmin("plugins/select2/js/select2.full.min.js")%>></script>
<!-- Bootstrap4 Duallistbox -->
<script src=<%=Util.utilAdmin("plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js")%>></script>
<!-- InputMask -->
<script src=<%=Util.utilAdmin("plugins/moment/moment.min.js")%>></script>
<script src=<%=Util.utilAdmin("plugins/inputmask/min/jquery.inputmask.bundle.min.js")%>></script>
<!-- date-range-picker -->
<script src=<%=Util.utilAdmin("plugins/daterangepicker/daterangepicker.js")%>></script>
<!-- bootstrap color picker -->
<script src=<%=Util.utilAdmin("plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js")%>></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src=<%=Util.utilAdmin("plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js")%>></script>
<!-- Bootstrap Switch -->
<script src=<%=Util.utilAdmin("plugins/bootstrap-switch/js/bootstrap-switch.min.js")%>></script>
<!-- AdminLTE App -->
<script src=<%=Util.utilAdmin("dist/js/adminlte.min.js")%>></script>
<!-- AdminLTE for demo purposes -->
<script src=<%=Util.utilAdmin("dist/js/demo.js")%>></script>
<script>
    $(function () {
        $("#example1").DataTable();
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
        });
    });
</script>
<script>
    $(function () {
        //Initialize Select2 Elements
        $('.select2').select2()

        //Initialize Select2 Elements
        $('.select2bs4').select2({
            theme: 'bootstrap4'
        })

        //Datemask dd/mm/yyyy
        $('#datemask').inputmask('dd/mm/yyyy', {'placeholder': 'dd/mm/yyyy'})
        //Datemask2 mm/dd/yyyy
        $('#datemask2').inputmask('mm/dd/yyyy', {'placeholder': 'mm/dd/yyyy'})
        //Money Euro
        $('[data-mask]').inputmask()

        //Date range picker
        $('#reservation').daterangepicker()
        //Date range picker with time picker
        $('#reservationtime').daterangepicker({
            timePicker: true,
            timePickerIncrement: 30,
            locale: {
                format: 'MM/DD/YYYY hh:mm A'
            }
        })
        //Date range as a button
        $('#daterange-btn').daterangepicker(
            {
                ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                startDate: moment().subtract(29, 'days'),
                endDate: moment()
            },
            function (start, end) {
                $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
            }
        )

        //Timepicker
        $('#timepicker').datetimepicker({
            format: 'LT'
        })

        //Bootstrap Duallistbox
        $('.duallistbox').bootstrapDualListbox()

        //Colorpicker
        $('.my-colorpicker1').colorpicker()
        //color picker with addon
        $('.my-colorpicker2').colorpicker()

        $('.my-colorpicker2').on('colorpickerChange', function (event) {
            $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
        });

        $("input[data-bootstrap-switch]").each(function () {
            $(this).bootstrapSwitch('state', $(this).prop('checked'));
        });

    })
</script>
</body>
</html>


