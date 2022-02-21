package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.CartProductVO;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.Customer_orderVO;
import com.example.demo.vo.ListOrderVO;
import com.example.demo.vo.OrderCancelVO;

@Repository
public class Customer_orderDAO {
	public int insertCart(CartVO c) {
		return DBManager.insertCart(c);
	}
	
	public List<CartProductVO> cartProduct(){
		return DBManager.cartProduct();
	}
	
	public int updateCart(CartVO c) {
		return DBManager.updateCart(c);
	}
	
	public int deleteCart(int cart_no) {
		return DBManager.deleteCart(cart_no);
	}
	
	public CartProductVO cartOrder(CartVO c) {
		return DBManager.cartOrder(c);
	}
	
	public int insertCustomer_order(Customer_orderVO co) {
		return DBManager.insertCustomer_order(co);
	}
	
	public List<ListOrderVO> listOrder(ListOrderVO lo){
		return DBManager.listOrder(lo);
	}
	
	public OrderCancelVO orderCancelPage(int order_no) {
		return DBManager.orderCancelPage(order_no);
	}
	
	public int orderCancelcheck(int order_no) {
		return DBManager.orderCancelcheck(order_no);
	}
}
