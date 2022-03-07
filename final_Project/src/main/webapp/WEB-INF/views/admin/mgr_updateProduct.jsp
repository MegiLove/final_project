<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
</head>
<body>
	<h2>상품수정</h2>
	<hr>
	<form action="mgr_updateProduct" method="post" enctype="multipart/form-data">
		상품번호: ${p.product_no }
		<input type="hidden" name="product_no" value="${p.product_no }"><br>
		상품이름 : <input type="text" name="product_name" value="${p.product_name }"><br>
		상품가격 : <input type="text" name="product_price" value="${p.product_price }"><br>
		상품설명 : <input type="text" name="product_desc" value="${p.product_desc }"><br>
		상품등록날짜 :  ${p.product_date }<br>
		상품할인여부 : <input type="text" name="product_margin" value="${p.product_margin }"><br>
		카테고리 코드 : ${p.category_code }<br>
		상품상세사진 :
		<img src="/images/${p.product_detail }" width="30" height="30"><br>
		<input type="hidden" name="product_detail" value="${p.product_detail }">
		<input type="file" name="uploadFiledetail"><br>
		
		상품사진 : 
		<img  src="images/${p.product_img }" width="30" height="30"><br>
		<input type="hidden" name="product_img" value="${p.product_img }">
		<input type="file" name="uploadFile"><br>
		
		<input type="submit" value="수정">
	</form>
</body>
</html>