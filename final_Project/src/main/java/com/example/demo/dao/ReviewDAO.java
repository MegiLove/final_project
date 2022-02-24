package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ContentReviewVO;
import com.example.demo.vo.ListReviewVO;
import com.example.demo.vo.ReviewVO;

@Repository
public class ReviewDAO {
	
	public List<ListReviewVO> listReviewWrite(String cust_id){
		return DBManager.listReviewWrite(cust_id);
	}
	
	public List<ContentReviewVO> listReviewComplete(String cust_id){
		return DBManager.listReviewComplete(cust_id);
	}
	
	public int deleteReview(int review_no) {
		return DBManager.deleteReview(review_no);
	}
	
	public ContentReviewVO contentReview(int review_no) {
		return DBManager.contentReview(review_no);
	}
	
	public int updateReview(ReviewVO r) {
		return DBManager.updateReview(r);
	}
	
	public ReviewVO findByNo(int review_no) {
		return DBManager.findByNo(review_no);
	}
}
