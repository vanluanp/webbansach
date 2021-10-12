package controller;

import DB.ConnectionDB;
import dao.TinTucDaoIMP;
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
import java.sql.Timestamp;
import java.util.Date;

@WebServlet("/SuaTinTucServlet")
public class SuaTinTucServlet extends HttpServlet {
    TinTucDaoIMP tinTucDaoIMP= new TinTucDaoIMP();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String title = request.getParameter("tieude");
        String news = request.getParameter("news");
        String maTinTuc= request.getParameter("maTinTuc");
        String err = "";
//        if (title.equals("") ||news.equals("")) {
//            err = "✖ Vui lòng nhập đủ thông tin!";
//        }
        if (err.length() > 0) {
            request.setAttribute("err", err);
        }
        try{
            Connection connection = ConnectionDB.getConnection();
            String sql = "UPDATE tintuc SET tieuDe=?, time=?, noiDung=? where maTinTuc=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            Date id= new Date();
            ps.setTimestamp(2, new Timestamp(id.getTime()));
            ps.setString(3, news);
            ps.setString(4, maTinTuc);
            if(err.length() == 0){
                ps.executeUpdate();
                response.sendRedirect("admin/quanlitintuc.jsp");
            }
            else{
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/suatintuc.jsp");
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