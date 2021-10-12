package dao;

import DB.ConnectionDB;
import Model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TaiKhoanDaoIMP implements TaiKhoanDao {

    @Override
    public boolean kiemTraTaiKhoan(String userName) {
        String sql = "SELECT * FROM `taikhoan` WHERE tenDangNhap= '" + userName + "'";
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public void themTaiKhoan(User user) {
        String sql = "INSERT INTO `taikhoan` VALUE (?,?,?,?,?,?,?)";
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, user.getMaTK());
            ps.setString(2, user.getName());
            ps.setString(3, user.getUserName());
            ps.setString(4, user.getPassword());
            ps.setInt(5, user.getQuyen());
            ps.setInt(6, user.getStatus());
            ps.setString(7, user.getPhone());
            ps.executeUpdate();
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public boolean checkDangNhap(String userName, String password) {
        String sql = "SELECT * FROM `taikhoan` WHERE tenDangNhap= '" + userName + "' and matKhau= '" + password + "' and quyentruycap =2 and status=1";
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    @Override
    public boolean checkDangNhapAd(String userName, String password) {
        String sql = "SELECT * FROM `taikhoan` WHERE tenDangNhap= '" + userName + "' and matKhau= '" + password + "' and quyentruycap =0 and status=1";
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean checkDangNhapStaff(String userName, String password) {
        String sql = "SELECT * FROM `taikhoan` WHERE tenDangNhap= '" + userName + "' and matKhau= '" + password + "' and quyentruycap =1 and status=1";
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public User getTaiKhoan(String maTK) {
        String sql = "SELECT * FROM `taikhoan` WHERE maTaiKhoan= '" + maTK + "'";
        User user= new User();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user.setMaTK(rs.getString("maTaiKhoan"));
                user.setName(rs.getString("tenTK"));
                user.setUserName(rs.getString("tenDangNhap"));
                user.setPassword(rs.getString("matKhau"));
                user.setQuyen(Integer.parseInt(rs.getString("quyentruycap")));
                user.setStatus(Integer.parseInt(rs.getString("status")));
                user.setPhone(rs.getString("phone"));
            }
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    @Override
    public User getTaiKhoanByUserName(String userName) {
        String sql = "SELECT * FROM `taikhoan` WHERE tenDangNhap= '" + userName + "'";
        User user= new User();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user.setMaTK(rs.getString("maTaiKhoan"));
                user.setName(rs.getString("tenTK"));
                user.setUserName(rs.getString("tenDangNhap"));
                user.setPassword(rs.getString("matKhau"));
                user.setQuyen(Integer.parseInt(rs.getString("quyentruycap")));
                user.setStatus(Integer.parseInt(rs.getString("status")));
                user.setPhone(rs.getString("phone"));
            }
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    @Override
    public ArrayList<User> getListTaiKhoan() {
        String sql = "SELECT * FROM `taikhoan` ";
        ArrayList<User> list= new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user= new User();
                user.setMaTK(rs.getString("maTaiKhoan"));
                user.setName(rs.getString("tenTK"));
                user.setUserName(rs.getString("tenDangNhap"));
                user.setPassword(rs.getString("matKhau"));
                user.setQuyen(rs.getInt("quyentruycap"));
                user.setStatus(rs.getInt("status"));
                list.add(user);
            }
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
