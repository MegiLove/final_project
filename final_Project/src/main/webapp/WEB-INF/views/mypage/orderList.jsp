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
<link rel="stylesheet" href="../resources/css/orderList.css" type="text/css">
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
				<h2 id="ol_title">주문 내역</h2>
				<hr id="ol_hr"><br>
			</div> 
			
			
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
							<span>주문상태&nbsp;&nbsp;&nbsp;${o.status_name }</span>
							 <c:if test="${o.status_name != '주문취소' }"> 
					            <a id="ol_cancel" style="height: 30px; width: 80px;" href="orderCancelPage?order_no=${o.order_no}">주문취소</a>
					        </c:if>		
							
						</div>					
					</div>	
	
				</c:forEach>
			</div>
			
		</div>
		
	</div>
	</div>
	<div><jsp:include page="../common/footer.jsp"></jsp:include></div>	
</body>
</html>