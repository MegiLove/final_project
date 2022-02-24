<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1:1 문의 작성</h2>
	<form action="insertQna" method="post" enctype="multipart/form-data">
		번호  <input type="text" name="qna_no" value="${qna_no }"><br>
		제목  <input type="text" name="qna_title"><br>
		주문번호  <input type="text" name="detail_no"><br>
		문의내용  <textarea rows="10" cols="80" name="qna_content"></textarea><br>
		첨부파일  <input type="file" name="uploadFile"><br>
		<input type="reset" value="취소">
		<input type="submit" value="확인">
	</form>
</body>
</html>