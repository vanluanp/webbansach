package Model;

import java.sql.Timestamp;

public class HoaDon {
    private String maHoaDon;
    private User user;
    private String diaChi;
    private String phuongThucThanhToan;
    private String phuongThucGiaoHang;
    private Timestamp ngayMuaHang;
    private int status;
    private double tongtien;

    public HoaDon() {
    }

    public double getTongtien() {
        return tongtien;
    }

    public void setTongtien(double tongtien) {
        this.tongtien = tongtien;
    }

    public HoaDon(String maHoaDon, User user, String diaChi, String phuongThucThanhToan, String phuongThucGiaoHang, Timestamp ngayMuaHang, int status, double tongtien) {
        this.maHoaDon = maHoaDon;
        this.user = user;
        this.diaChi = diaChi;
        this.phuongThucThanhToan = phuongThucThanhToan;
        this.phuongThucGiaoHang = phuongThucGiaoHang;
        this.ngayMuaHang = ngayMuaHang;
        this.status = status;
        this.tongtien = tongtien;
    }

    public String getPhuongThucGiaoHang() {
        return phuongThucGiaoHang;
    }

    public void setPhuongThucGiaoHang(String phuongThucGiaoHang) {
        this.phuongThucGiaoHang = phuongThucGiaoHang;
    }

    public String getMaHoaDon() {
        return maHoaDon;
    }

    public void setMaHoaDon(String maHoaDon) {
        this.maHoaDon = maHoaDon;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getPhuongThucThanhToan() {
        return phuongThucThanhToan;
    }

    public void setPhuongThucThanhToan(String phuongThucThanhToan) {
        this.phuongThucThanhToan = phuongThucThanhToan;
    }

    public Timestamp getNgayMuaHang() {
        return ngayMuaHang;
    }

    public void setNgayMuaHang(Timestamp ngayMuaHang) {
        this.ngayMuaHang = ngayMuaHang;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
