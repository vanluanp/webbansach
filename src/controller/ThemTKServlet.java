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

@WebServlet("/ThemTKServlet")
public class ThemTKServlet extends HttpServlet {
    TaiKhoanDaoIMP taiKhoanDaoIMP = new TaiKhoanDaoIMP();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String quyen = request.getParameter("quyen");
        String status = request.getParameter("status");
        String phone = request.getParameter("phone");
        String regex_email = "^[A-Za-z0-9]+([_\\.\\-]?[A-Za-z0-9])*@[A-Za-z0-9]+([\\.\\-]?[A-Za-z0-9]+)*(\\.[A-Za-z]+)+$";
        String regex_password = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\\$%\\^&\\*]).{8,}$";
        String regex_phone = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";

//        String name_err = "", userName_err = "", phone_err = "", password_err = "", repass_err = "", check_err="";
//        if (name.equals("")) {
//            name_err = "Vui lòng nhập tên!";
//        }
//        if (name_err.length() > 0) {
//            request.setAttribute("name_err", name_err);
//        }
//        if (userName.equals("")) {
//            userName_err = "Vui lòng nhập email!";
//        }
//        if (userName_err.length() > 0) {
//            request.setAttribute("userName_err", userName_err);
//        } else {
//            if (taiKhoanDaoIMP.kiemTraTaiKhoan(userName) == true) {
//                userName_err = "Địa chỉ đã được đăng ký!";
//                request.setAttribute("userName_err", userName_err);
//            }
//        }
//        if (phone.equals("")) {
//            phone_err = "Vui lòng nhập số điện thoại!";
//        }
//        if (phone_err.length() > 0) {
//            request.setAttribute("phone_err", phone_err);
//        }
//        if (password.equals("")) {
//            password_err = "Vui lòng nhập mật khẩu!";
//        }
//        if (password_err.length() > 0) {
//            request.setAttribute("password_err", password_err);
//        }
//        if (repassword.equals("")) {
//            repass_err = "Vui lòng xác nhận lại mật khẩu!";
//        }
        String err = "";
        if (name.equals("") ||phone.equals("")||password.equals("")||userName.equals("")||repassword.equals("")) {
            err = "✖ Vui lòng nhập đủ thông tin!";
        }
        if (err.length() > 0) {
            request.setAttribute("err", err);
        }
        if (taiKhoanDaoIMP.kiemTraTaiKhoan(userName) == true) {
            err = "Địa chỉ đã được đăng ký!";
            request.setAttribute("err", err);
        }

        request.setAttribute("name", name);
//        request.setAttribute("userName", userName);
        request.setAttribute("phone", phone);
        request.setAttribute("quyen", quyen);
        request.setAttribute("status", status);


        if(!repassword.equals(password)){
            err = "Vui lòng nhập trùng mật khẩu!";
        }
        if (err.length() > 0) {
            request.setAttribute("err", err);
        }
        request.setAttribute("name", name);
        request.setAttribute("userName", userName);
        request.setAttribute("phone", phone);

        try{
            Connection connection = ConnectionDB.getConnection();
            String sql= "INSERT INTO taikhoan (maTaiKhoan, tenTK, tenDangNhap, matKhau, quyentruycap, status, phone) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            Date id= new Date();
            ps.setString(1,""+id.getTime());
            ps.setString(2,name);
            ps.setString(3,userName);
            ps.setString(4, MaHoa.maHoaMD5(password));
            ps.setString(5,quyen);
            ps.setString(6,status);
            ps.setString(7,phone);
            if(err.length() == 0){
                ps.executeUpdate();
                response.sendRedirect("admin/quanlitaikhoan.jsp");
            }
            else{
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/themtaikhoan.jsp");
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