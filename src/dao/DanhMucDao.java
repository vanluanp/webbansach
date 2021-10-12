package dao;

import Model.DanhMuc;
import Model.HoaDon;
import Model.NhaXuatBan;

import java.util.ArrayList;

public interface DanhMucDao{

    public ArrayList<DanhMuc> getList();
    public ArrayList<DanhMuc> getListCon(String maDanhMucCha);
    public ArrayList<NhaXuatBan> getListNXB();
    public int getNumListNXB(String maNXB);
    public NhaXuatBan getSingleNXB(String maNXB);
    public ArrayList<HoaDon> getListOrder();
}
