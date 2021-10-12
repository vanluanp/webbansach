package dao;

import Model.ChiTietHoaDon;
import Model.HoaDon;

import java.util.ArrayList;

public interface HoaDonDAO {

    public void themHoaDon(HoaDon hd);

    public ArrayList<HoaDon> getHoaDon(String maTK);

    public HoaDon getHoaDonSingle(String maHD);

    public void setStatus(String maHD, int status);
}
