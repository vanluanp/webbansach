package dao;

import Model.Review;

import java.util.ArrayList;

public interface ReviewDAO {

    public void insertReview(Review review) ;

    public ArrayList<Review> getReview(String maSach);

    public ArrayList<Review> getReviewAll();

    public ArrayList<Review> getReviewSingle(String maNhanXet, String maSach);

}
