package dao;

import DB.ConnectionDB;
import Model.ChiTietHoaDon;
import Model.HoaDon;
import Model.SanPham;
import Model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ChiTietHoaDonDAOIMP implements ChiTietHoaDonDAO {
    @Override
    public void themCTHD(ChiTietHoaDon cthd) {
        String sql = "INSERT INTO `chitiethoadon` VALUE (?,?,?,?,?,?,?)";
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setInt(1, cthd.getMaCTHD());
            ps.setString(2, cthd.getHoaDon().getMaHoaDon());
            ps.setString(3, cthd.getSanPham().getMaSach());
            ps.setString(4, cthd.getSanPham().getTenSach());
            ps.setInt(5, cthd.getSoLuong());
            ps.setDouble(6, cthd.getDonGia());
            ps.setDouble(7, cthd.getGiamGia());
            ps.executeUpdate();
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public ArrayList<ChiTietHoaDon> getCTHD(String maHD) {
        String sql = "SELECT * FROM `chitiethoadon` where maHoaDon = '"+maHD+"'" ;
        ArrayList<ChiTietHoaDon> list= new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ChiTietHoaDon chiTietHoaDon= new ChiTietHoaDon();
                HoaDon hoaDon = new HoaDon();
                hoaDon.setMaHoaDon(rs.getString("maHoaDon"));
                chiTietHoaDon.setHoaDon(hoaDon);
                SanPham sanPham= new SanPham();
                sanPham.setMaSach(rs.getString("maSanPham"));
                sanPham.setTenSach(rs.getString("tenSanPham"));
                chiTietHoaDon.setSanPham(sanPham);
                chiTietHoaDon.setSoLuong(rs.getInt("soLuong"));
                chiTietHoaDon.setDonGia(rs.getDouble("donGia"));
                chiTietHoaDon.setGiamGia(rs.getDouble("giamGia"));
                list.add(chiTietHoaDon);
            }
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
