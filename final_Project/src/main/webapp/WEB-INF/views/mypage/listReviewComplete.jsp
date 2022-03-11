<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/mypageCommon.css" type="text/css">
<link rel="stylesheet" href="../resources/css/listReviewComplete.css" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
					<h2>상품 후기</h2>
				</div> 
				
				<div id="reviewView">
					<ul class="tab_menu">
						<li class="tab_menu_w">
							<a href="/mypage/listReviewWrite">작성가능 후기</a>
						</li>
						<li class="tab_menu_c">
							<a href="/mypage/listReviewComplete" style="color: #F26835;">작성완료 후기</a>
						</li>
					</ul>
				</div>
				<div id="reviewAfterList">
					<ul class="list_after">
						<c:forEach var="r" items="${list }">
							<li>
								<div class="no_after">
									<span>주문번호   ${r.order_no }</span>
								</div>
								<div class="cont_after">
									<a href="/mypage/contentReview?review_no=${r.review_no }">${r.review_title }</a>
									<div class="name_after">${r.product_name }</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div><jsp:include page="../common/footer.jsp"></jsp:include></div>
	</div>
	
</body>
</html>