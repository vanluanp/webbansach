<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/12/2019
  Time: 1:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="Util.Util" %>
<%@ page import="dao.TaiKhoanDaoIMP" %>
<%@ page import="tools.MaHoa" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<%
  String userName="";
    userName= (String) session.getAttribute("userName");
%>
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-dark navbar-info">
  <!-- Left navbar links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
    </li>
  </ul>

  <!-- Right navbar links -->
  <ul class="navbar-nav ml-auto">

    <!-- Notifications Dropdown Menu -->
    <li class="nav-item dropdown">
      <a class="nav-link" data-toggle="dropdown" href="#">
        <i class="far fa-user-circle fa-2x"></i>
      </a>
      <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
        <span class="dropdown-item dropdown-header"><%=userName%></span>
        <div class="dropdown-divider"></div>
        <a href="<%=Util.utilUser("index.jsp")%>" class="dropdown-item">
          <i class="fas fa-sign-out-alt mr-2"></i> Về trang người dùng
        </a>
        <div class="dropdown-divider"></div>
        <a href="<%=Util.utilUser("DangNhapServlet?command=logout")%>" class="dropdown-item">
          <i class="fas fa-sign-in-alt mr-2"></i> Đăng xuất
        </a>
        <div class="dropdown-divider"></div>
      </div>
    </li>

  </ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-light-info elevation-4">
  <!-- Brand Logo -->
  <a href="<%=Util.utilUser("index.jsp")%>" class="brand-link navbar-cyan">
    <img alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8" src=<%=Util.utilAdmin("dist/img/AdminLTELogo.png")%>>
    <span class="brand-text font-weight-bolder">H&B Bookstore</span>
  </a>

  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar user (optional) -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="image">
        <img class="img-circle elevation-2" alt="User Image" src=<%=Util.utilAdmin("dist/img/Logo2.png")%>>
      </div>
      <div class="info">
        <a href="<%=Util.utilAdmin("trangchu.jsp")%>" class="d-block">H&B Admin</a>
      </div>
    </div>

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <!-- Add icons to the links using the .nav-icon class
             with font-awesome or any other icon font library -->
        <li class="nav-item">
          <a href="<%=Util.utilAdmin("trangchu.jsp")%>" class="nav-link active">
            <i class="nav-icon fas fa-home"></i>
            <p>
              Trang chủ
            </p>
          </a>
        </li>
        <li class="nav-item">
          <a href=<%=Util.utilAdmin("quanlidanhmuc.jsp")%> class="nav-link">
            <i class="nav-icon fas fa-th-list"></i>
            <p>
              Quản lý danh mục
            </p>
          </a>
        </li>
        <li class="nav-item">
          <a href=<%=Util.utilAdmin("quanliNXB.jsp")%> class="nav-link">
            <i class="nav-icon fas fa-th-list"></i>
            <p>
              Quản lý nhà xuất bản
            </p>
          </a>
        </li>
        <li class="nav-item">
          <a href=<%=Util.utilAdmin("quanlisanpham.jsp")%> class="nav-link">
            <i class="nav-icon fa fa-book"></i>
            <p>
              Quản lý sản phẩm
            </p>
          </a>
        </li>
        <li class="nav-item">
          <%
            userName = (String) session.getAttribute("userName");
            String password = (String) session.getAttribute("password");
            TaiKhoanDaoIMP taiKhoanDaoIMP= new TaiKhoanDaoIMP();
            String href="";
            if (taiKhoanDaoIMP.checkDangNhapAd(userName, MaHoa.maHoaMD5(password))) {
                href= Util.utilAdmin("quanlitaikhoan.jsp");
            }
          %>
          <a href="<%=href%>" class="nav-link">
            <i class="nav-icon fas fa-user"></i>
            <p>
              Quản lý tài khoản
            </p>
          </a>
        </li>
        <li class="nav-item">
          <a href=<%=Util.utilAdmin("quanlidonhang.jsp")%> class="nav-link">
            <i class="nav-icon fas fa-money-bill"></i>
            <p>
              Quản lý hóa đơn
            </p>
          </a>
        </li>
        <li class="nav-item">
          <a href="<%=Util.utilAdmin("quanlitintuc.jsp")%>" class="nav-link">
            <i class="nav-icon fa fa-newspaper"></i>
            <p>
              Quản lý tin tức
            </p>
          </a>
        </li>
        <li class="nav-item">
          <a href=<%=Util.utilAdmin("quanlibinhluan.jsp")%> class="nav-link">
            <i class="nav-icon fas fa-comment"></i>
            <p>
              Quản lý bình luận
            </p>
          </a>
        </li>
<%--        <li class="nav-item">--%>
<%--          <a href=<%=Util.utilAdmin("thongke.jsp")%> class="nav-link">--%>
<%--            <i class="nav-icon fas fa-chart-area"></i>--%>
<%--            <p>--%>
<%--              Thống kê--%>
<%--            </p>--%>
<%--          </a>--%>
<%--        </li>--%>

      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>
</body>
</html>
