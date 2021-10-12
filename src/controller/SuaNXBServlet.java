package controller;

import DB.ConnectionDB;
import Model.DanhMuc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/SuaNXBServlet")
public class SuaNXBServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String maNhaXuatBan = request.getParameter("maNhaXuatBan");
        String tenNhaXuatBan = request.getParameter("tenNhaXuatBan");
        request.setAttribute("maNhaXuatBan", maNhaXuatBan);
        request.setAttribute("tenNhaXuatBan", tenNhaXuatBan);

        String err = "";
        if (maNhaXuatBan.equals("") || tenNhaXuatBan.equals("")) {
            err = "Vui lòng nhập đầy đủ thông tin!";
        }

        if (err.length() > 0) {
            request.setAttribute("err", err);
        }

        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client

        try {
            // connects to the database
            Connection connection = ConnectionDB.getConnection();

            // constructs SQL statement
            String sql = "UPDATE nhaxuatban SET tenNhaXuatBan=? where maNhaXuatBan=?";
            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setString(1, maSach);
            ps.setString(1, tenNhaXuatBan);
            ps.setString(2, maNhaXuatBan);
            if (err.length() == 0) {
                ps.executeUpdate();
            }


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
            if (err.length() == 0) {
                response.sendRedirect("admin/quanliNXB.jsp");
            } else {
                request.getRequestDispatcher("admin/suaNXB.jsp").forward(request, response);
            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}