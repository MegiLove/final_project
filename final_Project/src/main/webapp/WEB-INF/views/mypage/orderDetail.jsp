<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="../resources/css/orderDetail.css" type="text/css">
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/mypageCommon.css" type="text/css">
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
				<h2 id="od_title">주문 내역 상세</h2><br>
				<div id="od_orderNo"><strong>주문번호 ${o.order_no }</strong></div>
				<hr id="od_hr"><br>
			</div> 
			
			<div id="od_form">
				
				<c:forEach var="o" items="${list }">
					
						<div class="od_box">
							<span class="info">
								<img src="../images/${o.product_img }" width="60" height="78">
								<div class="od_content">
									<div><strong>${o.product_name }</strong> </div>
									<span><strong>${o.product_price }&nbsp;원</strong></span>&nbsp;&nbsp;
									<span id="od_cnt"> 수량 : ${o.detail_cnt }</span>
									<span><strong id="od_status">${o.status_name }</strong></span>
								</div>
								
							</span>
							
						</div>
							
						<hr id="od_hr_under">
					
				</c:forEach>
			
				<br>
				<br>
				<br>
				<strong>결제정보</strong><br>
				<hr class="od_hr_Info"><br>
					<div class="od_under_Info">
						<div>
							상품금액<span class="od_payInfo_content">${totalDetail }&nbsp;원</span>
						</div>
						<div>
							배송비<span class="od_payInfo_content"> 3000 원</span>
						</div>
						<div>
							결제금액<span class="od_payInfo_content"> ${totalDetail +3000 }&nbsp;원</span>
						</div>
						<div>
							결제방법<span class="od_payInfo_content"> ${o.payment_name }</span>
						</div>
					</div>
				<br>
				
				<strong>배송정보</strong><br>
				<hr class="od_hr_Info"><br>
					<div class="od_under_Info">
						<div>
							받는 분 <span class="od_payInfo_content">${o.cust_name }</span>
						</div>
						<div>
							휴대폰 <span class="od_payInfo_content">${o.cust_phone }</span>
						</div>
						<div>
							주소 <span class="od_payInfo_content">${o.cust_addr1 }&nbsp;${o.cust_addr2 }&nbsp;${o.cust_addr3 }</span>
						</div>
					</div>
				
				<br>
				<br>
				<a id="od_btn" href="orderList">목록</a>
				<br>
				<br>
				<br>
		</div>
		
	
			
		</div>
		</div>
	</div>
	<div><jsp:include page="../common/footer.jsp"></jsp:include></div>
</body>
</html>