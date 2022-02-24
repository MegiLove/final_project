<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1:1문의 상세</h2>
	<br>
	번호 ${q.qna_no}<br>
	제목  ${q.qna_title }<br>
	주문번호  ${q.detail_no}<br>
	문의 내용 <textarea rows="10" cols="80" readonly="readonly">${q.qna_content }</textarea><br>
	첨부파일  <img src="../images/${q.qna_img }" width="100" height="100"> <br>
	<a href="updateQna?qna_no=${q.qna_no }">수정</a>
	<a href="listQna">목록</a>
</body>
</html>