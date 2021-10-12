<%@ page import="Util.Util" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 06/12/2019
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Trang chủ</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("plugins/fontawesome-free/css/all.min.css")%>>
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css")%>>
  <!-- iCheck -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("plugins/icheck-bootstrap/icheck-bootstrap.min.css")%>>
  <!-- JQVMap -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("plugins/jqvmap/jqvmap.min.css")%>>
  <!-- Theme style -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("dist/css/adminlte.min.css")%>>
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("plugins/overlayScrollbars/css/OverlayScrollbars.min.css")%>>
  <!-- Daterange picker -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("plugins/daterangepicker/daterangepicker.css")%>>
  <!-- summernote -->
  <link rel="stylesheet" href=<%=Util.utilAdmin("plugins/summernote/summernote-bs4.css")%>>
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
  <jsp:include page="/admin/header.jsp"></jsp:include>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Trang chủ</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>50</h3>

                <p>Đơn đặt hàng</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="admin/thongke.jsp" class="small-box-footer">Xem thêm <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3>100,000,000<sup style="font-size: 20px">đ</sup></h3>

                <p>Doanh thu</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="admin/thongke.jsp" class="small-box-footer">Xem thêm <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>100</h3>

                <p>Lượt bình luận</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="admin/thongke.jsp" class="small-box-footer">Xem thêm <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h3>6500</h3>

                <p>Lượt truy cập</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <a href="admin/thongke.jsp" class="small-box-footer">Xem thêm <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
<%--        <div class="row">--%>
<%--          <div class="col-md-12">--%>
<%--            <div class="card">--%>
<%--              <div class="card-header">--%>
<%--                <h5 class="card-title">Monthly Recap Report</h5>--%>

<%--                <div class="card-tools">--%>
<%--                  <button type="button" class="btn btn-tool" data-card-widget="collapse">--%>
<%--                    <i class="fas fa-minus"></i>--%>
<%--                  </button>--%>
<%--                  <div class="btn-group">--%>
<%--                    <button type="button" class="btn btn-tool dropdown-toggle" data-toggle="dropdown">--%>
<%--                      <i class="fas fa-wrench"></i>--%>
<%--                    </button>--%>
<%--                    <div class="dropdown-menu dropdown-menu-right" role="menu">--%>
<%--                      <a href="#" class="dropdown-item">Action</a>--%>
<%--                      <a href="#" class="dropdown-item">Another action</a>--%>
<%--                      <a href="#" class="dropdown-item">Something else here</a>--%>
<%--                      <a class="dropdown-divider"></a>--%>
<%--                      <a href="#" class="dropdown-item">Separated link</a>--%>
<%--                    </div>--%>
<%--                  </div>--%>
<%--                  <button type="button" class="btn btn-tool" data-card-widget="remove">--%>
<%--                    <i class="fas fa-times"></i>--%>
<%--                  </button>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--              <!-- /.card-header -->--%>
<%--              <div class="card-body">--%>
<%--                <div class="row">--%>
<%--                  <div class="col-md-8">--%>
<%--                    <p class="text-center">--%>
<%--                      <strong>Sales: 1 Jan, 2014 - 30 Jul, 2014</strong>--%>
<%--                    </p>--%>

<%--                    <div class="chart">--%>
<%--                      <!-- Sales Chart Canvas -->--%>
<%--                      <canvas id="salesChart" height="180" style="height: 180px;"></canvas>--%>
<%--                    </div>--%>
<%--                    <!-- /.chart-responsive -->--%>
<%--                  </div>--%>
<%--                  <!-- /.col -->--%>
<%--                  <div class="col-md-4">--%>
<%--                    <p class="text-center">--%>
<%--                      <strong>Goal Completion</strong>--%>
<%--                    </p>--%>

<%--                    <div class="progress-group">--%>
<%--                      Add Products to Cart--%>
<%--                      <span class="float-right"><b>160</b>/200</span>--%>
<%--                      <div class="progress progress-sm">--%>
<%--                        <div class="progress-bar bg-primary" style="width: 80%"></div>--%>
<%--                      </div>--%>
<%--                    </div>--%>
<%--                    <!-- /.progress-group -->--%>

<%--                    <div class="progress-group">--%>
<%--                      Complete Purchase--%>
<%--                      <span class="float-right"><b>310</b>/400</span>--%>
<%--                      <div class="progress progress-sm">--%>
<%--                        <div class="progress-bar bg-danger" style="width: 75%"></div>--%>
<%--                      </div>--%>
<%--                    </div>--%>

<%--                    <!-- /.progress-group -->--%>
<%--                    <div class="progress-group">--%>
<%--                      <span class="progress-text">Visit Premium Page</span>--%>
<%--                      <span class="float-right"><b>480</b>/800</span>--%>
<%--                      <div class="progress progress-sm">--%>
<%--                        <div class="progress-bar bg-success" style="width: 60%"></div>--%>
<%--                      </div>--%>
<%--                    </div>--%>

<%--                    <!-- /.progress-group -->--%>
<%--                    <div class="progress-group">--%>
<%--                      Send Inquiries--%>
<%--                      <span class="float-right"><b>250</b>/500</span>--%>
<%--                      <div class="progress progress-sm">--%>
<%--                        <div class="progress-bar bg-warning" style="width: 50%"></div>--%>
<%--                      </div>--%>
<%--                    </div>--%>
<%--                    <!-- /.progress-group -->--%>
<%--                  </div>--%>
<%--                  <!-- /.col -->--%>
<%--                </div>--%>
<%--                <!-- /.row -->--%>
<%--              </div>--%>
<%--              <!-- ./card-body -->--%>
<%--              <div class="card-footer">--%>
<%--                <div class="row">--%>
<%--                  <div class="col-sm-3 col-6">--%>
<%--                    <div class="description-block border-right">--%>
<%--                      <span class="description-percentage text-success"><i class="fas fa-caret-up"></i> 17%</span>--%>
<%--                      <h5 class="description-header">$35,210.43</h5>--%>
<%--                      <span class="description-text">TOTAL REVENUE</span>--%>
<%--                    </div>--%>
<%--                    <!-- /.description-block -->--%>
<%--                  </div>--%>
<%--                  <!-- /.col -->--%>
<%--                  <div class="col-sm-3 col-6">--%>
<%--                    <div class="description-block border-right">--%>
<%--                      <span class="description-percentage text-warning"><i class="fas fa-caret-left"></i> 0%</span>--%>
<%--                      <h5 class="description-header">$10,390.90</h5>--%>
<%--                      <span class="description-text">TOTAL COST</span>--%>
<%--                    </div>--%>
<%--                    <!-- /.description-block -->--%>
<%--                  </div>--%>
<%--                  <!-- /.col -->--%>
<%--                  <div class="col-sm-3 col-6">--%>
<%--                    <div class="description-block border-right">--%>
<%--                      <span class="description-percentage text-success"><i class="fas fa-caret-up"></i> 20%</span>--%>
<%--                      <h5 class="description-header">$24,813.53</h5>--%>
<%--                      <span class="description-text">TOTAL PROFIT</span>--%>
<%--                    </div>--%>
<%--                    <!-- /.description-block -->--%>
<%--                  </div>--%>
<%--                  <!-- /.col -->--%>
<%--                  <div class="col-sm-3 col-6">--%>
<%--                    <div class="description-block">--%>
<%--                      <span class="description-percentage text-danger"><i class="fas fa-caret-down"></i> 18%</span>--%>
<%--                      <h5 class="description-header">1200</h5>--%>
<%--                      <span class="description-text">GOAL COMPLETIONS</span>--%>
<%--                    </div>--%>
<%--                    <!-- /.description-block -->--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--                <!-- /.row -->--%>
<%--              </div>--%>
<%--              <!-- /.card-footer -->--%>
<%--            </div>--%>
<%--            <!-- /.card -->--%>
<%--          </div>--%>
<%--          <!-- /.col -->--%>
<%--        </div>--%>
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<jsp:include page="/admin/footer.jsp"></jsp:include>
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src=<%=Util.utilAdmin("plugins/jquery/jquery.min.js")%>></script>
<!-- jQuery UI 1.11.4 -->
<script src=<%=Util.utilAdmin("plugins/jquery-ui/jquery-ui.min.js")%>></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src=<%=Util.utilAdmin("plugins/bootstrap/js/bootstrap.bundle.min.js")%>></script>
<!-- ChartJS -->
<script src=<%=Util.utilAdmin("plugins/chart.js/Chart.min.js")%>></script>
<!-- Sparkline -->
<script src=<%=Util.utilAdmin("plugins/sparklines/sparkline.js")%>></script>
<!-- JQVMap -->
<script src=<%=Util.utilAdmin("plugins/jqvmap/jquery.vmap.min.js")%>></script>
<script src=<%=Util.utilAdmin("plugins/jqvmap/maps/jquery.vmap.usa.js")%>></script>
<!-- jQuery Knob Chart -->
<script src=<%=Util.utilAdmin("plugins/jquery-knob/jquery.knob.min.js")%>></script>
<!-- daterangepicker -->
<script src=<%=Util.utilAdmin("plugins/moment/moment.min.js")%>></script>
<script src=<%=Util.utilAdmin("plugins/daterangepicker/daterangepicker.js")%>></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src=<%=Util.utilAdmin("plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js")%>></script>
<!-- Summernote -->
<script src=<%=Util.utilAdmin("plugins/summernote/summernote-bs4.min.js")%>></script>
<!-- overlayScrollbars -->
<script src=<%=Util.utilAdmin("plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js")%>></script>
<!-- AdminLTE App -->
<script src=<%=Util.utilAdmin("dist/js/adminlte.js")%>></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src=<%=Util.utilAdmin("dist/js/pages/dashboard.js")%>></script>
<!-- AdminLTE for demo purposes -->
<script src=<%=Util.utilAdmin("dist/js/demo.js")%>></script>
<script src=<%=Util.utilAdmin("dist/js/pages/dashboard2.js")%>></script>
</body>
</html>

