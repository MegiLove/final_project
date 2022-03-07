<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
</head>
<body>
	<div id="container">
		<div id="header"><jsp:include page="../common/header.jsp"></jsp:include></div>
		<div class="page_article">
			<div class="marketLsit">
				<div class="marketList_category"> 
					<ul class="tnb_inner">
						<li><a href="/market/listProduct?category_code=sp">국,찌개</a></li>
						<li><a href="/market/listProduct?category_code=d">반찬</a></li>
						<li><a href="/market/listProduct?category_code=s">샐러드</a></li>
						<li><a href="/market/listProduct?category_code=n">면류</a></li>
						<li><a href="/market/listProduct?category_code=r">밥,죽</a></li>
						<li><a href="/market/listProduct?category_code=b">베이커리</a></li>
						<li><a href="/market/listProduct?category_code=v">비건</a></li>
					</ul>
				</div>
				<div class="marketList_p">
					<div class="head">
						<ul class="list">
							<li><a href="/market/listProduct?orderType=product_date desc">최신순</a></li><br>
							<li><a href="/market/listProduct?orderType=product_price desc">높은가격순</a></li><br>
							<li><a href="/market/listProduct?orderType=product_price">낮은가격순</a></li><br>
						</ul>
					</div>
					<div class="box">
						<c:forEach var="p" items="${list }">
							<div class="box_list">
								<a href="/market/detailProduct?product_no=${p.product_no }"><img class="box_list_img" src="/images/${p.product_img }" width="400" height="400"></a>
								<div class="box_list_name" name="product_name">${p.product_name }</div>
								<div class="box_list_price" name="product_price">${p.product_price }</div>
							</div>
						</c:forEach>
					</div>
					<div class="pagenation">
						<c:forEach var="i" begin="1" end="${totalPage }">
							<a href="/market/listProduct?category_code=${category_code }&pageNUM=${i }">${i }</a>&nbsp;&nbsp;
						</c:forEach>
					</div> 
				</div>
			</div>
		</div>
		<div id="footer"><!-- 푸터 --></div>
	</div>
	
</body>
</html>