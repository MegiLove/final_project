package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.vo.CustomerOrder_detailVO;
import com.example.demo.vo.ListDetailVO;
import com.example.demo.db.DBManager;

@Repository
public class CustomerOrder_detailDAO {

	public List<ListDetailVO> listDetail(int order_no) {
		return DBManager.listDetail(order_no);
	}
	
	public int totalDetail(int order_no) {
		return DBManager.totalDetail(order_no);
	}
	
	public int insertCustomerOrder_detail(CustomerOrder_detailVO cd) {
		return DBManager.insertCustomerOrder_detail(cd);
	}
	
	public int orderdetail_getNextNo() {
		return DBManager.orderdetail_getNextNo();
	}
}
