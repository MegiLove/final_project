<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/orderList.css" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
</head>
<body>
	<!-- 이름줄때 앞에 ol붙이기(orderlist) -->
	<div class="ol_container">
		<div id="ol_title">
			<h2>주문 내역</h2>
		</div>
		<hr id="ol_hr"><br>
		
		<div class="ol_form">
			<c:forEach var="o" items="${list }">
				<div id="ol_date"><fmt:formatDate value="${o.order_date }"/></div>
				
				<div class="ol_box" style="border: solid 1px">
					<div>
						<span id="ol_link_name">주문상세보기</span><a id="ol_detail_link" href="orderDetail?order_no=${o.order_no}">></a>
					</div>
					<hr width="650px">
					<div id="ol_content">
						<p>주문번호&nbsp;&nbsp;&nbsp;${o.order_no }</p>			
						<span>주문상태&nbsp;&nbsp;&nbsp;${o.status_name }</span><a id="ol_cancel" style="height: 30px; width: 80px;" href="orderCancelPage">주문취소</a>
					</div>					
				</div>	

			</c:forEach>
		</div>
	</div>
</body>
</html>