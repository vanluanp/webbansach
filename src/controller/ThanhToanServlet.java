package controller;

import Model.*;
import dao.ChiTietHoaDonDAOIMP;
import dao.HoaDonDAOIMP;
import dao.TaiKhoanDaoIMP;
import tools.SendMail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

@WebServlet("/ThanhToanServlet")
public class ThanhToanServlet extends HttpServlet {
    private HoaDonDAOIMP hoaDonDAOIMP = new HoaDonDAOIMP();
    private ChiTietHoaDonDAOIMP chiTietHoaDonDAOIMP = new ChiTietHoaDonDAOIMP();
    private TaiKhoanDaoIMP taiKhoanDaoIMP = new TaiKhoanDaoIMP();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String mail = request.getParameter("mail");
        String tinh = request.getParameter("tinh");
        String huyen = request.getParameter("huyen");
        String xa = request.getParameter("xa");
        String diachi = request.getParameter("diachi");
        String giaohang = request.getParameter("giaohang");
        String thanhtoan = request.getParameter("thanhtoan");
        double tongtien = (double) session.getAttribute("tong");

        String diaChiGiaoHang = name + "\n, SDT: " + phone + "\n, Số nhà: " + diachi + ", xã/phường: " + xa + ", quận/huyện: " + huyen + ", TP: " + tinh;
        String userName = (String) session.getAttribute("userName");

        GioHang cart = (GioHang) session.getAttribute("cart");
        try {
            Date date = new Date();
            String mhd = "" + date.getTime();
            User u = new User();
            u.setMaTK(taiKhoanDaoIMP.getTaiKhoanByUserName(userName).getMaTK());
            HoaDon hd = new HoaDon(mhd, u, diaChiGiaoHang, thanhtoan, giaohang, new Timestamp((new Date().getTime())), 0, tongtien);
            hd.setMaHoaDon(mhd);
            hd.setUser(taiKhoanDaoIMP.getTaiKhoanByUserName(userName));
            hoaDonDAOIMP.themHoaDon(hd);
            HashMap<String, Item> list = cart.getItemsCart();
            int macthd = 0;
            for (Map.Entry<String, Item> ds : list.entrySet()) {
                SanPham sp = new SanPham();
                sp.setMaSach((ds.getValue().getSanPham().getMaSach()));
                sp.setTenSach(ds.getValue().getSanPham().getTenSach());
                macthd ++;
                chiTietHoaDonDAOIMP.themCTHD(new ChiTietHoaDon(Math.abs(macthd), hd, sp, ds.getValue().getSoLuong(), ds.getValue().getSanPham().getGiaGoc(), ds.getValue().getSanPham().getGiaKhuyenMai()));
            }
//            User user = taiKhoanDaoIMP.getTaiKhoanByUserName(emailPassword);
            SendMail.sendMail(userName, "Đặt hàng tại H&B thành công", "Cảm ơn đã mua hàng tại H&B Bookstore. Click vào link bên dưới để tiến hành giao hàng\n" +
                    "http://localhost:8000/PJ/billinfo.jsp?status=gh&maHoaDon="+mhd);
            response.sendRedirect("bill.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}