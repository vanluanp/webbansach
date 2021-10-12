package dao;

import Model.SanPham;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

public interface SanPhamDao {


    public ArrayList<SanPham> getListProductByCategory(String maChuyenMuc);

    public ArrayList<SanPham> getListProductByComp(String maNhaXuatBan);

    public ArrayList<SanPham> getProductByStatus(int status);

    public ArrayList<SanPham> getListProductByPrice(double p1, double p2);

    public SanPham getSingleProduct(String maSach);

    public ArrayList<SanPham> getAllProduct();

    public ArrayList<SanPham> getAllProduct(int option);

    public ArrayList<SanPham> getProductHotByCate(int option, String cate);

    public ArrayList<SanPham> getListByPage(ArrayList<SanPham> arr, int start, int end);

    public ArrayList<SanPham> getProductByName(String name);

    public ArrayList<SanPham> searchByName(HttpServletRequest request, String name);

//    public ArrayList<SanPham> getFocusProduct();

}
