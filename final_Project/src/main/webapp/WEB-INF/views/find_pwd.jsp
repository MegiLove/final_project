<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>비밀번호 찾기</h2>
	<hr>
	<h3>휴대폰 인증</h3>
	
	<form action="find_pwd" method="post">
		아이디 <br>
		<input type="text" placeholder="아이디를 입력해주세요" name="cust_id"><br>
		휴대폰번호  <br>
		<input type="text" placeholder="휴대폰 번호를 입력해주세요" name="cust_phone"><br>
		<input type="submit" value="비밀번호찾기">
	</form>
</body>
</html>