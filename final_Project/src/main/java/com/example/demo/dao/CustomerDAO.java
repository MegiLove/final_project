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
	
	//1. id가 존재하지 않는 경우 int -1을 반환
	//2. 암호가 일치하지 않는 경우 int 0을 반환
	//3. 암호가 일치하는 경우 int 1을 반환
	public int login(String cust_id, String cust_pwd) {
		return DBManager.login(cust_id, cust_pwd);
	}
	
	public HashMap findId(String cust_name, String cust_phone) {
		return DBManager.findId(cust_name, cust_phone);
	}
	
	public HashMap findPwd(String cust_id, String cust_phone) {
		return DBManager.findPwd(cust_id, cust_phone);
	}
	
	public CustomerVO detailCustomer(String cust_id) {
		return DBManager.detailCustomer(cust_id);
	}
	
	public int  updateCustomer(CustomerVO c) {
		return DBManager.updateCustomer(c);
	}
	
	public CustomerVO showCustomer(String cust_id) {
		return DBManager.showCustomer(cust_id);
	}
	
	public String getRole(String cust_id) {
		return DBManager.getRole(cust_id);
	}
}
