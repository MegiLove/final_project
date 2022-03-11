package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ListQnaVO;
import com.example.demo.vo.ProductVO;
import com.example.demo.vo.QnaVO;

@Repository
public class QnaDAO {

	public static int pageSIZE = 10;
	public static int totalRecord;
	public static int totalPage;
	
	public static int mgr_pageSIZE = 10;	//한 화면에 보여줄 레코드 수
	public static int mgr_totalRecord;	//전체 레코드 수
	public static int mgr_totalPage;	//전체 페이지 수
	
	public QnaVO detailQna(int qna_no) {
		return DBManager.detailQna(qna_no);
	}
	
	public int updateQna(QnaVO q) {
		return DBManager.updateQna(q);
	}
	
	public int deleteQna(int qna_no) {
		return DBManager.deleteQna(qna_no);
	}
	
	public List<QnaVO> listQna(HashMap map) {
		totalRecord = DBManager.QnaGetTotalRecord(map);
		totalPage = (int)Math.ceil(totalRecord/(double)pageSIZE);
		return DBManager.listQna(map);
	}
//	
//	public List<QnaVO> listQna(String cust_id) {
//		return DBManager.listQna(cust_id);
//	}
	
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
	
	public List<QnaVO> mgr_listQna(HashMap map){
		mgr_totalRecord = DBManager.QnaGetTotalRecord(map);
		mgr_totalPage = (int)Math.ceil(mgr_totalRecord/(double)mgr_pageSIZE);
		return DBManager.mgr_listQna(map);
	}
	
	public QnaVO mgr_detailQna(int qna_no) {
		return DBManager.mgr_detailQna(qna_no);
	}
}
