package dao;


import Model.TinTuc;

import java.util.ArrayList;

public interface TinTucDao {

    public void themTinTuc(TinTuc tinTuc);

    public ArrayList<TinTuc> getListTinTuc();

    public TinTuc getTinTuc(String maTinTuc);
}
