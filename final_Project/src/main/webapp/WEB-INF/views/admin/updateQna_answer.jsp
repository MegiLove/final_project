<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
</head>
<body>
	<h2>1:1문의 상세</h2>
	<br>
	<form action="updateQna_answer" method="post">
	 <input type="hidden" name="qna_no" value="${q.qna_no }">
	 <input type="hidden" name="qna_title" value="${q.qna_title }">
	 <input type="hidden" name="detail_no" value="${q.detail_no }">
	번호 ${q.qna_no}<br>
	제목  ${q.qna_title }<br>
	주문번호  ${q.detail_no}<br>
	문의 내용 <textarea rows="10" cols="80" name="qna_content" readonly="readonly">${q.qna_content }</textarea><br>
	첨부파일  <img src="/images/${q.qna_img }" width="100" height="100"><br>
	답글 		<textarea rows="10" cols="80" name="qna_answer">${q.qna_answer }</textarea><br>
	
	<input type="submit" value="확인">
	<input type="reset" value="취소">
	</form>
</body>
</html>