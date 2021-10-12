<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Util.Util" %>
<%@ page import="dao.DanhMucDaoIMP" %>
<%@ page import="Model.HoaDon" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Quản lý hóa đơn</title>
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
            <h1>Quản lý hóa đơn</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href=<%=Util.utilAdmin("trangchu.jsp")%>>Trang chủ</a></li>
              <li class="breadcrumb-item active">Quản lý hóa đơn</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <%
      DanhMucDaoIMP danhMucDaoIMP = new DanhMucDaoIMP();
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
                    Bảng quản lý các hóa đơn</a>
                </div>
                <div class=" col-6 text-right">
                  <%--                  <a href="themdonhang.jsp">--%>
                  <%--                    <button type="button" class="btn btn-primary text-right">--%>
                  <%--                      <i class="fa fa-plus-circle"></i> Thêm mới hóa đơn--%>
                  <%--                    </button>--%>
                  <%--                  </a>--%>
                </div>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-responsive-md">
                <thead>
                <tr>
                  <th title="Số thứ tự">STT</th>
                  <th>Mã hóa đơn</th>
                  <th>Thông tin khách hàng</th>
                  <th>Ngày mua</th>
                  <th>Tình trạng</th>
                  <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <%
                  int count = 0;
                  for (HoaDon list : danhMucDaoIMP.getListOrder()) {
                    count++;
                %>
                <tr>
                  <td><%=count%>
                  </td>
                  <td><%=list.getMaHoaDon()%>
                  </td>
                  <td><%=list.getDiaChi()%>
                  </td>
                  <td><%=list.getNgayMuaHang()%>
                  </td>
                  <%
                    String status = "";
                    if (list.getStatus() == 0) {
                      status = "Đơn hàng mới";
                    } else if (list.getStatus() == 1) {
                      status = "Đang giao hàng";
                    } else {
                      status = "Đã giao hàng";
                    }
                  %>
                  <td><%=status%>
                  </td>
                  <td>
                    <div class="row justify-content-center">
                      <a href="/PJ/XoaHDServlet?maHoaDon=<%=list.getMaHoaDon()%>">
                        <button type="button" class="btn btn-block btn-outline-danger">
                          <i class="fa fa-trash-alt"></i>
                        </button>
                      </a>
                      <a href="chitiethoadon.jsp?maHoaDon=<%=list.getMaHoaDon()%>">
                        <button type="button" class="btn btn-block btn-outline-success ml-1">
                          <i class="fa fa-edit"></i>
                        </button>
                      </a>

                    </div>
                  </td>
                </tr>
                <%
                  }
                %>
                </tbody>
                <tfoot>
                <tr>
                  <th title="Số thứ tự">STT</th>
                  <th>Mã hóa đơn</th>
                  <th>Thông tin khách hàng</th>
                  <th>Ngày mua</th>
                  <th>Tình trạng</th>
                  <th>Thao tác</th>
                </tr>
                </tfoot>
              </table>
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
<!-- DataTables -->
<script src=<%=Util.utilAdmin("plugins/datatables/jquery.dataTables.js")%>></script>
<script src=<%=Util.utilAdmin("plugins/datatables-bs4/js/dataTables.bootstrap4.js")%>></script>
<!-- AdminLTE App -->
<script src=<%=Util.utilAdmin("dist/js/adminlte.min.js")%>></script>
<!-- AdminLTE for demo purposes -->
<script src=<%=Util.utilAdmin("dist/js/demo.js")%>></script>
<!-- page script -->
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
</body>
</html>


