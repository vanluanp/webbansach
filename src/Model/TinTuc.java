package Model;

import java.sql.Timestamp;

public class TinTuc {
    private String maTinTuc;
    private String tieuDe;
    private Timestamp time;
    private String noiDung;

    public TinTuc() {
    }

    public TinTuc(String maTinTuc, String tieuDe, Timestamp time, String noiDung) {
        this.maTinTuc = maTinTuc;
        this.tieuDe = tieuDe;
        this.time = time;
        this.noiDung = noiDung;
    }

    public String getMaTinTuc() {
        return maTinTuc;
    }

    public void setMaTinTuc(String maTinTuc) {
        this.maTinTuc = maTinTuc;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }
}
