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
				<td><br><input type="checkbox" name="cartBox" value="(product_price*product_cnt)" onClick="javascript:itemSum(checkBoxForm);"></td>
				<td> <input type="text" name="a" value="${loop.count}"></td>
				<td> <input type="text" name="product_no" value="${cp.product_no}"></td>
				<td> <input type="text" name="cart_no" value="${cp.cart_no}"></td>
				<td> <input type="text" name="cust_id" value="${cp.cust_id}"></td>
				<td>${cp.product_img}</td>
				<td>${cp.product_name}</td>
				<td>${cp.product_price}</td>
				<td>
				<form action="updatecnt" method="post">
				<input type="text" name="product_cnt" value="${cp.product_cnt}">
				</td>
				<td><br><button type="button" onclick="javascript:CartUpdate(product_cnt,product_no, cart_no, cust_id, ${loop.index})">변경</button>&emsp;</td>
				<td><button class="btn btndelete" onClick="Cartdelete()">삭제</button><td>				
			</tr>		
		</c:forEach>
	</table>
	</form>
	
	<script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>	
	
</body>
</html>