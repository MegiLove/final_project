package com.example.demo.db;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.CartProductVO;
import com.example.demo.vo.CartVO;

public class DBManager {
	private static SqlSessionFactory factory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/example/demo/db/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
	}
	
	public static int insertCart(CartVO cart) {
		SqlSession session = factory.openSession();
		int re = session.insert("cart.insertCart", cart);
		session.commit();
		session.close();
		return re;
	}
	
	public static List<CartProductVO> cartProduct(){
		SqlSession session = factory.openSession();
		List<CartProductVO> list= session.selectList("cart.cartProduct");
		session.close();
		return list;
	}
	
	public static int updateCart(CartVO cart) {
		SqlSession session = factory.openSession();
		int re=session.update("cart.updateCart", cart);
		session.commit();
		session.close();
		return re;
	}
	
	public static int deleteCart(int cart_no) {
		SqlSession session = factory.openSession();
		int re=session.delete("cart.deleteCart",cart_no);
		session.commit();
		session.close();
		return re;
		}
	}
















