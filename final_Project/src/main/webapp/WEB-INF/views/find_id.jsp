<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>아이디 찾기</h2>
	<hr>
	<h3>휴대폰 인증</h3>
	<form action="find_id" method="post">
		이름 : <br>
		<input type="text" placeholder="이름을 입력해주세요" name="cust_name"><br>
		휴대폰번호 : <br>
		<input type="tel" placeholder="휴대폰 번호를 입력해주세요" name="cust_phone"><br>
		<input type="submit" value="인증번호 받기">
	</form>
</body>
</html>