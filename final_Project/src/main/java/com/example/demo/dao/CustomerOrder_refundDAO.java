package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.CustomerOrder_refundVO;

@Repository
public class CustomerOrder_refundDAO {

	public int insertRefund(CustomerOrder_refundVO cr) {
		return DBManager.insertRefund(cr);
	}
}
