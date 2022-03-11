<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="../resources/css/find.css" type="text/css">
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
</head>
<body>
<div><jsp:include page="./common/header.jsp"></jsp:include></div>
	<div id="find_title">
		<h2>아이디 찾기</h2>
	</div>
	<hr width="700px">

	<div id="find_method">
		<h4>휴대폰 인증</h4>
	</div>
	<div id="find_container">
		<form action="find_id" method="post">
			<p>이름</p> 
			<input class="find_content" type="text" placeholder="이름을 입력해주세요" name="cust_name"><br>
			<p>휴대폰번호</p>
			<input class="find_content" type="text" placeholder="휴대폰 번호를 입력해주세요" name="cust_phone"><br>
			<input id="find_submit" type="submit" value="아이디찾기">
		</form>
	</div>
	<div><jsp:include page="./common/footer.jsp"></jsp:include></div>
</body>
</html>