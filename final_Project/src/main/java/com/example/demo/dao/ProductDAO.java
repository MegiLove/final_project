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
	
	public List<ProductVO> listProduct(HashMap map){
		totalRecord = DBManager.getTotalRecord(map);
		totalPage = (int)Math.ceil(totalRecord/(double)pageSIZE);
		
		return DBManager.listProduct(map);
	}
}
