<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="../resources/css/mypageCommon.css" type="text/css">
<link rel="stylesheet" href="../resources/css/insertCustomerOK.css" type="text/css">
</head>
<body>
<div><jsp:include page="./common/header.jsp"></jsp:include></div>
	<h2 id="join">회원가입</h2>
	<hr width="700px">
	<div id="msg"> ${msg } </div>
	<a id="od_btn" href="login">로그인하기</a>
	<div><jsp:include page="./common/footer.jsp"></jsp:include></div>
</body>
</html>