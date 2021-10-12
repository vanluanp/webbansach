<%@ page import="Util.Util" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24/11/2019
  Time: 4:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head><script type="text/javascript" src="https://mail-attachment.googleusercontent.com/injected/se.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>404</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicons -->
    <link rel="shortcut icon" href=<%=Util.utilUser("images/favicon.jpg")%>>
    <link rel="apple-touch-icon" href=<%=Util.utilUser("images/icon.png")%>>

    <!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">

    <!-- Stylesheets -->
    <link rel="stylesheet" href=<%=Util.utilUser("css/bootstrap.min.css")%>>
    <link rel="stylesheet" href=<%=Util.utilUser("css/plugins.css")%>>
    <link rel="stylesheet" href=<%=Util.utilUser("style.css")%>>

    <!-- Cusom css -->
    <link rel="stylesheet" href=<%=Util.utilUser("css/custom.css")%>>

    <!-- Modernizer js -->
    <script src=<%=Util.utilUser("js/vendor/modernizr-3.5.0.min.js")%>></script>
</head>
<body>

<!-- Main wrapper -->
<div class="wrapper" id="wrapper">

    <!-- Header -->
    <jsp:include page=  "header.jsp"></jsp:include>
    <!-- Start Bradcaump area -->
    <div class="ht__bradcaump__area bg-image--6" style="margin-top: 6.3%">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">404</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">404</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->

    <!-- Start Error Area -->
    <section class="page_error section-padding--lg bg--white">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="error__inner text-center">
                        <div class="error__logo">
                            <a href="#"><img src=<%=Util.utilUser("images/others/404-not-found-error-explained-2622936-Final-387df77f30dd4c9d805012c2ba13fbc5.png")%> alt="errorimages"></a>
                            <a href="index.jsp"><button id="button404">Về trang chủ</button></a>
                        </div>
                        <!--							<div class="error__content">-->
                        <!--								<h2>error - not found</h2>-->
                        <!--								<p>It looks like you are lost! Try searching here</p>-->
                        <!--								<div class="search_form_wrapper">-->
                        <!--									<form action="#">-->
                        <!--										<div class="form__box">-->
                        <!--											<input type="text" placeholder="Search...">-->
                        <!--											<button><i class="fa fa-search"></i></button>-->
                        <!--										</div>-->
                        <!--									</form>-->
                        <!--								</div>-->
                        <!--							</div>-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Error Area -->

    <!-- Footer Area -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- //Footer Area -->

</div>
<!-- //Main wrapper -->

<!-- JS Files -->
<script src=<%=Util.utilUser("js/vendor/jquery-3.2.1.min.js")%>></script>
<script src=<%=Util.utilUser("js/popper.min.js")%>></script>
<script src=<%=Util.utilUser("js/bootstrap.min.js")%>></script>
<script src=<%=Util.utilUser("js/plugins.js")%>></script>
<script src=<%=Util.utilUser("js/active.js")%>></script>

</body>
</html>
