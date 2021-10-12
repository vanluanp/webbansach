package controller;

import DB.ConnectionDB;
import Model.DanhMuc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/ThemSPServlet")
public class ThemSPServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String maSach = request.getParameter("maSach");
        String tenSach = request.getParameter("tenSach");
        String tacGia = request.getParameter("tacGia");
        String maNhaXuatBan = request.getParameter("maNhaXuatBan");
        String moTa = request.getParameter("moTa");
        String chiTietMoTa = request.getParameter("chiTietMoTa");
        String hinhAnh1 = "images/books/"+request.getParameter("hinhAnh1");
        String hinhAnh2 = request.getParameter("hinhAnh2");
        double giaGoc = Double.parseDouble(request.getParameter("giaGoc"));
        double giaKhuyenMai = Double.parseDouble(request.getParameter("giaKhuyenMai"));
        int soLuongNhap = Integer.parseInt(request.getParameter("soLuongNhap"));
        int soLuongBan = Integer.parseInt(request.getParameter("soLuongBan"));
        String maDanhMuc = request.getParameter("maDanhMuc");
//        DanhMuc dm= new DanhMuc();
//        dm.setMaDanhMuc(maDanhMuc);


        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client

        try {
            // connects to the database
            Connection connection = ConnectionDB.getConnection();

            // constructs SQL statement
            String sql = "INSERT INTO sanpham (maSach, tenSach, tacGia, maNhaXuatBan, moTa, chiTietMoTa, hinh1, hinh2, giaGoc, giaKhuyenMai, soLuongNhap, soLuongBan, maDanhMuc) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, maSach);
            ps.setString(2, tenSach);
            ps.setString(3, tacGia);
            ps.setString(4, maNhaXuatBan);
            ps.setString(5, moTa);
            ps.setString(6, chiTietMoTa);
            ps.setString(7, hinhAnh1);
            ps.setString(8, hinhAnh2);
//            ps.setString(6, hinhAnh2);
            ps.setDouble(9, giaGoc);
            ps.setDouble(10, giaKhuyenMai);
            ps.setInt(11, soLuongNhap);
            ps.setInt(12, soLuongBan);
            ps.setString(13, maDanhMuc);
            ps.executeUpdate();


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);

            // forwards to the message page
//            getServletContext().getRequestDispatcher("/admin/quanlisanpham.jsp").forward(request, response);
            response.sendRedirect("admin/quanlisanpham.jsp");
        }

    }
}