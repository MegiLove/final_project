<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="../resources/css/orderCancelPage.css" type="text/css">
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/mypageCommon.css" type="text/css">
<link rel="stylesheet" href="../resources/css/footer.css" type="text/css">
</head>
<body>
	<div id="container">
		<div><jsp:include page="../common/header.jsp"></jsp:include></div>
		<div class="page_article">
		
		
			<div id="snb">
				<h2 class="tit_snb">마이보글</h2>
				<div class="inner_snb">
					<ul class="list_menu">
						<li><a href="/mypage/orderList">주문 내역</a></li>
						<li><a href="/mypage/listReviewWrite">상품 후기</a></li>
						<li><a href="/mypage/listQna">상품 문의</a></li>
						<li><a href="/mypage/loginMypage">개인 정보 수정</a></li>
					</ul>
				</div>
			</div>
		


		<!-- 오른쪽 -->
		<div class="page_section">
			<!-- 제목 -->
			<div class="head_article">
				<h2 id="oc_title">주문 취소 신청</h2>
				<hr id="oc_hr">
			</div> 
			<div id="oc_form">
				<form action="orderCancelPage" method="post">
				<div id="oc_date">				
					<p>
						주문일시<br>
						<strong><fmt:formatDate value="${o.order_date }"/></strong>
					</p>
					<p>
						주문번호<br>
						<strong>${o.order_no }</strong>
						<input type="hidden" value="${o.order_no }" name="order_no">
					</p>
				</div>
				<hr id="oc_hr_date">
				<br>
				<div id="oc_ship">
					<!-- 반복문돌아야할듯 -->
					<h3>배송정보</h3>
					<div id="oc_ship_container">
						<div id="oc_ship_name">
							<div id="cust_name">${o.cust_name }</div>
						</div>
						<hr id="oc_hr_name">
						<c:forEach var="o" items="${list }">
							<div class="oc_box">
								<div id="oc_img">
									<img id="img" src="../images/${o.product_img }" width="60" height="60">
								</div>
								<div class="oc_content">
									<div><strong>${o.product_name }</strong> </div>
									<span><strong>${o.detail_price }&nbsp;원</strong></span>&nbsp;&nbsp;
									<span id="oc_cnt"> 수량 : ${o.detail_cnt }</span>
								</div>
							</div>
							<hr id="oc_hr_info">
						</c:forEach>
						
					</div>
				</div>
				<br>
				<!-- 환불테이블에 수정, 등록시 취소사유가 같이 가야한다..-->
				<h3>취소사유</h3>
				<div id="oc_select">
					<select name="refund_code" id="oc_select_box" style="width: 400px; height: 30px;">
						<option value="0">단순변심</option>
						<option value="1">상품불량</option>
						<option value="2">배송지연</option>
						<option value="3">배송정보와 상이</option>
						<option value="4">기타</option>
					</select>
				</div>
				<br>
				
				<h3>환불정보</h3>
				<div id="oc_refund">
					<div id="oc_refund_payment">
						<div id="oc_refund_name">
							결제방법 <span id="oc_payment_name"> ${o.payment_name }</span>
						</div>
					</div>
					
					<div id="oc_refund_price">
						<div id="oc_price_content">
						주문금액 <span class="oc_totalDetail">${totalDetail }</span>
						<hr id="oc_refund_hr" width="300px">
						환불예정금액 <span class="oc_totalDetail">${totalDetail }</span>
						</div>
					</div>
					
				</div>
				<div>
				<input id="btn_reset" class="oc_btn" type="reset" value="취소"><input id="btn_submit" class="oc_btn" type="submit" value="주문 취소 신청">
				</div>
				</form>
		
				</div>
			</div>
		
	</div>
	</div>
	<div><jsp:include page="../common/footer.jsp"></jsp:include></div>
</body>
</html>