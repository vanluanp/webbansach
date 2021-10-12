<%@ page import="Util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Thêm tài khoản</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("plugins/fontawesome-free/css/all.min.css")%>>
  <!-- Ionicons -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css")%>>
  <!-- DataTables -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("plugins/datatables-bs4/css/dataTables.bootstrap4.css")%>>
  <!-- Theme style -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("dist/css/adminlte.min.css")%>>
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <jsp:include page="header.jsp"></jsp:include>
  <%
    String err = "", userName_err = "", phone_err = "", password_err = "", repass_err = "";
    if (request.getAttribute("err") != null) {
      err = (String) request.getAttribute("err");
    }
    if (request.getAttribute("userName_err") != null) {
      userName_err = (String) request.getAttribute("userName_err");
    }
    if (request.getAttribute("phone_err") != null) {
      phone_err = (String) request.getAttribute("phone_err");
    }
    if (request.getAttribute("password_err") != null) {
      password_err = (String) request.getAttribute("password_err");
    }
    if (request.getAttribute("repass_err") != null) {
      repass_err = (String) request.getAttribute("repass_err");
    }
    //
    String name = "", userName = "", phone = "";
    ;
    if (request.getAttribute("name") != null) {
      name = (String) request.getAttribute("name");
    }
    if (request.getAttribute("userName") != null) {
      userName = (String) request.getAttribute("userName");
    }
    if (request.getAttribute("phone") != null) {
      phone = (String) request.getAttribute("phone");
    }
  %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Thêm tài khoản</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href=<%=Util.utilAdmin("trangchu.jsp")%>>Trang chủ</a></li>
              <li class="breadcrumb-item active"><a href=<%=Util.utilAdmin("quanlitaikhoan.jsp")%>>Quản lý tài khoản</a></li>
              <li class="breadcrumb-item active">Thêm tài khoản</li>
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
                    Điền vào form để thêm tài khoản</a>
                </div>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <div class="row justify-content-center">
                <div class="col-md-6">
                  <div class="card card-info">
                    <div class="card-header">
                      <h3 class="card-title">Thông tin tài khoản</h3>
                    </div>
                    <div class="card-body">
                      <form role="form" method="post" action="/PJ/ThemTKServlet">
                        <!-- Date dd/mm/yyyy -->
                        <p style="color: red ; font-weight: bold"><%=err%>
                        <div class="form-group">
                          <label>Họ và tên*</label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="far fa-id-card"></i></span>
                            </div>
                            <input type="text" class="form-control" name="name" value="<%=name%>">
                          </div>
                          <!-- /.input group -->
                        </div>
                        <!-- /.form group -->
                        <!-- phone mask -->
                        <!-- phone mask -->
                        <div class="form-group">
                          <label>Tên đăng nhập*</label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fa fa-user-alt"></i></span>
                            </div>
                            <input type="email" class="form-control" name="userName" value="<%=userName%>">
                          </div>
                          <!-- /.input group -->
                        </div>
                        <!-- /.form group -->
                        <div class="form-group">
                          <label>Mật khẩu*</label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fa fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" name="password">
                          </div>
                          <!-- /.input group -->
                        </div>
                        <div class="form-group">
                          <label>Nhập lại mật khẩu*</label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fa fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" name="repassword">
                          </div>
                          <!-- /.input group -->
                        </div>
                        <!-- /.form group -->
                        <!-- phone mask -->
                        <div class="form-group">
                          <label>Quyền*</label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fa fa-user-alt"></i></span>
                            </div>
                            <%--                            <input type="text" class="form-control">--%>
                            <select class="form-control" name="quyen">
                              <option value="2">Khách hàng</option>
                              <option value="1">Nhân viên</option>
                              <option value="0">Quản trị</option>
                            </select>
                          </div>
                          <!-- /.input group -->
                        </div>
                        <!-- phone mask -->
                        <div class="form-group">
                          <label>Trạng thái*</label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fa fa-user-alt"></i></span>
                            </div>
                            <%--                            <input type="text" class="form-control">--%>
                            <select class="form-control" name="status">
                              <option value="0">Vô hiệu</option>
                              <option value="1">Hoạt động</option>
                            </select>
                          </div>
                          <!-- /.input group -->
                        </div>
                        <!-- /.form group -->
                        <!-- /.form group -->
                        <!-- phone mask -->
                        <div class="form-group">
                          <label>Số điện thoại </label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fa fa-phone"></i></span>
                            </div>
                            <input type="number" class="form-control" name="phone" value="<%=phone%>">
                          </div>
                          <!-- /.input group -->
                        </div>
                        <!-- /.form group -->
                        <!-- phone mask -->
<%--                        <div class="form-group">--%>
<%--                          <label>Email</label>--%>

<%--                          <div class="input-group">--%>
<%--                            <div class="input-group-prepend">--%>
<%--                              <span class="input-group-text"><i class="fa fa-envelope"></i></span>--%>
<%--                            </div>--%>
<%--                            <input type="email" class="form-control" name="email">--%>
<%--                          </div>--%>
<%--                          <!-- /.input group -->--%>
<%--                        </div>--%>
                        <!-- /.form group -->
                        <!-- phone mask -->
                        <div class="form-group">
                          <div class="input-group justify-content-center">
                            <a href="#">
                              <button type="submit" class="btn btn-success text-right">
                                <i class="fa fa-plus-circle"></i> Thêm
                              </button>
                            </a>
                            <a href="quanlitaikhoan.jsp">
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


