<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>주문 내역 상세</h2>
	주문번호 ${o.order_no } <br>
	<table border="1">
		<c:forEach var="o" items="${list }">
			<tr>
				<%-- <td>${o.product_img }</td> --%>
				<td>${o.product_name }</td>
				<td><img src="../images/${o.product_img }" width="100" height="100"></td>
				<td>${o.product_price }</td>
				<td>${o.detail_cnt }</td>
				<td>${o.status_name }</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	결제정보
	<hr>
	상품금액 ${totalDetail }<br>
	배송비 3000원<br>
	결제금액 ${totalDetail +3000 }<br>
	결제방법 ${o.payment_name }<br>
	<br>
	배송정보
	<hr>
	받는 분 ${o.cust_name }<br>
	휴대폰 ${o.cust_phone }<br>
	주소 ${o.cust_addr1 }${o.cust_addr2 }${o.cust_addr3 }<br>
	
	<a href="orderList">목록</a>
</body>
</html>