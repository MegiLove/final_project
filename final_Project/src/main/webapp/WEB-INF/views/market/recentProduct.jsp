<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/recentProduct.css" type="text/css">
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="container">
		<div><jsp:include page="../common/header.jsp"></jsp:include></div>
		<div class="page_article">
			<div class="recentLsit">
				<div class="head">
					<div class="sort_menu">
						<ul class="list">
							<li><a href="/market/recentProduct?orderType=product_price desc">높은가격순</a></li>
							<li><a href="/market/recentProduct?orderType=product_price">낮은가격순</a></li>
						</ul>
					</div>
				</div>
				<ul class="box">
					<c:forEach var="r" items="${list }">
						<li class="box_list">
							<a href="/market/detailProduct?product_no=${r.product_no }">
								<img class="box_list_img" src="/images/${r.product_img }" width="340">
							</a>
							<div class="box_list_title_wrap">
								<span class="box_list_sub">${r.product_desc }</span>
								<span class="box_list_title"><a href="/market/detailProduct?product_no=${r.product_no }">${r.product_name }</a></span>
							</div>
							<div class="box_list_price">
								<span class="box_list_price-origin">${r.product_price }원</span>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div><jsp:include page="../common/footer.jsp"></jsp:include></div>
	</div>
	
</body>
</html>