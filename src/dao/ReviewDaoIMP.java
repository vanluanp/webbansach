package dao;

import DB.ConnectionDB;
import Model.DanhMuc;
import Model.NhaXuatBan;
import Model.Review;
import Model.SanPham;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ReviewDaoIMP implements ReviewDAO {
    // them review
    @Override
    public void insertReview(Review review){
        String sql = "INSERT INTO `nhanxet` VALUE (?,?,?,?,?,?)";
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, review.getMaNhanXet());
            ps.setString(2, review.getMaSach());
            ps.setString(3, review.getUserName());
            ps.setTimestamp(4, review.getTime());
            ps.setString(5, review.getSubject());
            ps.setString(6, review.getReview());
            ps.executeUpdate();
            cons.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaiKhoanDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public ArrayList<Review> getReview(String maSach){
        String sql = "SELECT * FROM `nhanxet` WHERE maSach = '" + maSach + "' ";
        ArrayList<Review> arr = new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Review review= new Review();
                review.setMaNhanXet(rs.getString("maNhanXet"));
                review.setMaSach(rs.getString("maSach"));
                review.setUserName(rs.getString("userName"));
                review.setTime(rs.getTimestamp("time"));
                review.setSubject(rs.getString("subject"));
                review.setReview(rs.getString("review"));
                arr.add(review);

            }
            cons.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public ArrayList<Review> getReviewAll() {
        String sql = "SELECT * FROM `nhanxet`";
        ArrayList<Review> arr = new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Review review= new Review();
                review.setMaNhanXet(rs.getString("maNhanXet"));
                review.setMaSach(rs.getString("maSach"));
                review.setUserName(rs.getString("userName"));
                review.setTime(rs.getTimestamp("time"));
                review.setSubject(rs.getString("subject"));
                review.setReview(rs.getString("review"));
                arr.add(review);

            }
            cons.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public ArrayList<Review> getReviewSingle(String maNhanXet, String maSach){
        String sql = "SELECT * FROM `nhanxet` WHERE maNhanXet = '" + maNhanXet + "' AND maSach= '" + maSach + "'";
        ArrayList<Review> arrSingle = new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Review review= new Review();
                review.setMaNhanXet(rs.getString("maNhanXet"));
                review.setMaSach(rs.getString("maSach"));
                review.setUserName(rs.getString("userName"));
                review.setTime(rs.getTimestamp("time"));
                review.setSubject(rs.getString("subject"));
                review.setReview(rs.getString("review"));
                arrSingle.add(review);

            }
            cons.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return arrSingle;
    }
}
