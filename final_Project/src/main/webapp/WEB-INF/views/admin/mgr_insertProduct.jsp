<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h2>상품등록</h2>
	<form action="mgr_insertProduct" method="post" enctype="multipart/form-data">
	    <input type="hidden" name="product_no" value="${product_no}"><br>
		상품이름 : <input type="text" name="product_name"><br>
		상품가격 : <input type="text" name="product_price"><br>
		상품설명 : <input type="text" name="product_desc"><br>
		카테고리 코드 : <input type="text" name="category_code"><br>
		상품상세사진<br>
		<input type="file" name="uploadFiledetail"><br>
		
		상품사진<br>
		<input type="file" name="uploadFile"><br>
		
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>

</body>
</html>