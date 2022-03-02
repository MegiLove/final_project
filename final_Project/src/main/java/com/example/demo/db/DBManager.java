package com.example.demo.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.example.demo.vo.CartProductVO;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.ContentReviewVO;
import com.example.demo.vo.CustomerOrder_detailVO;
import com.example.demo.vo.CustomerOrder_refundVO;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.Customer_orderVO;
import com.example.demo.vo.ListDetailVO;
import com.example.demo.vo.ListOrderVO;
import com.example.demo.vo.ListReviewVO;
import com.example.demo.vo.MonthTotalVO;
import com.example.demo.vo.OrderCancelVO;
import com.example.demo.vo.ProductVO;
import com.example.demo.vo.QnaVO;
import com.example.demo.vo.ReviewVO;


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
	
	
	//=========================================
	//product
	
	public static List<ProductVO> listProduct(HashMap map){
		SqlSession session = factory.openSession();
		List<ProductVO> list = session.selectList("product.listProduct",map);
		System.out.println(list);
		System.out.println("데이터수:"+list.size());
		session.close();
		return list;
	}
	
	public static int getTotalRecord(HashMap map) {
		SqlSession session = factory.openSession();
		int no = session.selectOne("product.getTotalRecord", map);
		System.out.println("totalRecord:"+no);
		session.close();
		return no;
	}
	
	public static List<ProductVO> mgr_listProduct(HashMap map){
		SqlSession session = factory.openSession();
		List<ProductVO> list = session.selectList("product.mgr_listProduct",map);
		session.close();
		return list;
	}
	
	public static int mgr_getTotalRecord() {
		SqlSession session = factory.openSession();
		int no = session.selectOne("product.mgr_getTotalRecord");
		System.out.println("mgr_totalRecord:"+no);
		session.close();
		return no;
	}
	
	public static int mgr_insertProduct(ProductVO p) {
		p.setProduct_no(product_getNextNo());
		SqlSession session = factory.openSession();
		int re = session.insert("product.mgr_insertProduct",p);
		session.commit();
		session.close();
		return re;
	}
	
	public static ProductVO mgr_detailProduct(int product_no){
		SqlSession session = factory.openSession();
		ProductVO p = session.selectOne("product.mgr_detailProduct",product_no);
		session.close();
		return p;
	}
	
	public static int mgr_updateProduct(ProductVO p) {
		SqlSession session = factory.openSession();
		int re = session.update("product.mgr_updateProduct",p);
		session.commit();
		session.close();
		return re;
	}

	public static int mgr_deleteProduct(int product_no) {
		SqlSession session = factory.openSession();
		int re = session.delete("product.mgr_deleteProduct",product_no);
		session.commit();
		session.close();
		return re;
	}
	
	public static int product_getNextNo() {
		SqlSession session = factory.openSession();
		int product_no = session.selectOne("product.getNextNo");
		session.close();
		return product_no;
	}
	
	public static List<ProductVO> category_sale(String category_code){
		SqlSession session = factory.openSession();
		List<ProductVO> list = session.selectList("product.category_sale",category_code);
		session.close();
		return list;
	}
	
	//=========================================
	//review
	
	public static List<ListReviewVO> listReviewWrite(String cust_id){
		SqlSession session = factory.openSession();
		List<ListReviewVO> list = session.selectList("review.listReviewWrite",cust_id);
		session.close();
		return list;
	}
	
	public static List<ContentReviewVO> listReviewComplete(String cust_id){
		SqlSession session = factory.openSession();
		List<ContentReviewVO> list = session.selectList("review.listReviewComplete", cust_id);
		session.close();
		return list;
	}
	
	public static int deleteReview(int review_no) {
		SqlSession session = factory.openSession();
		int re = session.delete("review.deleteReview", review_no);
		session.commit();
		session.close();
		return re;
	}
	
	public static ContentReviewVO contentReview(int review_no) {
		SqlSession session = factory.openSession();
		ContentReviewVO c = session.selectOne("review.contentReview", review_no);
		session.close();
		return c;
	}
	
	public static int updateReview(ReviewVO r) {
		SqlSession session = factory.openSession();
		int re = session.update("review.updateReview", r);
		session.commit();
		session.close();
		return re;
	}
	
	public static ReviewVO findByNo(int review_no) {
		SqlSession session = factory.openSession();
		ReviewVO r = session.selectOne("review.findByNo", review_no);
		session.close();
		return r;
	}

	
	//==============================================
	//customer
	
	public static int insertCustomer(CustomerVO c) {
		SqlSession session = factory.openSession();
		int re = session.insert("customer.insertCustomer",c);
		session.commit();
		session.close();
		return re;
	}
	
	public static int doubleCheck_id(String cust_id) {
		SqlSession session = factory.openSession();
		int re = session.selectOne("customer.doubleCheck_id",cust_id);
		session.close();
		return re;
	}
	
	public static int doubleCheck_email(String cust_email) {
		SqlSession session = factory.openSession();
		int re = session.selectOne("customer.doubleCheck_email",cust_email);
		session.close();
		return re;
	}
	
	public static int login(String cust_id, String cust_pwd) {
		int re = -1;
		SqlSession session = factory.openSession();
		String dbPwd = session.selectOne("customer.login",cust_id);
		session.close();
		if(dbPwd != null) { //dbPwd != null이면 re는 -1이 반환
			if(dbPwd.equals(cust_pwd)) {
				re = 1;
			}else {
				re = 0;
			}
		}
		return re;
	}
	
	public static HashMap findId(String cust_name, String cust_phone) {
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		map.put("cust_name", cust_name);
		map.put("cust_phone", cust_phone);
		session.selectOne("customer.findId",map);
		session.close();
		return map;
	}
	
	public static HashMap findPwd(String cust_id, String cust_phone) {
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		map.put("cust_id", cust_id);
		map.put("cust_phone", cust_phone);
		session.selectOne("customer.findId",map);
		session.close();
		return map;
	}
	
	public static CustomerVO detailCustomer(String cust_id) {
		SqlSession session = factory.openSession();
		CustomerVO c = session.selectOne("customer.detailCustomer",cust_id);
		session.close();
		return c;
	}
	
	public static int updateCustomer(CustomerVO c) {
		SqlSession session = factory.openSession();
		int re = session.update("customer.updateCustomer",c);
		session.commit();
		session.close();
		return re;
	}
	
	public static CustomerVO showCustomer(String cust_id) {
		SqlSession session = factory.openSession();
		CustomerVO c = session.selectOne("customer.showCustomer",cust_id);
		session.close();
		return c;
	}
	
	public static String getRole(String cust_id) {
		SqlSession session = factory.openSession();
		String role = session.selectOne("customer.getRole",cust_id);
		session.close();
		return role;
	}
	
	//===================================================
	//qna
	
	public static QnaVO detailQna(int qna_no) {
		SqlSession session = factory.openSession();
		QnaVO q = session.selectOne("qna.detailQna",qna_no);
		session.close();
		return q;
	}
	
	public static int updateQna(QnaVO q) {
		SqlSession session = factory.openSession();
		int re = session.update("qna.updateQna",q);
		session.commit();
		session.close();
		return re;
	}
	
	public static int deleteQna(int qna_no) {
		SqlSession session = factory.openSession();
		int re = session.delete("qna.deleteQna",qna_no);
		session.commit();
		session.close();
		return re;
	}
	
	public static int getNextNo() {
		SqlSession session = factory.openSession();
		int no = session.selectOne("qna.getNextNo");
		session.close();
		return no;
	}
	
	public static List<QnaVO> listQna(String cust_id) {
		SqlSession session = factory.openSession();
		List<QnaVO> list = session.selectList("qna.listQna",cust_id);
		session.close();
		return list;
	}
	
	public static int insertQna(QnaVO q) {
		SqlSession session = factory.openSession();
		q.setQna_no(getNextNo());
		int re = session.insert("qna.insertQna",q);
		session.commit();
		session.close();
		return re;
	}
	
	public static int updateQna_answer(String qna_answer, int qna_no) {
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		map.put("qna_answer", qna_answer);
		map.put("qna_no", qna_no);
		int re=session.update("qna.update_answer",map);
		session.close();
		return re;
	}
	
	public static List<QnaVO> mgr_listQna(){
		SqlSession session = factory.openSession();
		List<QnaVO> list = session.selectList("qna.mgr_listQna");
		session.close();
		return list;
	}
	
	public static QnaVO mgr_detailQna(int qna_no) {
		SqlSession session = factory.openSession();
		QnaVO q = session.selectOne("qna.mgr_detailQna",qna_no);
		session.close();
		return q;
	}
	
	//===========================================
	//customer_order
	
	public static List<ListOrderVO> listOrder(String cust_id) {
		SqlSession session = factory.openSession();
		List<ListOrderVO> list = session.selectList("customer_order.listOrder",cust_id);
		session.close();
		return list;
	}
	
	public static List<OrderCancelVO> orderCancelPage(int order_no) {
		SqlSession session = factory.openSession();
		List<OrderCancelVO> list = session.selectList("customer_order.orderCancelPage", order_no);
		session.close();
		return list;
	}
	
	public static int orderCancelCheck(int order_no) {
		SqlSession session = factory.openSession();
		int re = session.update("customer_order.orderCancelCheck",order_no);
		session.commit();
		session.close();
		return re;
	}
	
	public static List<MonthTotalVO> monthTotal() {
		SqlSession session = factory.openSession();
		List<MonthTotalVO> list = session.selectList("customer_order.monthTotal");
		session.close();
		return list;
	}
	
	public static int insertCustomer_order(Customer_orderVO co) {
		SqlSession session = factory.openSession();
		int re = session.insert("customer_order.insertCustomer_order", co);
		session.commit();
		session.close();
		return re;
	}
	



	
	//=========================================
	//customerOrder_detail
	
	public static List<ListDetailVO> listDetail(int order_no) {
		SqlSession session = factory.openSession();
		List<ListDetailVO> list = session.selectList("customerOrder_detail.listDetail", order_no);
		session.close();
		return list;
	}
	
	public static int totalDetail(int order_no) {
		SqlSession session = factory.openSession();
		int re = session.selectOne("customerOrder_detail.totalDetail", order_no);
		session.close();
		return re;
	}
	
	public static int insertCustomerOrder_detail(CustomerOrder_detailVO cd) {
		SqlSession session = factory.openSession();
		int re=session.insert("customerOrder_detail.insertCustomerOrder_detail", cd);
		session.commit();
		session.close();
		return re;
	}
	
	//===========================================
	//customerOrder_refund
	
	public static int insertRefund(CustomerOrder_refundVO cr) {
		cr.setRefund_no(getNextNo());
		SqlSession session = factory.openSession();
		int re = session.insert("customerOrder_refund.insertRefund", cr);
		session.close();
		return re;
	}
	
	//===========================================
	//cart
	
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
	
	
	

	
	
}
