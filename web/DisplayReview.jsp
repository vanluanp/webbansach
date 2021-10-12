<%@ page import="Model.Review" %>
<%@ page import="dao.ReviewDaoIMP" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 30/12/2019
  Time: 3:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>Display Review</title>


    <!-- Stylesheets -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/plugins.css">
    <link rel="stylesheet" href="style.css">

    <!-- Cusom css -->
    <link rel="stylesheet" href="css/custom.css">
</head>
<body>
<%--<%--%>
<%--    ArrayList<Review> arrayListReview = ReviewDao.getReview(request.getParameter("maSach"));--%>
<%--    for (Review re : arrayListReview--%>
<%--    ) {--%>
<%--%>--%>
<%--<p><%=re.getSubject()%>--%>
<%--</p>--%>
<%--<p><%=re.getReview()%>--%>
<%--</p>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>
<c:forEach items="${reviewSingle}" var="reviewSingle">
    <div class="f-review-container">
        <div class="fhs-review-title">
            <table>
                <tbody>
                <tr>
                    <td>
                        <h4>
                            <a href="#" style="float: left;">${reviewSingle.subject}</a>
                            <div class="rating-box">
                                <div class="rating" style="width:100%;"></div>
                            </div>
                        </h4>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="fhs-review-by-block">
            Nhận xét bởi <span class="fhs-review-by">${reviewSingle.userName}</span>,
            <small class="date">vào ngày ${reviewSingle.time}</small>

                <%--        <span><i class="fa fa-check" style="font-size:15px;color:green;"></i><span style="color:green">--%>
                <%--                                        Đã mua hàng                                    </span></span>--%>
        </div>
        <dd class="fhs-review-block-content">
            <p>${reviewSingle.review}</p>
                <%--        <div class="fhs-review-title">--%>
                <%--            <table>--%>
                <%--                <tbody>--%>
                <%--                <tr>--%>
                <%--                    <td>--%>
                <%--                                            <span id="review-fhs-114892" class="fhs-review-like-abuse"> &nbsp;--%>
                <%--                                                <span class="fhs_review-count-like">--%>
                <%--                                                    1 lượt thích.                                                </span>--%>
                <%--                                                <span>--%>
                <%--                                                                                                            <a id="reviewhelpful-114892"--%>
                <%--                                                                                                               onclick="reviewaction('114892', 'like')"--%>
                <%--                                                                                                               style="cursor: pointer">--%>
                <%--                                                               Thích                                                        </a>--%>
                <%--                                                        hoặc--%>
                <%--                                                        <a id="reviewabuse-114892"--%>
                <%--                                                           onclick="reviewaction('114892', 'abuse')"--%>
                <%--                                                           style="cursor: pointer">--%>
                <%--                                                               Báo cáo                                                        </a>--%>
                <%--                                                                                                        </span>--%>
                <%--                                            </span>--%>
                <%--                    </td>--%>
                <%--                </tr>--%>
                <%--                </tbody>--%>
                <%--            </table>--%>
                <%--        </div>--%>
            <div class="fhs_review-message">
            </div>
        </dd>

        <!-- Review rich snippets -->
            <%--    <script type="application/ld+json">--%>
            <%--        {--%>
            <%--            "@context": "http:\/\/schema.org\/",--%>
            <%--            "@type": "Review",--%>
            <%--            "author": "Yuki Neko",--%>
            <%--            "datePublished": "07\/07\/2019",--%>
            <%--            "description": "Tập này nhiều cặp đấu thật sự. Ban đầu là Sakura với Ino bất phân thắng bại. Sau đó là đến trận đấu kết thúc nhanh chóng giữa Temari làng lá và Tenten, trận chiến tiếp theo là giữa Shikamaru và ninja làng âm thanh Kin Tsuchi, tập này trình suy luận và IQ cao của Shikamaru đã được lên sóng tuy thể thuật và nhẫn thuật chỉ ở mức tạm đủ dùng, nhưng với chiến lược sắc bén cậu đã chiến thắng ngoạn mục. Không thể chờ đợi hơn là trận đấu giữa Naruto và Akamaru và Chiba, với sự nỗ lực chiến thắng Naruto đã tiếp thêm sức mạnh cho Hinata vào trận sau khi đấu với Neji. Coi khúc này bao lần mà mình vẫn khóc khi thấy Hinata kiên định với nhẫn đạo của mình quyết chứng yỏ bản thân trước Neji.",--%>
            <%--            "itemReviewed": {--%>
            <%--                "@type": "Thing",--%>
            <%--                "name": "Neji và Hinata"--%>
            <%--            },--%>
            <%--            "reviewRating": {--%>
            <%--                "@type": "Rating",--%>
            <%--                "bestRating": "100",--%>
            <%--                "ratingValue": "100",--%>
            <%--                "worstRating": "20"--%>
            <%--            }--%>
            <%--        }                        </script>--%>
    </div>
    <!-- End Review rich snippets -->
    <%--    <p>${reviewSingle.subject}</p>--%>
    <%--    <p>${reviewSingle.review}</p>--%>
</c:forEach>
</body>
</html>
