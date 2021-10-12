package dao;

import DB.ConnectionDB;
import Model.TinTuc;
import Model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TinTucDaoIMP implements TinTucDao{

    @Override
    public void themTinTuc(TinTuc tinTuc) {
        String sql = "INSERT INTO `tintuc` VALUE (?,?,?,?)";
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, tinTuc.getMaTinTuc());
            ps.setString(2, tinTuc.getTieuDe());
            ps.setTimestamp(3, tinTuc.getTime());
            ps.setString(4, tinTuc.getNoiDung());
            ps.executeUpdate();
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public ArrayList<TinTuc> getListTinTuc() {
        String sql = "SELECT * FROM `tintuc` ";
        ArrayList<TinTuc> list= new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TinTuc tinTuc= new TinTuc();
                tinTuc.setMaTinTuc(rs.getString("maTinTuc"));
                tinTuc.setTieuDe(rs.getString("tieuDe"));
                tinTuc.setNoiDung(rs.getString("noiDung"));
                tinTuc.setTime(rs.getTimestamp("time"));
                list.add(tinTuc);
            }
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public TinTuc getTinTuc(String maTinTuc) {
        String sql = "SELECT * FROM `tintuc` where maTinTuc = '"+maTinTuc+"'";
        TinTuc tinTuc= new TinTuc();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tinTuc.setMaTinTuc(rs.getString("maTinTuc"));
                tinTuc.setTieuDe(rs.getString("tieuDe"));
                tinTuc.setNoiDung(rs.getString("noiDung"));
                tinTuc.setTime(rs.getTimestamp("time"));
            }
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tinTuc;
    }
}
