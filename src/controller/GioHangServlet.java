package controller;

import Model.GioHang;
import Model.Item;
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

@WebServlet("/GioHangServlet")
public class GioHangServlet extends HttpServlet {
    private final SanPhamDaoIMP sanPhamDaoIMP = new SanPhamDaoIMP();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String msp = request.getParameter("maSach");
        String command = request.getParameter("command");
        GioHang cart = (GioHang) session.getAttribute("cart");
        String url="/cart.jsp";
        try {
            SanPham sp = sanPhamDaoIMP.getSingleProduct(msp);
            switch (command) {
                case "plus":
                    if (cart.getItemsCart().containsKey(msp)) {
                        cart.plusToCart(msp, new Item(sp, cart.getItemsCart().get(msp).getSoLuong()));
                    } else {
                        cart.plusToCart(msp, new Item(sp, 1));
                    }
                    url="/cart.jsp";
                    break;
                case "plus2":
                    if (cart.getItemsCart().containsKey(msp)) {
                        cart.plusToCart(msp, new Item(sp, cart.getItemsCart().get(msp).getSoLuong()));
                    } else {
                        cart.plusToCart(msp, new Item(sp, 1));
                    }
                    url="/header.jsp";
                    break;
                case "remove":
                    if (cart.getItemsCart().containsKey(msp)) {
                        cart.removeToCart(msp);
                    }
                    url="/cart.jsp";
                    break;
                case "sub":
                    if (cart.getItemsCart().containsKey(msp)) {
                        cart.subToCart(msp, new Item(sp, cart.getItemsCart().get(msp).getSoLuong()));
                    }
//                    else {
//                        cart.subToCart(msp, new Item(sp, 1));
//                    }
                    url="/cart.jsp";
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
//            request.getRequestDispatcher("index.jsp").forward(request, response);
//            response.sendRedirect("index.jsp");
            RequestDispatcher rd= getServletContext().getRequestDispatcher(url);
            rd.forward(request,response);
        }
        session.setAttribute("cart", cart);
//        request.getRequestDispatcher("index.jsp").forward(request, response);
//        response.sendRedirect("index.jsp");
        RequestDispatcher rd= getServletContext().getRequestDispatcher(url);
        rd.forward(request,response);
    }

}