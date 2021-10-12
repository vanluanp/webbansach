package controller;

import DB.ConnectionDB;
import dao.TaiKhoanDaoIMP;
import tools.MaHoa;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/ChangPasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private TaiKhoanDaoIMP taiKhoanDaoIMP = new TaiKhoanDaoIMP();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String newPassword = request.getParameter("newPassword");
        String reNewPassword = request.getParameter("reNewPassword");
        String url = "";

        String password_err = "", repass_err = "";
        if (newPassword.equals("")) {
            password_err = "Vui lòng nhập mật khẩu!";
        }
        if (password_err.length() > 0) {
            request.setAttribute("password_err", password_err);
        }
        if (reNewPassword.equals("")) {
            repass_err = "Vui lòng xác nhập lại mật khẩu!";
        }
        if (!reNewPassword.equals(newPassword)) {
            repass_err = "Vui lòng nhập trùng mật khẩu!";
        }
        if (repass_err.length() > 0) {
            request.setAttribute("repass_err", repass_err);
        }

        try {
            HttpSession session = request.getSession();
            String userName = (String) session.getAttribute("userName");
            String password = (String) session.getAttribute("password");
            if ((taiKhoanDaoIMP.checkDangNhap(userName, MaHoa.maHoaMD5(password)) || taiKhoanDaoIMP.checkDangNhapAd(userName, MaHoa.maHoaMD5(password))
                    || taiKhoanDaoIMP.checkDangNhapStaff(userName, MaHoa.maHoaMD5(password))) && (password_err.length() == 0 && repass_err.length() == 0)) {
                Connection connection = ConnectionDB.getConnection();
                String sql = "UPDATE taikhoan SET matKhau=? where tenDangNhap=?";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(1, MaHoa.maHoaMD5(newPassword));
                ps.setString(2, userName);
                ps.executeUpdate();
                url = "/index.jsp";
            } else {
                url = "/changepassword.jsp";
            }

            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}