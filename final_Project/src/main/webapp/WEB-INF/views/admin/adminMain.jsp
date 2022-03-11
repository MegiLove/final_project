<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/adminMain.css" type="text/css">
</head>
<body>
<div><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="admin_list">
<h2>관리자 페이지</h2>
	<div class="box" id="box1">
	<a href="mgr_listProduct"> <img class="mgr_product" src="/images/상품관리.png" style=display:block; width="200" height="200"/>상품관리</a><br>
	</div>
	<div class="box" id="box2">
	<a href="mgr_listQna"> <img class="mgr_qna" src="/images/상품문의.png" style=display:block; width="200" height="200"/>상품문의답글</a><br>
	</div>
	<div class="box" id="box3">
	<a href="category_sale"> <img class="category" src="/images/카테고리별 판매량.png" style=display:block; width="200" height="200"/>카테고리별판매량</a><br>
	</div>
	<div class="box" id="box4">
	<a href="monthTotal.html"> <img class="month" src="/images/월별 총매출.png" style=display:block; width="200" height="200"/>월별총매출</a><br>
	</div>
	<div class="return">
	<a href="http://localhost:8080/main">쇼핑몰 메인으로</a><br>
	</div>
	</div>
	<div><jsp:include page="../common/footer.jsp"></jsp:include></div>
	
</body>
</html>