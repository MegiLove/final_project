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
</head>
<body>
	<div id="container">
		<div id="header"><jsp:include page="../common/header.jsp"></jsp:include></div>
		<div class="page_article">
			<div class="recentLsit">
				
				<div class="head">
					<ul class="list">
						<li><a href="/market/recentProduct?orderType=product_price desc">높은가격순</a></li><br>
						<li><a href="/market/recentProduct?orderType=product_price">낮은가격순</a></li><br>
					</ul>
				</div>
				<div class="list_goods">
					<ul class="list">
						<c:forEach var="r" items="${list }">
							<li>
								<div class="item">
									<a href="/market/detailProduct"><img class="box_list_img" src="/images/${r.product_img }" width="400" height="400"></a>
									<div class="box_list_name" name="product_name">${r.product_name }</div>
									<div class="box_list_price" name="product_price">${r.product_price }</div>
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