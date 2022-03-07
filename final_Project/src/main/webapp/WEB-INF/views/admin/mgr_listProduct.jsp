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
	<h2>상품목록</h2>
	<a href="mgr_insertProduct">상품등록</a>
	<hr>
	<table border="1" width="80%">
		<tr>
			<td>상품번호</td>
			<td>카테고리</td>
			<td>상품이름</td>
		</tr>
	
		<c:forEach var="p" items="${list }">
			<tr>
				<td>${p.product_no }</td>
				<td>${p.category_code }</td>
				<td><a href="mgr_detailProduct?product_no=${p.product_no }">${p.product_name }</a></td>
			</tr>
		</c:forEach>
		<div class="pagenation">
						<c:forEach var="i" begin="1" end="${mgr_totalPage }">
							<a href="/admin/mgr_listProduct?mgr_pageNUM=${i }">${i }</a>&nbsp;&nbsp;
						</c:forEach>
					</div>
	</table>
</body>
</html>