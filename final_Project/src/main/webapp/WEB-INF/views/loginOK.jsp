<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div><jsp:include page="./common/header.jsp"></jsp:include></div>
	${msg }

	<a href="main">메인으로 가기</a><br>
	 <c:if test="${cust_id eq 'bbox' }"> 
                <a href="admin/adminMain">관리자페이지로 가기</a><br>
        </c:if>

	<a href="main">메인으로 가기</a>
	<a href="/mypage/listQna">qna 가기</a>
	<a href="/mypage/updateCustomer">개인정보수정</a>
	<a href="/mypage/orderList">주문내역</a><br>
	<a href="logout">logout</a>

</body>
</html>