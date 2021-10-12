package controller;

import Model.Review;
import dao.ReviewDaoIMP;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
    ReviewDaoIMP reviewDaoIMP = new ReviewDaoIMP();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String subject = request.getParameter("subject");
        String review = request.getParameter("review");
        String maSach = request.getParameter("maSach");
        try {
            Timestamp time = new Timestamp((new Date().getTime()));
            Review rev = new Review();
//            int i = 1;
            Date id = new Date();
            String maNhanXet = "" + id.getTime();
            rev.setMaNhanXet(maNhanXet);
            rev.setMaSach(maSach);
            String userName = (String) session.getAttribute("userName");
            rev.setUserName(userName);
            rev.setTime(time);
            rev.setSubject(subject);
            rev.setReview(review);

            reviewDaoIMP.insertReview(rev);

            ArrayList<Review> reviewSingle = reviewDaoIMP.getReview(maSach);

            request.setAttribute("reviewSingle", reviewSingle);

            RequestDispatcher rd = request.getRequestDispatcher("/DisplayReview.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}