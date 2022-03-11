<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- slick 라이브러리 추가 -->
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="../resources/js/main.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/main.css" type="text/css">
</head>
<body>
	<div id="container">
		<div><jsp:include page="common/header.jsp"></jsp:include></div>
		<div id="main">
			<div class="banner-sect">
				<div class="slide_div">
					<div>
						<a><img src="/images/banner1.jpg" width="100%"></a>
					</div>
					<div>
						<a><img src="/images/banner2.jpg" width="100%"></a>
					</div>
					<div>
						<a><img src="/images/banner3.jpg" width="100%"></a>
					</div>
				</div>
			</div>
			<div class="best-sect">
				<div class="b-post-slider">
					<h1 class="b-slider-title">인기상품 TOP8</h1>
					<button class="btn-b prev"><img src="/images/icon_arrowL.jpg"></button>
					<button class="btn-b next"><img src="/images/icon_arrowR.jpg"></button>
					<div class="b-post-wrapper">
						<c:forEach var="b" items="${bList }">
							<div class="post">
								<div class="post-img" style="width: 250px; height: 250px;">
									<a href="/market/detailProduct?product_no=${b.product_no }">
										<img src="/images/${b.product_img }" style="width: 100%; height: 100%;">
									</a>
								</div>
								<div class="post-info">
									<div class="post-desc">${b.product_desc }</div>
									<h3><a href="/market/detailProduct?product_no=${b.product_no }">${b.product_name }</a></h3>
									<div class="post-price">${b.product_price }원</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="event-sect">
				<div class="post-event">
					<img src="/images/event1.jpg">
				</div>
			</div>
			<div class="discount-sect">
				<div class="m-post-slider">
					<div class="m-slider-right">
						<h1 class="m-slider-title">할인상품</h1>
						<div>지금 사면 혜택도, 건강도 득템</div>
					</div>
					<div class="m-slider-left">
						<div class="m-post-wrapper">
							<c:forEach var="m" items="${mList }">
								<div class="post">
									<div class="post-list">
										<div class="post-img" style="width: 200px; height: 200px;">
											<a href="/market/detailProduct?product_no=${m.product_no }">
												<img src="/images/${m.product_img }" style="width: 100%; height: 100%;">
											</a>
										</div>
										<div class="post-title-wrap">
											<span class="post-desc">${m.product_desc }</span>
											<span class="post-title">
												<a href="/market/detailProduct?product_no=${m.product_no }">${m.product_name }</a>
											</span>
										</div>
										<span class="post-price">
											<span class="post-price-discounted-rate">10%</span>
											<del class="post-price-origin">${m.product_price }원</del>
											<span class="post-price-discounted">${m.product_mprice }원</span>
										</span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div><jsp:include page="common/footer.jsp"></jsp:include></div>
	</div>
</body>
</html>