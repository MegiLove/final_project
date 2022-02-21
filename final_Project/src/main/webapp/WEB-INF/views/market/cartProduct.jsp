<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

</head>
<body>
	<h2>장바구니</h2>
	<hr>
	<form name="checkBoxForm">
	<table border="1" width="80%">
		<c:forEach var="cp" items="${list }" varStatus="loop">
			<tr>
				<td><br><input type="checkbox" name="cartBox" onClick="javascript:itemSum(checkBoxForm, ${loop.index},${cp.product_price},${cp.product_cnt})"></td>
				 <input type="hidden" name="a" value="${loop.count}">
				 <input type="hidden" name="product_no" value="${cp.product_no}">
				 <input type="hidden" name="cart_no" value="${cp.cart_no}">
				 <input type="hidden" name="cust_id" value="${cp.cust_id}">
				<td name="product_img">${cp.product_img}</td>
				<td name="product_name">${cp.product_name}</td>
				<td name="product_price">${cp.product_price}</td>
				<td>
				<form action="updatecnt" method="post">
				<input type="text" name="product_cnt" value="${cp.product_cnt}">
				</td>
				<td><c:set var="result" value="${cp.product_price*cp.product_cnt}"/>${result}</td>
				<td><br><button type="button" onclick="javascript:CartUpdate(product_cnt,product_no, cart_no, cust_id, ${loop.index})">변경</button>&emsp;</td>
				<td><br><button type="button" onclick="javascript:CartDelete(cart_no, ${loop.index})">삭제</button>&emsp;</td>				
			</tr>		
		</c:forEach>
			
			<tr>
				<td colspan=7 style="text-align:right;">총 상품 금액 : <input name="total_sum" type="text" size="20" value="0" readonly></td>
			</tr>
			
			<tr align="center">
				<td colspan=7><button type="button" onclick="javascript:CheckOrder(checkBoxForm)">선택 상품 주문</button>
				&emsp;<button type="button" onclick="javascript:AllOrder(checkBoxForm);">전체 상품 주문</button></td>
			</tr>			
		
	</table>
	</form>
	
	<script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>	
	
</body>
</html>