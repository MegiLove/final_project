<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/listReviewWrite.css" type="text/css">
<link rel="stylesheet" href="../resources/css/mypageCommon.css" type="text/css">
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
			<div class="page_section">
				<div class="head_article">
					<h2>상품 후기</h2>
				</div> 
				<div id="reviewView">
					<ul class="tab_menu">
						<li class="tab_menu_w">
							<a href="/mypage/listReviewWrite" style="color: #F26835;">작성가능 후기</a>
						</li>
						<li class="tab_menu_c">
							<a href="/mypage/listReviewComplete">작성완료 후기</a>
						</li>
					</ul>
				</div>
				<div id="reviewBeforeList">
					<ul class="list_before">
						<c:forEach var="r" items="${list }">
							<li>
								<div class="no_before">주문번호  ${r.order_no }</div>
								<div class="goods_before">
									<div class="goods_info">
										<img src="/images/${r.product_img }" width="80px" height="80px" onerror="this.style.display='none'">
										<div class="goods_name">${r.product_name }</div>
									</div>
									<div class="btn_write">
										<span class="inner_btn">
											<a href="/mypage/updateReview?review_no=${r.review_no }">후기작성</a>
										</span>
									</div>
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