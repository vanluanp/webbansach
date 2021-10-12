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

@WebServlet("/XoaNXBServlet")
public class XoaNXBServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String maNhaXuatBan = request.getParameter("maNhaXuatBan");

        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client

        try {
            // connects to the database
            Connection connection = ConnectionDB.getConnection();

            // constructs SQL statement
            String sql = "DELETE FROM nhaxuatban WHERE maNhaXuatBan = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, maNhaXuatBan);
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
            response.sendRedirect("admin/quanliNXB.jsp");
        }
    }
}