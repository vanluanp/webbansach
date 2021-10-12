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
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/SuaTKServlet")
public class SuaTKServlet extends HttpServlet {
    TaiKhoanDaoIMP taiKhoanDaoIMP = new TaiKhoanDaoIMP();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String maTK = request.getParameter("maTK");
        String name = request.getParameter("name");
//        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String quyen = request.getParameter("quyen");
        String status = request.getParameter("status");
        String phone = request.getParameter("phone");

        String err = "";
        if (name.equals("") ||phone.equals("")||password.equals("")) {
            err = "✖ Vui lòng nhập đủ thông tin!";
        }
        if (err.length() > 0) {
            request.setAttribute("err", err);
        }
//        if (taiKhoanDaoIMP.kiemTraTaiKhoan(userName) == true) {
//            err = "Địa chỉ đã được đăng ký!";
//            request.setAttribute("err", err);
//        }

        request.setAttribute("name", name);
//        request.setAttribute("userName", userName);
        request.setAttribute("phone", phone);
        request.setAttribute("quyen", quyen);
        request.setAttribute("status", status);


        try {
            Connection connection = ConnectionDB.getConnection();
            String sql = "UPDATE taikhoan SET tenTK=?, matKhau=?, quyentruycap=?, status=?, phone=? where maTaiKhoan=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, MaHoa.maHoaMD5(password));
            ps.setString(3, quyen);
            ps.setString(4, status);
            ps.setString(5, phone);
            ps.setString(6, maTK);
            if (err.length()==0) {
//                if (taiKhoanDaoIMP.checkDangNhapAd(userName, MaHoa.maHoaMD5(password))) {
                    ps.executeUpdate();
                    response.sendRedirect("admin/quanlitaikhoan.jsp");
//                }
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/suataikhoan.jsp");
                rd.forward(request, response);
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}