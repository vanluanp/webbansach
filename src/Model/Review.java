package Model;

import java.sql.Timestamp;

public class Review {
    private String maNhanXet;
    private String maSach;
    private String userName;
    private Timestamp time;
    private String subject;
    private String review;

    public Review() {
    }

    public Review(String maNhanXet, String maSach, String userName, Timestamp time, String subject, String review) {
        this.maNhanXet = maNhanXet;
        this.maSach = maSach;
        this.userName = userName;
        this.time = time;
        this.subject = subject;
        this.review = review;
    }

    public String getMaNhanXet() {
        return maNhanXet;
    }

    public void setMaNhanXet(String maNhanXet) {
        this.maNhanXet = maNhanXet;
    }

    public String getMaSach() {
        return maSach;
    }

    public void setMaSach(String maSach) {
        this.maSach = maSach;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }
}
