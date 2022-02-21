package com.example.demo.db;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.CartProductVO;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.Customer_orderVO;
import com.example.demo.vo.ListOrderVO;
import com.example.demo.vo.OrderCancelVO;

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
	
	public static int insertCart(CartVO c) {
		SqlSession session = factory.openSession();
		int re = session.insert("cart.insertCart", c);
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
	
	public static int updateCart(CartVO c) {
		SqlSession session = factory.openSession();
		int re=session.update("cart.updateCart", c);
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
	
	public static CartProductVO cartOrder(CartVO c) {
		SqlSession session = factory.openSession();
		CartProductVO cp= session.selectOne("cart.cartOrder", c);
		session.commit();
		session.close();
		return cp;
	}
	
	public static int insertCustomer_order(Customer_orderVO co) {
		SqlSession session = factory.openSession();
		int re = session.insert("customer_order.insertCustomer_order", co);
		session.commit();
		session.close();
		return re;
	}
	
	public static List<ListOrderVO> listOrder(ListOrderVO lo){
		SqlSession session = factory.openSession();
		List<ListOrderVO> list= session.selectList("customer_order.listOrder",lo);
		session.close();
		return list;
	}
	
	public static OrderCancelVO orderCancelPage(int order_no) {
		SqlSession session = factory.openSession();
		OrderCancelVO oc= session.selectOne("customer_order.orderCancelPage", order_no);
		session.commit();
		session.close();
		return oc;
	}
	
	public static int orderCancelcheck(int order_no) {
		SqlSession session = factory.openSession();
		int re=session.update("customer_order.orderCancelCheck", order_no);
		session.commit();
		session.close();
		return re;
	}
}