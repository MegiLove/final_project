package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ProductVO;

@Repository
public class ProductDAO {
	
	public static int pageSIZE = 9;	//한 화면에 보여줄 레코드 수
	public static int totalRecord;	//전체 레코드 수
	public static int totalPage;	//전체 페이지 수
	
	public static int mgr_pageSIZE = 10;	//한 화면에 보여줄 레코드 수
	public static int mgr_totalRecord;	//전체 레코드 수
	public static int mgr_totalPage;	//전체 페이지 수
	
	public List<ProductVO> listProduct(HashMap map){
		totalRecord = DBManager.getTotalRecord(map);
		totalPage = (int)Math.ceil(totalRecord/(double)pageSIZE);
		
		return DBManager.listProduct(map);
	}
	
	public List<ProductVO> recentProduct(String orderType){
		return DBManager.recentProduct(orderType);
	}
	
	public ProductVO detailProduct(int product_no) {
		return DBManager.detailProduct(product_no);
	}
	
	public List<ProductVO> mgr_listProduct(HashMap map){
		mgr_totalRecord = DBManager.mgr_getTotalRecord();
		mgr_totalPage = (int)Math.ceil(mgr_totalRecord/(double)mgr_pageSIZE);
		return DBManager.mgr_listProduct(map);
	}
	
	public int mgr_insertProduct(ProductVO p) {
		return DBManager.mgr_insertProduct(p);
	}
	
	public ProductVO mgr_detailProduct(int product_no){
		return DBManager.mgr_detailProduct(product_no);
	}
	
	public int mgr_updateProduct(ProductVO p) {
		return DBManager.mgr_updateProduct(p);
	}
	
	public int mgr_deleteProduct(int product_no) {
		return DBManager.mgr_deleteProduct(product_no);
	}
	
	public int product_getNextNo() {
		return DBManager.product_getNextNo();
	}
	
	public List<ProductVO> category_sale(String category_code){
		return DBManager.category_sale(category_code);
	}
}
