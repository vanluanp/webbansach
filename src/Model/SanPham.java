package Model;

public class SanPham {
    String maSach;
    String tenSach;
    String tacGia;
    NhaXuatBan nhaXuatBan;
    String moTa;
    String chiTietMoTa;
    String hinhAnh1;
    String hinhAnh2;
    double giaGoc;
    double giaKhuyenMai;
    int soLuongNhap;
    int soLuongBan;
    DanhMuc danhMuc;
    int danhGia;
    int status;

    public SanPham(String maSach, String tenSach, String tacGia, NhaXuatBan nhaXuatBan, String moTa, String chiTietMoTa, String hinhAnh1, String hinhAnh2, double giaGoc, double giaKhuyenMai, int soLuongNhap, int soLuongBan, DanhMuc danhMuc, int status) {
        this.maSach = maSach;
        this.tenSach = tenSach;
        this.tacGia = tacGia;
        this.nhaXuatBan = nhaXuatBan;
        this.moTa = moTa;
        this.chiTietMoTa = chiTietMoTa;
        this.hinhAnh1 = hinhAnh1;
        this.hinhAnh2 = hinhAnh2;
        this.giaGoc = giaGoc;
        this.giaKhuyenMai = giaKhuyenMai;
        this.soLuongNhap = soLuongNhap;
        this.soLuongBan = soLuongBan;
        this.danhMuc = danhMuc;
        this.status = status;
    }

    public SanPham(){
    }

    public int getSoLuongBan() {
        return soLuongBan;
    }

    public void setSoLuongBan(int soLuongBan) {
        this.soLuongBan = soLuongBan;
    }

    public SanPham(String maSach, String tenSach, String tacGia, NhaXuatBan nhaXuatBan, String moTa, String chiTietMoTa, String hinhAnh1, String hinhAnh2, double giaGoc, double giaKhuyenMai, int soLuongNhap, DanhMuc danhMuc, int status) {
        this.maSach = maSach;
        this.tenSach = tenSach;
        this.tacGia = tacGia;
        this.nhaXuatBan = nhaXuatBan;
        this.moTa = moTa;
        this.chiTietMoTa = chiTietMoTa;
        this.hinhAnh1 = hinhAnh1;
        this.hinhAnh2 = hinhAnh2;
        this.giaGoc = giaGoc;
        this.giaKhuyenMai = giaKhuyenMai;
        this.soLuongNhap = soLuongNhap;
        this.danhMuc = danhMuc;
        this.status = status;
    }

    public String getMaSach() {
        return maSach;
    }

    public void setMaSach(String maSach) {
        this.maSach = maSach;
    }

    public int getDanhGia() {
        return danhGia;
    }

    public void setDanhGia(int danhGia) {
        this.danhGia = danhGia;
    }

    public String getTenSach() {
        return tenSach;
    }

    public void setTenSach(String tenSach) {
        this.tenSach = tenSach;
    }

    public String getTacGia() {
        return tacGia;
    }

    public void setTacGia(String tacGia) {
        this.tacGia = tacGia;
    }

    public NhaXuatBan getNhaXuatBan() {
        return nhaXuatBan;
    }

    public void setNhaXuatBan(NhaXuatBan nhaXuatBan) {
        this.nhaXuatBan = nhaXuatBan;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getChiTietMoTa() {
        return chiTietMoTa;
    }

    public void setChiTietMoTa(String chiTietMoTa) {
        this.chiTietMoTa = chiTietMoTa;
    }

    public String getHinhAnh1() {
        return hinhAnh1;
    }

    public void setHinhAnh1(String hinhAnh1) {
        this.hinhAnh1 = hinhAnh1;
    }

    public String getHinhAnh2() {
        return hinhAnh2;
    }

    public void setHinhAnh2(String hinhAnh2) {
        this.hinhAnh2 = hinhAnh2;
    }

    public double getGiaGoc() {
        return giaGoc;
    }

    public void setGiaGoc(double giaGoc) {
        this.giaGoc = giaGoc;
    }

    public double getGiaKhuyenMai() {
        return giaKhuyenMai;
    }

    public void setGiaKhuyenMai(double giaKhuyenMai) {
        this.giaKhuyenMai = giaKhuyenMai;
    }

    public int getSoLuongNhap() {
        return soLuongNhap;
    }

    public void setSoLuongNhap(int soLuongNhap) {
        this.soLuongNhap = soLuongNhap;
    }

    public DanhMuc getDanhMuc() {
        return danhMuc;
    }

    public void setDanhMuc(DanhMuc danhMuc) {
        this.danhMuc = danhMuc;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
