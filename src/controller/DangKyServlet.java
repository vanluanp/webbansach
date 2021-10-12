package controller;

import Model.User;
import dao.TaiKhoanDaoIMP;
import tools.MaHoa;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.util.Date;

@WebServlet("/DangKyServlet")
public class DangKyServlet extends HttpServlet {
    private TaiKhoanDaoIMP taiKhoanDaoIMP = new TaiKhoanDaoIMP();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        String userName = request.getParameter("userName");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String repass = request.getParameter("repass");
        String check = request.getParameter("checkRule");

        String name_err = "", userName_err = "", phone_err = "", password_err = "", repass_err = "", check_err = "";
        if (name.equals("")) {
            name_err = "Vui lòng nhập tên!";
        }
        if (name_err.length() > 0) {
            request.setAttribute("name_err", name_err);
        }
        if (userName.equals("")) {
            userName_err = "Vui lòng nhập email!";
        }
        if (userName_err.length() > 0) {
            request.setAttribute("userName_err", userName_err);
        } else {
            if (taiKhoanDaoIMP.kiemTraTaiKhoan(userName) == true) {
                userName_err = "Địa chỉ đã được đăng ký!";
                request.setAttribute("userName_err", userName_err);
            }
        }
        if (phone.equals("")) {
            phone_err = "Vui lòng nhập số điện thoại!";
        }
        if (phone_err.length() > 0) {
            request.setAttribute("phone_err", phone_err);
        }
        if (password.equals("")) {
            password_err = "Vui lòng nhập mật khẩu!";
        }
        if (password_err.length() > 0) {
            request.setAttribute("password_err", password_err);
        }
        if (repass.equals("")) {
            repass_err = "Vui lòng xác nhận lại mật khẩu!";
        }
        if (!repass.equals(password)) {
            repass_err = "Vui lòng nhập trùng mật khẩu!";
        }
        if (repass_err.length() > 0) {
            request.setAttribute("repass_err", repass_err);
        }
        if (check == null) {
            check_err = "Vui lòng chọn đồng ý!";
        }
        if (check_err.length() > 0) {
            request.setAttribute("check-err", check_err);
        }
        request.setAttribute("name", name);
        request.setAttribute("userName", userName);
        request.setAttribute("phone", phone);
        request.setAttribute("password", password);
        request.setAttribute("repass", repass);
        String url = "/register.jsp";
        try {
            if (password_err.length() == 0 && repass_err.length() == 0 && userName_err.length() == 0 && name_err.length() == 0 && phone_err.length() == 0 && check_err.length() == 0) {
                Date id = new Date();
                User user = new User("" + id.getTime(), name, userName, MaHoa.maHoaMD5(password), 2, 1, phone);
                taiKhoanDaoIMP.themTaiKhoan(user);
                url = "/index.jsp";
            } else {
                url = "/register.jsp";
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
//            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}