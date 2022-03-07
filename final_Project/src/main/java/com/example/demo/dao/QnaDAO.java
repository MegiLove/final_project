package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ListQnaVO;
import com.example.demo.vo.QnaVO;

@Repository
public class QnaDAO {

	public QnaVO detailQna(int qna_no) {
		return DBManager.detailQna(qna_no);
	}
	
	public int updateQna(QnaVO q) {
		return DBManager.updateQna(q);
	}
	
	public int deleteQna(int qna_no) {
		return DBManager.deleteQna(qna_no);
	}
	
	public List<QnaVO> listQna(String cust_id) {
		return DBManager.listQna(cust_id);
	}
	
	public int insertQna(QnaVO q) {
		return DBManager.insertQna(q);
	}
	
	public int getNextNo() {
		return DBManager.getNextNo();
	}
	
	public List<ListQnaVO> findAllQna(int product_no){
		return DBManager.findAllQna(product_no);
	}
	
	public int updateQna_answer(QnaVO q) {
		return DBManager.updateQna_answer(q);
	}
	
	public List<QnaVO> mgr_listQna(){
		return DBManager.mgr_listQna();
	}
	
	public QnaVO mgr_detailQna(int qna_no) {
		return DBManager.mgr_detailQna(qna_no);
	}
}
