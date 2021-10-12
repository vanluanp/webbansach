package dao;

import DB.ConnectionDB;
import Model.DanhMuc;
import Model.HoaDon;
import Model.NhaXuatBan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DanhMucDaoIMP implements DanhMucDao {
    @Override
    public ArrayList<DanhMuc> getList() {
        String sql = "SELECT * FROM `danhmuc` WHERE MaDanhMuc LIKE '__' ORDER BY MaDanhMuc DESC";
        ArrayList<DanhMuc> arr = new ArrayList<>();
        try {
            Connection connection = ConnectionDB.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DanhMuc dm = new DanhMuc();
                dm.setMaDanhMuc(rs.getString("MaDanhMuc"));
                dm.setTenDanhMuc(rs.getString("TenDanhMuc"));
                arr.add(dm);

            }
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
            Logger.getLogger(DanhMucDaoIMP.class.getName()).log(Level.SEVERE, null, e);
        }
        return arr;
    }
    public ArrayList<DanhMuc> getListAll() {
        String sql = "SELECT * FROM `danhmuc` ORDER BY MaDanhMuc DESC";
        ArrayList<DanhMuc> arr = new ArrayList<>();
        try {
            Connection connection = ConnectionDB.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DanhMuc dm = new DanhMuc();
                dm.setMaDanhMuc(rs.getString("MaDanhMuc"));
                dm.setTenDanhMuc(rs.getString("TenDanhMuc"));
                arr.add(dm);

            }
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
            Logger.getLogger(DanhMucDaoIMP.class.getName()).log(Level.SEVERE, null, e);
        }
        return arr;
    }
    public DanhMuc getSingle(String maDanhMuc) {
        String sql = "SELECT * FROM `danhmuc` where maDanhMuc = '"+maDanhMuc+"'";
        DanhMuc dm = new DanhMuc();
        try {
            Connection connection = ConnectionDB.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                dm.setMaDanhMuc(rs.getString("MaDanhMuc"));
                dm.setTenDanhMuc(rs.getString("TenDanhMuc"));
            }
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
            Logger.getLogger(DanhMucDaoIMP.class.getName()).log(Level.SEVERE, null, e);
        }
        return dm;
    }

    @Override
    public ArrayList<DanhMuc> getListCon(String maDanhMucCha) {
        String sql = "SELECT * FROM `danhmuc` WHERE MaDanhMuc LIKE '"+maDanhMucCha+"-%' ORDER BY MaDanhMuc DESC" ;
        ArrayList<DanhMuc> arr2 = new ArrayList<>();
        try {
            Connection connection = ConnectionDB.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DanhMuc dm = new DanhMuc();
                dm.setMaDanhMuc(rs.getString("MaDanhMuc"));
                dm.setTenDanhMuc(rs.getString("TenDanhMuc"));
                arr2.add(dm);

            }
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
            Logger.getLogger(DanhMucDaoIMP.class.getName()).log(Level.SEVERE, null, e);
        }
        return arr2;
    }

    @Override
    public ArrayList<NhaXuatBan> getListNXB() {
        String sql = "SELECT * FROM `nhaxuatban`";
        ArrayList<NhaXuatBan> arr = new ArrayList<>();
        try {
            Connection connection = ConnectionDB.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NhaXuatBan nxb= new NhaXuatBan();
                nxb.setMaNhaXuatBan(rs.getString("maNhaXuatBan"));
                nxb.setTenNhaXuatBan(rs.getString("tenNhaXuatBan"));
                arr.add(nxb);
            }
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
            Logger.getLogger(DanhMucDaoIMP.class.getName()).log(Level.SEVERE, null, e);
        }
        return arr;
    }

    @Override
    public int getNumListNXB(String maNXB) {
        String sql = "SELECT * FROM `sanpham` WHERE maNhaXuatBan = '"+maNXB+"'";
        int num=0;
        try {
            Connection connection = ConnectionDB.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                num++;
            }
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
            Logger.getLogger(DanhMucDaoIMP.class.getName()).log(Level.SEVERE, null, e);
        }
        return num;
    }

    @Override
    public NhaXuatBan getSingleNXB(String maNXB) {
        String sql = "SELECT * FROM `nhaxuatban` WHERE maNhaXuatBan= '"+maNXB+"'";
        NhaXuatBan nxb= new NhaXuatBan();
        try {
            Connection connection = ConnectionDB.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                nxb.setMaNhaXuatBan(rs.getString("maNhaXuatBan"));
                nxb.setTenNhaXuatBan(rs.getString("tenNhaXuatBan"));
            }
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
            Logger.getLogger(DanhMucDaoIMP.class.getName()).log(Level.SEVERE, null, e);
        }
        return nxb;
    }

    @Override
    public ArrayList<HoaDon> getListOrder() {
        String sql = "SELECT * FROM `hoadon` ";
        ArrayList<HoaDon> arr2 = new ArrayList<>();
        try {
            Connection connection = ConnectionDB.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HoaDon hd = new HoaDon();
                hd.setMaHoaDon(rs.getString("maHoaDon"));
                //                hd.setUser(taiKhoanDaoIMP.getTaiKhoan(userName));
                hd.setDiaChi(rs.getString("diaChi"));
                hd.setNgayMuaHang(rs.getTimestamp("ngayMuaHang"));
                hd.setStatus(rs.getInt("status"));
                arr2.add(hd);

            }
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
            Logger.getLogger(DanhMucDaoIMP.class.getName()).log(Level.SEVERE, null, e);
        }
        return arr2;
    }

    public ArrayList<DanhMuc> getListConAll() {
        String sql = "SELECT * FROM `danhmuc` WHERE MaDanhMuc LIKE '__-%' ORDER BY MaDanhMuc DESC" ;
        ArrayList<DanhMuc> arr2 = new ArrayList<>();
        try {
            Connection connection = ConnectionDB.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DanhMuc dm = new DanhMuc();
                dm.setMaDanhMuc(rs.getString("MaDanhMuc"));
                dm.setTenDanhMuc(rs.getString("TenDanhMuc"));
                arr2.add(dm);

            }
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
            Logger.getLogger(DanhMucDaoIMP.class.getName()).log(Level.SEVERE, null, e);
        }
        return arr2;
    }
}
