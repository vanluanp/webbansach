<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Util.Util" %>
<%@ page import="dao.TinTucDaoIMP" %>
<%@ page import="Model.TinTuc" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Sửa tin tức</title>
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
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.css">

  <script src=<%=Util.utilUser("admin/ckeditor/ckeditor.js")%>></script>
  <script src=<%=Util.utilUser("admin/ckfinder/ckfinder.js")%>></script>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <jsp:include page="header.jsp"></jsp:include>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Sửa tin tức</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href=<%=Util.utilAdmin("trangchu.jsp")%>>Trang chủ</a></li>
              <li class="breadcrumb-item active"><a href=<%=Util.utilAdmin("quanlitintuc.jsp")%>>Quản lý tin tức</a>
              </li>
              <li class="breadcrumb-item active">Sửa tin tức</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <%
      TinTucDaoIMP tinTucDaoIMP = new TinTucDaoIMP();
      TinTuc tinTuc = tinTucDaoIMP.getTinTuc(request.getParameter("maTinTuc"));
    %>
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <div class="row">
                <div class=" col-6">
                  <a class="card-title">
                    Điền vào form để sửa tin tức</a>
                </div>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <div class="row justify-content-center">
                <div class="col-md-10">
                  <div class="card card-info">
                    <div class="card-header">
                      <h3 class="card-title">Thông tin tin tức</h3>
                    </div>
                    <div class="card-body">
                      <form role="form" action=<%=Util.utilUser("SuaTinTucServlet")%> method="post" >
                        <!-- Date dd/mm/yyyy -->
                        <div class="form-group">
                          <label>Tiêu đề</label>

                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="far fa-id-card"></i></span>
                            </div>
                            <input type="text" class="form-control" name="tieude" value="<%=tinTuc.getTieuDe()%>">
                          </div>
                          <!-- /.input group -->
                        </div>
                        <!-- /.form group -->
                        <!-- phone mask -->
                        <div class="form-group">
                          <label>Nội dung</label>

                          <div class="input-group">
                            <div class="mb-3">
                                  <textarea class="input-group" id="myCkeditor" name="news" ><%=tinTuc.getNoiDung()%>

                            <%--                            <div class="mb-3">--%>
                            <%--                                  <textarea id="ckeditor" class="textarea" placeholder="Place some text here"--%>
                            <%--                                            style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid rgb(221, 221, 221); padding: 10px; display: none;"></textarea>--%>
                            <%--                            </div>--%>
                          </textarea>
                            </div>
                          </div>
                          <!-- /.input group -->
                        </div>
                        <script language="JavaScript">
                            config = {};
                            config.entities_latin = false;
                            config.language = 'vi';
                            var f = CKEDITOR.replace("myCkeditor", config);
                            CKFinder.setupCKEditor(f, 'ckfinder/');
                            var desc = CKEDITOR.instances['myCkeditor'].getData();
                            // document.getElementById("myCkeditor").dataset=desc;
                            <%--var t= <%=tinTuc.getNoiDung()%>;--%>
                            <%--CKEDITOR.instances.instances['myCkeditor'].setData(t);--%>
                        </script>
                        <!-- /.form group -->
                        <!-- phone mask -->
                        <!-- phone mask -->
                        <div class="form-group">
                          <div class="input-group justify-content-center">
                            <input type="hidden" name="maTinTuc" value="<%=request.getParameter("maTinTuc")%>">
                            <a href="#">
                              <button type="submit" class="btn btn-success text-right">
                                <i class="fa fa-edit"></i> Sửa
                              </button>
                            </a>
                            <a href="quanlitintuc.jsp">
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


