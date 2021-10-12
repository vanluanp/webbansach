package controller;

import DB.ConnectionDB;
import Model.User;
import dao.TaiKhoanDaoIMP;
import tools.MaHoa;
import tools.SendMail;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

@WebServlet("/ForgetPasswordServlet")
public class ForgetPasswordServlet extends HttpServlet {
    TaiKhoanDaoIMP taiKhoanDaoIMP = new TaiKhoanDaoIMP();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        String emailPassword = request.getParameter("emailPassword");

        String err = "";
        if (emailPassword.equals("")) {
            err = "✖ Vui lòng nhập đủ thông tin!";
        }
        if (err.length() > 0) {
            request.setAttribute("err", err);
        }

        User user = taiKhoanDaoIMP.getTaiKhoanByUserName(emailPassword);
        if (err.length() == 0) {
//                if (taiKhoanDaoIMP.checkDangNhapAd(userName, MaHoa.maHoaMD5(password))) {
//            SendMail.sendMail(emailPassword, "Mật khẩu HB Bookstore", "Đây là mật khẩu cũ của bạn: " + user.getPassword());
            SendMail.sendMail(emailPassword, "Mật khẩu HB Bookstore", "Đây là mật khẩu cũ của bạn: " + user.getPassword());
            response.sendRedirect("login.jsp");
//                }
        } else {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/forgetpassword.jsp");
            rd.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}