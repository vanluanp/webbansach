package controller;

import DB.ConnectionDB;
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
import java.sql.SQLException;

@WebServlet("/CapNhatTKServlet")
public class CapNhatTKServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String phone = request.getParameter("phone");
        String name = request.getParameter("name");
        String userName= (String) session.getAttribute("userName");


        String err = "";
        if (name.equals("") ||phone.equals("")) {
            err = "✖ Vui lòng nhập đủ thông tin!";
        }
        if (err.length() > 0) {
            request.setAttribute("err", err);
        }

        try {
            Connection connection = ConnectionDB.getConnection();
            String sql = "UPDATE taikhoan SET tenTK=?, phone=? where tenDangNhap=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, userName);
            if (err.length()==0) {
//                if (taiKhoanDaoIMP.checkDangNhapAd(userName, MaHoa.maHoaMD5(password))) {
                ps.executeUpdate();
                response.sendRedirect("index.jsp");
//                }
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/updateaccount.jsp");
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