package controller;

import Model.SanPham;
import dao.SanPhamDaoIMP;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
        HttpSession session = request.getSession();
        SanPhamDaoIMP sanPhamDaoIMP= new SanPhamDaoIMP();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        try {

            ArrayList<SanPham> list = sanPhamDaoIMP.searchByName(request, name);

            request.setAttribute("listSearch", list);
            RequestDispatcher rd = request.getRequestDispatcher("/Result.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}