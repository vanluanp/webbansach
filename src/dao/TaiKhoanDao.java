package dao;

import Model.User;

import java.util.ArrayList;

public interface TaiKhoanDao {
    //kiem tra tai khoan da ton tai chua
    public boolean kiemTraTaiKhoan(String userName);
    //them tai khoan
    public void themTaiKhoan(User user);
    //kiểm tra đăng nhập
    public boolean checkDangNhap(String userName, String password);

    public boolean checkDangNhapAd(String userName, String password);

    public User getTaiKhoan(String maTK);

    public User getTaiKhoanByUserName(String userName);

    public ArrayList<User> getListTaiKhoan();

}
