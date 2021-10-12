package dao;

import DB.ConnectionDB;
import Model.HoaDon;
import Model.User;
import tools.MaHoa;

import javax.servlet.RequestDispatcher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class HoaDonDAOIMP implements HoaDonDAO {
    @Override
    public void themHoaDon(HoaDon hd) {
        String sql = "INSERT INTO `hoadon` VALUE (?,?,?,?,?,?,?,?)";
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, hd.getMaHoaDon());
            ps.setString(2, hd.getUser().getMaTK());
            ps.setString(3, hd.getDiaChi());
            ps.setString(4, hd.getPhuongThucThanhToan());
            ps.setTimestamp(5, hd.getNgayMuaHang());
            ps.setInt(6, hd.getStatus());
            ps.setString(7, hd.getPhuongThucGiaoHang());
            ps.setDouble(8, hd.getTongtien());
            ps.executeUpdate();
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public ArrayList<HoaDon> getHoaDon(String maTK) {
        String sql = "SELECT * FROM `hoadon` where maTaiKhoan ='" + maTK + "'";
        ArrayList<HoaDon> list = new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HoaDon hoaDon = new HoaDon();
                hoaDon.setMaHoaDon(rs.getString("maHoaDon"));
                hoaDon.setDiaChi(rs.getString("diaChi"));
                hoaDon.setPhuongThucThanhToan(rs.getString("phuongThucThanhToan"));
                hoaDon.setNgayMuaHang(rs.getTimestamp("ngayMuaHang"));
                hoaDon.setStatus(rs.getInt("status"));
                hoaDon.setPhuongThucGiaoHang(rs.getString("phuongThucGiaoHang"));
                hoaDon.setTongtien(rs.getDouble("tongtien"));
                list.add(hoaDon);
            }
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public HoaDon getHoaDonSingle(String maHD) {
        String sql = "SELECT * FROM `hoadon` WHERE maHoaDon= '" + maHD + "'";
        HoaDon hoaDon = new HoaDon();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                hoaDon.setMaHoaDon(rs.getString("maHoaDon"));
                hoaDon.setDiaChi(rs.getString("diaChi"));
                hoaDon.setPhuongThucThanhToan(rs.getString("phuongThucThanhToan"));
                hoaDon.setNgayMuaHang(rs.getTimestamp("ngayMuaHang"));
                hoaDon.setStatus(rs.getInt("status"));
                hoaDon.setPhuongThucGiaoHang(rs.getString("phuongThucGiaoHang"));
                hoaDon.setTongtien(rs.getDouble("tongtien"));
            }
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
        return hoaDon;
    }

    @Override
    public void setStatus(String maHD, int status) {

        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client

        try {
            Connection connection = ConnectionDB.getConnection();
            String sql = "UPDATE hoadon SET status=? where maHoaDon=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setString(2, maHD);
            ps.executeUpdate();
            connection.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
