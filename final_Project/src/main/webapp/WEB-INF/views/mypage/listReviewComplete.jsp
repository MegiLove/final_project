<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<div id="header"><!-- 헤더 --></div>
		<div class="page_article">
			<div><!-- 메뉴 --></div>
			<div class="page_section">
				<div class="head_article">
					<h2>상품 후기</h2>
				</div> 
				<div id="reviewView">
					<ul class="tab_menu">
						<li><a href="/mypage/listReviewWrite">작성가능 후기</a></li>
						<li><a href="/mypage/listReviewComplete">작성완료 후기</a></li>
					</ul>
				</div>
				<div id="reviewAfterList">
					<ul class="list_after">
						<c:forEach var="r" items="${list }">
							<li>
								<div>
									<div class="name"><a href="/mypage/contentReview?review_no=${r.review_no }">${r.product_name }</a></div>
									<div class="title">${r.review_title }</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div id="footer"><!-- 푸터 --></div>
	</div>
	
</body>
</html>