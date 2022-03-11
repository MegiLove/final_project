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
<hr width="1100px">
	<div id="findOK_msg">
		${msg }
	</div> 
	<div  id="find_main">
		<a href="main">메인으로 가기</a>
	</div>
	<div><jsp:include page="./common/footer.jsp"></jsp:include></div>
</body>
</html>