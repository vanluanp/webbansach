package dao;

import DB.ConnectionDB;
import Model.DanhMuc;
import Model.NhaXuatBan;
import Model.SanPham;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SanPhamDaoIMP implements SanPhamDao {
    @Override
    public ArrayList<SanPham> getListProductByCategory(String maDanhMuc) {
        String sql;
        if (maDanhMuc.length() > 2) {
            sql = "SELECT * FROM `sanpham` WHERE maDanhMuc= '" + maDanhMuc + "' ";
        } else {
            sql = "SELECT * FROM `sanpham` WHERE maDanhMuc LIKE '" + maDanhMuc + "%' ";
        }
        ArrayList<SanPham> arr = new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSach(rs.getString("maSach"));
                sp.setTenSach(rs.getString("tenSach"));
                sp.setTacGia(rs.getString("tacGia"));
                NhaXuatBan nhaXuatBan= new NhaXuatBan(rs.getString("maNhaXuatBan"),"tenNhaXuatBan");
                sp.setNhaXuatBan(nhaXuatBan);
                sp.setMoTa(rs.getString("moTa"));
                sp.setChiTietMoTa(rs.getString("chiTietMoTa"));
                sp.setHinhAnh1(rs.getString("hinh1"));
                sp.setHinhAnh2(rs.getString("hinh2"));
                sp.setGiaGoc(rs.getDouble("giaGoc"));
                sp.setGiaKhuyenMai(rs.getDouble("giaKhuyenMai"));
                sp.setSoLuongNhap(rs.getInt("soLuongNhap"));
                sp.setSoLuongBan(rs.getInt("soLuongBan"));
                DanhMuc dm = new DanhMuc(rs.getString("maDanhMuc"), "TenDanhMuc");
                sp.setDanhMuc(dm);
                sp.setDanhGia(rs.getInt("danhGia"));
                sp.setStatus(rs.getInt("status"));
                arr.add(sp);

            }
            cons.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public ArrayList<SanPham> getListProductByComp(String maNhaXuatBan) {
        String sql;
        sql = "SELECT * FROM `sanpham` WHERE maNhaXuatBan LIKE '" + maNhaXuatBan + "' ";
        ArrayList<SanPham> arr = new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSach(rs.getString("maSach"));
                sp.setTenSach(rs.getString("tenSach"));
                sp.setTacGia(rs.getString("tacGia"));
                NhaXuatBan nhaXuatBan= new NhaXuatBan(rs.getString("maNhaXuatBan"),"tenNhaXuatBan");
                sp.setNhaXuatBan(nhaXuatBan);
                sp.setMoTa(rs.getString("moTa"));
                sp.setChiTietMoTa(rs.getString("chiTietMoTa"));
                sp.setHinhAnh1(rs.getString("hinh1"));
                sp.setHinhAnh2(rs.getString("hinh2"));
                sp.setGiaGoc(rs.getDouble("giaGoc"));
                sp.setGiaKhuyenMai(rs.getDouble("giaKhuyenMai"));
                sp.setSoLuongNhap(rs.getInt("soLuongNhap"));
                sp.setSoLuongBan(rs.getInt("soLuongBan"));
                DanhMuc dm = new DanhMuc(rs.getString("maDanhMuc"), "TenDanhMuc");
                sp.setDanhMuc(dm);
                sp.setDanhGia(rs.getInt("danhGia"));
                sp.setStatus(rs.getInt("status"));
                arr.add(sp);
            }
            cons.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public ArrayList<SanPham> getProductByStatus(int status) {
        String sql;
        sql = "SELECT * FROM `sanpham` WHERE status LIKE '" + status + "' ";
        ArrayList<SanPham> arr = new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSach(rs.getString("maSach"));
                sp.setTenSach(rs.getString("tenSach"));
                sp.setTacGia(rs.getString("tacGia"));
                NhaXuatBan nhaXuatBan= new NhaXuatBan(rs.getString("maNhaXuatBan"),"tenNhaXuatBan");
                sp.setNhaXuatBan(nhaXuatBan);
                sp.setMoTa(rs.getString("moTa"));
                sp.setChiTietMoTa(rs.getString("chiTietMoTa"));
                sp.setHinhAnh1(rs.getString("hinh1"));
                sp.setHinhAnh2(rs.getString("hinh2"));
                sp.setGiaGoc(rs.getDouble("giaGoc"));
                sp.setGiaKhuyenMai(rs.getDouble("giaKhuyenMai"));
                sp.setSoLuongNhap(rs.getInt("soLuongNhap"));
                sp.setSoLuongBan(rs.getInt("soLuongBan"));
                DanhMuc dm = new DanhMuc(rs.getString("maDanhMuc"), "TenDanhMuc");
                sp.setDanhMuc(dm);
                sp.setDanhGia(rs.getInt("danhGia"));
                sp.setStatus(rs.getInt("status"));
                arr.add(sp);
            }
            cons.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public ArrayList<SanPham> getListProductByPrice(double p1, double p2) {
        String sql;
        sql = "SELECT * FROM `sanpham` WHERE giaKhuyenMai >='" + p1 + "'  AND giaKhuyenMai < '" + p2 + "'";
        ArrayList<SanPham> arr = new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSach(rs.getString("maSach"));
                sp.setTenSach(rs.getString("tenSach"));
                sp.setTacGia(rs.getString("tacGia"));
                NhaXuatBan nhaXuatBan= new NhaXuatBan(rs.getString("maNhaXuatBan"),"tenNhaXuatBan");
                sp.setNhaXuatBan(nhaXuatBan);
                sp.setMoTa(rs.getString("moTa"));
                sp.setChiTietMoTa(rs.getString("chiTietMoTa"));
                sp.setHinhAnh1(rs.getString("hinh1"));
                sp.setHinhAnh2(rs.getString("hinh2"));
                sp.setGiaGoc(rs.getDouble("giaGoc"));
                sp.setGiaKhuyenMai(rs.getDouble("giaKhuyenMai"));
                sp.setSoLuongNhap(rs.getInt("soLuongNhap"));
                sp.setSoLuongBan(rs.getInt("soLuongBan"));
                DanhMuc dm = new DanhMuc(rs.getString("maDanhMuc"), "TenDanhMuc");
                sp.setDanhMuc(dm);
                sp.setDanhGia(rs.getInt("danhGia"));
                sp.setStatus(rs.getInt("status"));
                arr.add(sp);
            }
            cons.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public SanPham getSingleProduct(String maSach) {
        String sql = "SELECT * FROM `sanpham` JOIN nhaxuatban ON sanpham.maNhaXuatBan=nhaxuatban.maNhaXuatBan JOIN danhmuc ON sanpham.maDanhMuc=danhmuc.MaDanhMuc WHERE maSach= '" + maSach + "' ";
        SanPham sp = new SanPham();
        ArrayList<SanPham> arr = new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                sp.setMaSach(rs.getString("maSach"));
                sp.setTenSach(rs.getString("tenSach"));
                sp.setTacGia(rs.getString("tacGia"));
                NhaXuatBan nhaXuatBan= new NhaXuatBan(rs.getString("maNhaXuatBan"),rs.getString("tenNhaXuatBan"));
                sp.setNhaXuatBan(nhaXuatBan);
                sp.setMoTa(rs.getString("moTa"));
                sp.setChiTietMoTa(rs.getString("chiTietMoTa"));
                sp.setHinhAnh1(rs.getString("hinh1"));
                sp.setHinhAnh2(rs.getString("hinh2"));
                sp.setGiaGoc(rs.getDouble("giaGoc"));
                sp.setGiaKhuyenMai(rs.getDouble("giaKhuyenMai"));
                sp.setSoLuongNhap(rs.getInt("soLuongNhap"));
                sp.setSoLuongBan(rs.getInt("soLuongBan"));
                DanhMuc dm = new DanhMuc(rs.getString("maDanhMuc"), rs.getString("TenDanhMuc"));
                sp.setDanhGia(rs.getInt("danhGia"));
                sp.setDanhMuc(dm);
                sp.setStatus(rs.getInt("status"));

            }
            cons.close();

        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(SanPhamDaoIMP.class.getName()).log(Level.SEVERE, null, e);
        }
        return sp;
    }


    @Override
    public ArrayList<SanPham> getAllProduct() {
        String sql = "SELECT * FROM `sanpham` JOIN nhaxuatban ON sanpham.maNhaXuatBan=nhaxuatban.maNhaXuatBan JOIN danhmuc ON sanpham.maDanhMuc=danhmuc.MaDanhMuc";
        ArrayList<SanPham> arr2 = new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSach(rs.getString("maSach"));
                sp.setTenSach(rs.getString("tenSach"));
                sp.setTacGia(rs.getString("tacGia"));
                NhaXuatBan nhaXuatBan= new NhaXuatBan(rs.getString("maNhaXuatBan"),rs.getString("tenNhaXuatBan"));
                sp.setNhaXuatBan(nhaXuatBan);
                sp.setMoTa(rs.getString("moTa"));
                sp.setChiTietMoTa(rs.getString("chiTietMoTa"));
                sp.setHinhAnh1(rs.getString("hinh1"));
                sp.setHinhAnh2(rs.getString("hinh2"));
                sp.setGiaGoc(rs.getDouble("giaGoc"));
                sp.setGiaKhuyenMai(rs.getDouble("giaKhuyenMai"));
                sp.setSoLuongNhap(rs.getInt("soLuongNhap"));
                sp.setSoLuongBan(rs.getInt("soLuongBan"));
                DanhMuc dm = new DanhMuc(rs.getString("maDanhMuc"),rs.getString( "TenDanhMuc"));
                sp.setDanhGia(rs.getInt("danhGia"));
                sp.setDanhMuc(dm);
                sp.setStatus(rs.getInt("status"));
                arr2.add(sp);

            }
            cons.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return arr2;
    }

    @Override
    public ArrayList<SanPham> getAllProduct(int option) {
        String sql = "SELECT * FROM `sanpham` JOIN nhaxuatban ON sanpham.maNhaXuatBan=nhaxuatban.maNhaXuatBan JOIN danhmuc ON sanpham.maDanhMuc=danhmuc.MaDanhMuc WHERE soLuongBan >= '" + option + "' ";
        ArrayList<SanPham> arr = new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSach(rs.getString("maSach"));
                sp.setTenSach(rs.getString("tenSach"));
                sp.setTacGia(rs.getString("tacGia"));
                NhaXuatBan nhaXuatBan= new NhaXuatBan(rs.getString("maNhaXuatBan"),rs.getString("tenNhaXuatBan"));
                sp.setNhaXuatBan(nhaXuatBan);
                sp.setMoTa(rs.getString("moTa"));
                sp.setChiTietMoTa(rs.getString("chiTietMoTa"));
                sp.setHinhAnh1(rs.getString("hinh1"));
                sp.setHinhAnh2(rs.getString("hinh2"));
                sp.setGiaGoc(rs.getDouble("giaGoc"));
                sp.setGiaKhuyenMai(rs.getDouble("giaKhuyenMai"));
                sp.setSoLuongNhap(rs.getInt("soLuongNhap"));
                sp.setSoLuongBan(rs.getInt("soLuongBan"));
                DanhMuc dm = new DanhMuc(rs.getString("maDanhMuc"), rs.getString("TenDanhMuc"));
                sp.setDanhMuc(dm);
                sp.setDanhGia(rs.getInt("danhGia"));
                sp.setStatus(rs.getInt("status"));
                arr.add(sp);

            }
            cons.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public ArrayList<SanPham> getProductHotByCate(int option, String maDanhMuc) {
        String sql = "SELECT * FROM `sanpham` WHERE soLuongBan >= '" + option + "'  AND maDanhMuc LIKE '" + maDanhMuc + "%'";
        ArrayList<SanPham> arrHot = new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSach(rs.getString("maSach"));
                sp.setTenSach(rs.getString("tenSach"));
                sp.setTacGia(rs.getString("tacGia"));
                NhaXuatBan nhaXuatBan= new NhaXuatBan(rs.getString("maNhaXuatBan"),"tenNhaXuatBan");
                sp.setNhaXuatBan(nhaXuatBan);
                sp.setMoTa(rs.getString("moTa"));
                sp.setChiTietMoTa(rs.getString("chiTietMoTa"));
                sp.setHinhAnh1(rs.getString("hinh1"));
                sp.setHinhAnh2(rs.getString("hinh2"));
                sp.setGiaGoc(rs.getDouble("giaGoc"));
                sp.setGiaKhuyenMai(rs.getDouble("giaKhuyenMai"));
                sp.setSoLuongNhap(rs.getInt("soLuongNhap"));
                sp.setSoLuongBan(rs.getInt("soLuongBan"));
                DanhMuc dm = new DanhMuc(rs.getString("maDanhMuc"), "TenDanhMuc");
                sp.setDanhMuc(dm);
                sp.setDanhGia(rs.getInt("danhGia"));
                sp.setStatus(rs.getInt("status"));
                arrHot.add(sp);

            }
            cons.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return arrHot;
    }

    @Override
    public ArrayList<SanPham> getListByPage(ArrayList<SanPham> arr, int start, int end) {
        ArrayList<SanPham> arrPage = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arrPage.add(arr.get(i));
        }
        return arrPage;
    }

    @Override
    public ArrayList<SanPham> getProductByName(String name) {
        String sql = "SELECT * FROM `sanpham` WHERE tenSach = '" + name + "' ";
        ArrayList<SanPham> arr = new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSach(rs.getString("maSach"));
                sp.setTenSach(rs.getString("tenSach"));
                sp.setTacGia(rs.getString("tacGia"));
                NhaXuatBan nhaXuatBan= new NhaXuatBan(rs.getString("maNhaXuatBan"),"tenNhaXuatBan");
                sp.setNhaXuatBan(nhaXuatBan);
                sp.setMoTa(rs.getString("moTa"));
                sp.setChiTietMoTa(rs.getString("chiTietMoTa"));
                sp.setHinhAnh1(rs.getString("hinh1"));
                sp.setHinhAnh2(rs.getString("hinh2"));
                sp.setGiaGoc(rs.getDouble("giaGoc"));
                sp.setGiaKhuyenMai(rs.getDouble("giaKhuyenMai"));
                sp.setSoLuongNhap(rs.getInt("soLuongNhap"));
                sp.setSoLuongBan(rs.getInt("soLuongBan"));
                DanhMuc dm = new DanhMuc(rs.getString("maDanhMuc"), "TenDanhMuc");
                sp.setDanhMuc(dm);
                sp.setDanhGia(rs.getInt("danhGia"));
                sp.setStatus(rs.getInt("status"));
                arr.add(sp);

            }
            cons.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public ArrayList<SanPham> searchByName(HttpServletRequest request, String name) {
        String sql = "SELECT * FROM `sanpham` WHERE tenSach LIKE '" + name + "%' OR tenSach LIKE '%" + name + "%' ";
        ArrayList<SanPham> arr = new ArrayList<>();
        try {
            Connection cons = ConnectionDB.getConnection();
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(!rs.isBeforeFirst()){
                request.setAttribute("ketqua", "Không có kết quả");
            }else {
                while (rs.next()) {
                    SanPham sp = new SanPham();
                    sp.setMaSach(rs.getString("maSach"));
                    sp.setTenSach(rs.getString("tenSach"));
                    sp.setTacGia(rs.getString("tacGia"));
                    NhaXuatBan nhaXuatBan = new NhaXuatBan(rs.getString("maNhaXuatBan"), "tenNhaXuatBan");
                    sp.setNhaXuatBan(nhaXuatBan);
                    sp.setMoTa(rs.getString("moTa"));
                    sp.setChiTietMoTa(rs.getString("chiTietMoTa"));
                    sp.setHinhAnh1(rs.getString("hinh1"));
                    sp.setHinhAnh2(rs.getString("hinh2"));
                    sp.setGiaGoc(rs.getDouble("giaGoc"));
                    sp.setGiaKhuyenMai(rs.getDouble("giaKhuyenMai"));
                    sp.setSoLuongNhap(rs.getInt("soLuongNhap"));
                    sp.setSoLuongBan(rs.getInt("soLuongBan"));
                    DanhMuc dm = new DanhMuc(rs.getString("maDanhMuc"), "TenDanhMuc");
                    sp.setDanhMuc(dm);
                    sp.setDanhGia(rs.getInt("danhGia"));
                    sp.setStatus(rs.getInt("status"));
                    arr.add(sp);

                }
            }
            cons.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return arr;
    }

    //    @Override
//  Sửa sách
    public boolean updateProduct(SanPham sp) throws SQLException {
        try {
            Connection connection = ConnectionDB.getConnection();
            String sql = "UPDATE sanpham SET tenSach=?, tacGia=?, maNhaXuatBan=?, moTa=?, chiTietMoTa=?, hinh1=?, hinh2=?, giaGoc=?, giaKhuyenMai=?, soLuongNhap=?, soLuongBan=?, maDanhMuc=?, status=? WHERE maSach = ?";
            PreparedStatement ps = connection.prepareCall(sql);
//            ps.setString(1, sp.getMaSach());
            ps.setString(1, sp.getTenSach());
            ps.setString(2, sp.getTacGia());
            ps.setString(3, sp.getNhaXuatBan().getMaNhaXuatBan());
            ps.setString(4, sp.getMoTa());
            ps.setString(5, sp.getChiTietMoTa());
            ps.setString(6, sp.getHinhAnh1());
            ps.setString(7, sp.getHinhAnh2());
            ps.setDouble(8, sp.getGiaGoc());
            ps.setDouble(9, sp.getGiaKhuyenMai());
            ps.setInt(10, sp.getSoLuongNhap());
            ps.setInt(11, sp.getSoLuongBan());
            ps.setString(12, sp.getDanhMuc().getMaDanhMuc());
            ps.setInt(13, sp.getStatus());
            ps.setString(14, sp.getMaSach());

            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }

    //    Thêm sách
    public boolean insertProduct(SanPham sp) {
        try {
            Connection connection = ConnectionDB.getConnection();
            String sql = "INSERT INTO sanpham VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
//            PreparedStatement ps= connection.prepareCall(sql);
            ps.setString(1, sp.getMaSach());
            ps.setString(2, sp.getTenSach());
            ps.setString(3, sp.getTacGia());
            ps.setString(4, sp.getNhaXuatBan().getMaNhaXuatBan());
            ps.setString(5, sp.getMoTa());
            ps.setString(6, sp.getChiTietMoTa());
            ps.setString(7, sp.getHinhAnh1());
            ps.setString(8, sp.getHinhAnh2());
            ps.setDouble(9, sp.getGiaGoc());
            ps.setDouble(10, sp.getGiaKhuyenMai());
            ps.setInt(11, sp.getSoLuongNhap());
            ps.setInt(12, 0);
            ps.setString(13, sp.getDanhMuc().getMaDanhMuc());
            ps.setInt(14, 0);
            ps.setInt(15, sp.getStatus());
            return ps.executeUpdate() == 1;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(SanPhamDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //Xóa sách
    public boolean deleteProduct(String maSach) {
        try {
            Connection connection = ConnectionDB.getConnection();
            String sql = "DELETE FROM sanpham WHERE maSach = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, maSach);
            return ps.executeUpdate() == 1;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(SanPhamDaoIMP.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }


////////////////////////////////
}


//    public int getRow(){
//        String sql = "SELECT * FROM `sanpham`";
//        int num=0;
//        try {
//            Connection cons = ConnectionDB.getConnection();
//            PreparedStatement ps = cons.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            rs.afterLast();
//            num=rs.getRow();
//            cons.close();
//        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
//        }
//        return num;
//    }

