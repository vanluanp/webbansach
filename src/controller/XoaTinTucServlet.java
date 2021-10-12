package controller;

import DB.ConnectionDB;
import dao.TinTucDaoIMP;
import tools.MaHoa;

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

@WebServlet("/XoaTinTucServlet")
public class XoaTinTucServlet extends HttpServlet {
    TinTucDaoIMP tinTucDaoIMP = new TinTucDaoIMP();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String maTinTuc = request.getParameter("maTinTuc");

        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client

        try {
            Connection connection = ConnectionDB.getConnection();
            String sql = "DELETE FROM tintuc WHERE maTinTuc = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, maTinTuc);
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
            response.sendRedirect("admin/quanlitintuc.jsp");
        }
    }
}