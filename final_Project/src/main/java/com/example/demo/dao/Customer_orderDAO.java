package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.Customer_orderVO;
import com.example.demo.vo.ListOrderVO;
import com.example.demo.vo.MonthTotalVO;
import com.example.demo.vo.OrderCancelVO;

@Repository
public class Customer_orderDAO {
	
	public int insertCustomer_order(Customer_orderVO co) {
		return DBManager.insertCustomer_order(co);
	}

	public List<ListOrderVO> listOrder(String cust_id) {
		return DBManager.listOrder(cust_id);
	}
	
	public List<OrderCancelVO> orderCancelPage(int order_no) {
		return DBManager.orderCancelPage(order_no);
	}
	
	public int orderCancelCheck(int order_no) {
		return DBManager.orderCancelCheck(order_no);
	}
	
	public List<MonthTotalVO> monthTotal() {
		return DBManager.monthTotal();
	}
}
