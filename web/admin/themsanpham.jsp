<%@ page import="dao.DanhMucDaoIMP" %>
<%@ page import="Model.DanhMuc" %>
<%@ page import="Util.Util" %>
<%@ page import="Model.NhaXuatBan" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Thêm sản phẩm</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("plugins/fontawesome-free/css/all.min.css")%>>
  <!-- Ionicons -->
  <link rel="stylesheet"
        href=<%=Util.utilAdmin("https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css")%>>
  <!-- DataTables -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("plugins/datatables-bs4/css/dataTables.bootstrap4.css")%>>
  <!-- Theme style -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("dist/css/adminlte.min.css")%>>
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <!-- summernote -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("plugins/summernote/summernote-bs4.css")%>>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <jsp:include page="header.jsp"></jsp:include>
  <%
    DanhMucDaoIMP danhMucDaoIMP = new DanhMucDaoIMP();


    String err = "";
    if (request.getAttribute("error") != null) {
      err = (String) request.getAttribute("error");
    }
    String maSach = "";
    if (request.getAttribute("maSach") != null) {
      maSach = (String) request.getAttribute("maSach");
    }
    String tenSach = "";
    if (request.getAttribute("tenSach") != null) {
      tenSach = (String) request.getAttribute("tenSach");
    }
    String tacGia = "";
    if (request.getAttribute("tacGia") != null) {
      tacGia = (String) request.getAttribute("tacGia");
    }
  %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Thêm sản phẩm</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href=<%=Util.utilAdmin("trangchu.jsp")%>>Trang chủ</a></li>
              <li class="breadcrumb-item active"><a href=<%=Util.utilAdmin("quanlisanpham.jsp")%>>Quản lý sản phẩm</a></li>
              <li class="breadcrumb-item active">Thêm sản phẩm</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <div class="row">
                <div class=" col-6">
                  <a class="card-title">
                    Điền vào form để thêm sản phẩm</a>
                </div>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <div class="row justify-content-center">
                <div class="col-md-10">
                  <div class="card card-info">
                    <div class="card-header">
                      <h3 class="card-title">Thông tin sản phẩm</h3>
                    </div>
                    <div class="card-body">
                      <p style="color: red ; font-weight: bold"><%=err%>
                      </p></label>
                      <form role="form" method="post" action=<%=Util.utilUser("QLSanPhamServlet")%>>
                        <!-- Date dd/mm/yyyy -->
                        <div class="form-group">
                          <label>Mã sách (Nếu có)</label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="far fa-id-card"></i></span>
                            </div>
                            <input type="text" class="form-control" name="maSach" value="<%=maSach%>">
                          </div>
                          <!-- /.input group -->
                        </div>
                        <div class="form-group">
                          <label>Tên sách</label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fa fa-list"></i></span>
                            </div>
                            <input type="text" class="form-control" name="tenSach" value="<%=tenSach%>">
                          </div>
                          <!-- /.input group -->
                        </div>
                        <div class="form-group">
                          <label>Tác giả</label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fa fa-list"></i></span>
                            </div>
                            <input type="text" class="form-control" name="tacGia" value="<%=tacGia%>">
                          </div>
                          <!-- /.input group -->
                        </div>
                        <div class="form-group">
                          <label>Nhà xuất bản</label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fa fa-list"></i></span>
                            </div>
                            <select class="form-control" name="maNhaXuatBan">
                              <%
                                for (NhaXuatBan nhaXuatBan : danhMucDaoIMP.getListNXB()) {
                              %>
                              <option value="<%=nhaXuatBan.getMaNhaXuatBan()%>"><%=nhaXuatBan.getTenNhaXuatBan()%>
                              </option>
                              <%
                                }
                              %>
                            </select>
                          </div>
                          <!-- /.input group -->
                        </div>
                        <!-- phone mask -->
                        <div class="form-group">
                          <label>Hình bìa trước</label>

                          <!-- <label for="customFile">Custom File</label> -->

                          <%--                          <div class="custom-file">--%>
                          <%--                            <input type="file" class="custom-file-input" id="customFileImg1" name="hinhAnh1">--%>
                          <%--                            <label class="custom-file-label" for="customFileImg1">Choose file</label>--%>
                          <%--                          </div>--%>
                          <div class="custom-file">
<%--                            <form method="POST" enctype="multipart/form-data" action=<%=Util.utilUser("QLSanPhamServlet")%>>--%>
                              <input type="file" name="hinhAnh1"><img src="http://localhost:8000/PJ/images/books/book (241).jpg" style="width: 80px" height="100px"><br/>
<%--                              <br/>--%>
<%--                              <input type="submit" value="Tai">--%>
<%--                            </form>--%>
                          </div>
                          <!-- /.input group -->
                        </div>
                        <div class="form-group">
                          <label>Hình bìa sau</label>

                          <!-- <label for="customFile">Custom File</label> -->

                          <div class="custom-file">
                            <input type="file" name="hinhAnh2"><img src="http://localhost:8000/PJ/images/books1/book (241).jpg" style="width: 80px" height="100px"><br/>
                          </div>
                          <!-- /.input group -->
                        </div>
                        <!-- phone mask -->
                        <div class="form-group">
                          <label>Số lượng nhập</label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fa fa-th-list"></i></span>
                            </div>
                            <input type="number" class="form-control" name="soLuongNhap">
                          </div>
                          <!-- /.input group -->
                        </div>
                        <div class="form-group">
                          <label>Giá khuyến mãi</label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fa fa-money-check"></i></span>
                            </div>
                            <input type="number" class="form-control" name="giaKhuyenMai">
                          </div>
                          <!-- /.input group -->
                        </div>
                        <div class="form-group">
                          <label>Giá gốc</label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fa fa-money-check"></i></span>
                            </div>
                            <input type="number" class="form-control" name="giaGoc">
                          </div>
                          <!-- /.input group -->
                        </div>
                        <!-- /.form group -->
                        <!-- phone mask -->
                        <div class="form-group">
                          <label>Mô tả</label>

                          <div class="custom-file">
                            <input type="file" name="moTa">
                          </div>
                          <!-- /.input group -->
                        </div>
                        <!-- /.form group -->
                        <div class="form-group">
                          <label>Chi tiết mô tả</label>

                          <div class="custom-file">
                            <input type="file" name="chiTietMoTa">
                          </div>
                          <!-- /.input group -->
                        </div>
                        <div class="form-group">
                          <label>Thể loại sách</label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="far fa-id-card"></i></span>
                            </div>
                            <select class="form-control" name="maLoaiSach">
                              <%
                                for (DanhMuc danhMuc : danhMucDaoIMP.getListConAll()) {
                              %>
                              <option value="<%=danhMuc.getMaDanhMuc()%>"><%=danhMuc.getTenDanhMuc()%>
                              </option>
                              <%
                                }
                              %>
                            </select>
                          </div>
                          <!-- /.input group -->
                        </div>
                        <div class="form-group">
                          <label>Trạng thái</label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="far fa-id-card"></i></span>
                            </div>
                            <select class="form-control" name="status">
                              <option value="0">Ẩn đi</option>
                              <option value="1" selected>Sách</option>
                              <option value="2">Slider 1</option>
                              <option value="3">Slider 2</option>
                              <option value="4">Khuyến mãi</option>
                            </select>
                          </div>
                          <!-- /.input group -->
                        </div>

                        <div class="form-group">
                          <div class="input-group justify-content-center">
                            <input type="hidden" name="command" value="insert">
                            <a href="#">
                              <button type="submit" class="btn btn-success text-right">
                                <i class="fa fa-plus-circle"></i> Thêm sách
                              </button>
                            </a>
                            <a href=<%=Util.utilAdmin("quanlisanpham.jsp")%>
                                 <button type="button" class="btn btn-info text-right ml-1">
                              <i class="fa fa-arrow-alt-circle-left"></i> Trở về
                              </button>
                            </a>
                          </div>
                          <!-- /.input group -->
                        </div>

                        <!-- /.form group -->

                      </form>
                    </div>
                    <!-- /.card-body -->
                  </div>
                  <!-- /.card -->

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
<script src=<%=Util.utilAdmin("plugins/summernote/summernote-bs4.min.js")%>></script>
<script src=<%=Util.utilAdmin("plugins/bs-custom-file-input/bs-custom-file-input.min.js")%>></script>
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
<script>
    $(function () {
        // Summernote
        $('.textarea').summernote()
    })
    $(document).ready(function () {
        bsCustomFileInput.init();
    });
</script>
</body>
</html>


