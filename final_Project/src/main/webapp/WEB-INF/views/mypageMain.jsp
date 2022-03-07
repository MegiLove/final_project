<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 마이페이지 메인에서 개인정보수정 탭을 누르면 이리로 온다 그리고 확인을 누르면 updateCustomer로 가기 -->
	<h2>개인 정보 수정</h2>
	<h3>비밀번호 재확인</h3>
	<hr>
	<form action="mypageMain" method="post">
		아이디 ${cust_id }<br>
		비밀번호 <input type="password" name="cust_pwd"><br>
		<hr>
		<input type="submit" value="확인">
	</form>
</body>
</html>