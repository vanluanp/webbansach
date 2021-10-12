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

@WebServlet("/SuaSPServlet")
public class SuaSPServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        DanhMuc dm= new DanhMuc();
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
        String maLoaiSach = request.getParameter("maLoaiSach");
//        int soLuongBan = Integer.parseInt(request.getParameter("soLuongBan"));
//        String maDanhMuc = request.getParameter("maDanhMuc");
//        dm.setMaDanhMuc(maDanhMuc);


        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client

        try {
            // connects to the database
            Connection connection = ConnectionDB.getConnection();

            // constructs SQL statement
            String sql = "UPDATE sanpham SET tenSach=?, tacGia=?, maNhaXuatBan=?, moTa=?, chiTietMoTa=?, hinh1=?, hinh2=?, giaGoc=?, giaKhuyenMai=?, soLuongNhap=?, soLuongBan=?, maDanhMuc=? WHERE maSach = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setString(1, maSach);
            ps.setString(1, tenSach);
            ps.setString(2, tacGia);
            ps.setString(3, maNhaXuatBan);
            ps.setString(4, moTa);
            ps.setString(5, chiTietMoTa);
            ps.setString(6, hinhAnh1);
            ps.setString(7, hinhAnh2);
//            ps.setString(6, hinhAnh2);
            ps.setDouble(8, giaGoc);
            ps.setDouble(9, giaKhuyenMai);
            ps.setInt(10, soLuongNhap);
            ps.setInt(11, soLuongBan);
            ps.setString(12, maLoaiSach);
            ps.setString(13, maSach);
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