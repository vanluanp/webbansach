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

@WebServlet("/ThemTinTucServlet")
public class ThemTinTucServlet extends HttpServlet {
    TinTucDaoIMP tinTucDaoIMP= new TinTucDaoIMP();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String title = request.getParameter("title");
        String news = request.getParameter("news");
        String err = "";
//        if (title.equals("") ||news.equals("")) {
//            err = "✖ Vui lòng nhập đủ thông tin!";
//        }
        if (err.length() > 0) {
            request.setAttribute("err", err);
        }
        try{
            Connection connection = ConnectionDB.getConnection();
            String sql= "INSERT INTO tintuc VALUES (?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            Date id= new Date();
            ps.setString(1,""+id.getTime());
            ps.setString(2,title);
            ps.setTimestamp(3,new Timestamp((id.getTime())));
            ps.setString(4, news);
            if(err.length() == 0){
                ps.executeUpdate();
                response.sendRedirect("admin/quanlitintuc.jsp");
            }
            else{
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/themtintuc.jsp");
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