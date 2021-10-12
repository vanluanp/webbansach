<%@ page import="dao.SanPhamDaoIMP" %>
<%@ page import="Model.SanPham" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 31/12/2019
  Time: 9:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>Result page</title>
</head>
<style>
    /*.result div:hover {*/
    /*    background: #04B0A0 none repeat scroll 0 0;*/
    /*}*/
</style>
<%
    SanPhamDaoIMP sanPhamDaoIMP= new SanPhamDaoIMP();
//    SanPham sp= sanPhamDaoIMP.getSingleProduct("name");
%>
<body>
<c:if test="${ketqua != null}">
    ${ketqua}
</c:if>
<c:if test="${ketqua==null}">
    <c:forEach items="${listSearch}" var="list">
        <a href="single-product.jsp?maSach=${list.maSach}">
            <div name="result" onMouseOver="this.style.background='#04B0A0'" onMouseOut="this.style.background='white'">
                    <%--            <%--%>
                    <%--                ArrayList<SanPham> arrSearch = (ArrayList<SanPham>) request.getAttribute("listSearch");--%>
                    <%--                for (SanPham sp: arrSearch) {--%>
                    <%--            %>--%>
                    <%--            <a href="single-product.jsp?maSach=<%=sp.getMaSach()%>" onMouseOver="this.style.color='#121212'">--%>
                    ${list.tenSach}
                </br>
                    <%--            </a>--%>
                    <%--            <%--%>
                    <%--                }--%>
                    <%--            %>--%>
            </div>
        </a>
    </c:forEach>
</c:if>
</body>
</html>
