package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.CartProductVO;
import com.example.demo.vo.CartVO;

@Repository
public class CartDAO {
	public int insertCart(CartVO cart) {
		return DBManager.insertCart(cart);
	}
	
	public List<CartProductVO> cartProduct(){
		return DBManager.cartProduct();
	}
	
	public int updateCart(CartVO cart) {
		return DBManager.updateCart(cart);
	}
	
	public int deleteCart(int cart_no) {
		return DBManager.deleteCart(cart_no);
	}
}
