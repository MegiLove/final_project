package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.CustomerVO;

@Repository
public class CustomerDAO {

	public int insertCustomer(CustomerVO c) {
		return DBManager.insertCustomer(c);
	}
	
	public int doubleCheck_id(String cust_id) {
		return DBManager.doubleCheck_id(cust_id);
	}
	
	public int doubleCheck_email(String cust_email) {
		return DBManager.doubleCheck_email(cust_email);
	}
	
	public int login(String cust_id, String cust_pwd) {
		return DBManager.login(cust_id, cust_pwd);
	}
	
	public String findId(HashMap map) {
		return DBManager.findId(map);
	}
	
	public String findPwd(HashMap map) {
		return DBManager.findPwd(map);
	}
	
	public CustomerVO detailCustomer(String cust_id) {
		return DBManager.detailCustomer(cust_id);
	}
	
	public int updateCustomer(CustomerVO c) {
		return DBManager.updateCustomer(c);
	}
	
	public CustomerVO showCustomer(String cust_id) {
		return DBManager.showCustomer(cust_id);
	}
	

	public String getRole(String cust_id) {
		return DBManager.getRole(cust_id);
	}

	public int mypage_login(String cust_id) {
		return DBManager.mypageMain(cust_id);
	}
	
	public String getEmail(String cust_id) {
		return DBManager.getEmail(cust_id);
	}

}
