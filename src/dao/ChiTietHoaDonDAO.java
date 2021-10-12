package dao;

import Model.ChiTietHoaDon;

import java.util.ArrayList;

public interface ChiTietHoaDonDAO {

    public void themCTHD(ChiTietHoaDon cthd);

    public ArrayList<ChiTietHoaDon> getCTHD(String maHD);

}
