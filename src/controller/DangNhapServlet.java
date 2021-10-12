package controller;

import dao.TaiKhoanDao;
import dao.TaiKhoanDaoIMP;
import tools.MaHoa;
import tools.RegexMatches;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/DangNhapServlet")
public class DangNhapServlet extends HttpServlet {
    private TaiKhoanDaoIMP taiKhoanDaoIMP = new TaiKhoanDaoIMP();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        //
        request.setAttribute("userName", userName);
        String err = "";
        if (userName.equals("") || password.equals("")) {
            err = "Vui lòng nhập đầy đủ thông tin!";
        } else {
            if (taiKhoanDaoIMP.checkDangNhap(userName, MaHoa.maHoaMD5(password)) == false && taiKhoanDaoIMP.checkDangNhapAd(userName, MaHoa.maHoaMD5(password)) == false && taiKhoanDaoIMP.checkDangNhapStaff(userName, MaHoa.maHoaMD5(password)) == false) {
                err = "Email hoặc mật khẩu không đúng!";
            }
        }

        if (err.length() > 0) {
            request.setAttribute("err", err);
        }
        String url = "/login.jsp";
        try {
            if (err.length() == 0) {
                HttpSession session = request.getSession();
                session.setAttribute("userName", userName);
                session.setAttribute("password", password);
                if (taiKhoanDaoIMP.checkDangNhap(userName, MaHoa.maHoaMD5(password))) {
                    url = "/index.jsp";
                    session.setAttribute("mode", "none");
                    session.setAttribute("modeUser", "block");
                    session.setAttribute("modeMain", "block");
                    session.setAttribute("modeHidden", "none");
                } else {
                    if (taiKhoanDaoIMP.checkDangNhapAd(userName, MaHoa.maHoaMD5(password)) || taiKhoanDaoIMP.checkDangNhapStaff(userName, MaHoa.maHoaMD5(password))) {
//                        response.sendRedirect("admin/trangchu.jsp");
                        url = "/index.jsp";
                        session.setAttribute("mode", "block");
                        session.setAttribute("modeHidden", "none");
                        session.setAttribute("modeMain", "block");
                    }
                }
            } else {
                url = "/login.jsp";
            }

            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("command").equals("logout")) {
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("index.jsp");
        }
    }
}