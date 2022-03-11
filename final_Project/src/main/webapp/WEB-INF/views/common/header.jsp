<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/header.css" type="text/css">
<script type="text/javascript">
	$(function(){
		$(".cart_show").click(function(){
			if(${empty sessionScope.cust_id}){
				alert("로그인 한 회원만 가능합니다.");
				return;
			}else{
				location.href = "/market/cartProduct";
			}
		});
	});
</script>
</head>
<body>
	<div id="header">
		<section id="user-area">
		<!-- 로그인에 따라 바뀌는 곳 -->
			<c:choose>
				<c:when test="${not empty member }">
					<ul class="list-menu">
						<li>${member.cust_name }보글님</li>

						<c:if test="${cust_id eq 'bbox' }"> 
               				 <li><a href="http://localhost:8080/admin/adminMain">관리자페이지</a><br></li>
       				    </c:if>
						<li><a href="/mypage/orderList">마이페이지</a></li>
						<li><a href="/logout">로그아웃</a></li>

					</ul>
				</c:when>
				<c:otherwise>
					<ul class="list-menu">
						<li><a href="/insertCustomer">회원가입</a></li>
						<li><a href="/login">로그인</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</section>
		<div class="header_inner">
			<div class="header_sec">
				<h1 class="logo">
					<a href="/main"><img src="/images/BoggleBox_logo.jpg" style="width: 120px;"></a>
				</h1>
				<div class="nb">
					<ul class="nb_list">
						<li class="menu1">
							<a href="/market/listProduct?category_code=sp"><img src="/images/icon_nb.jpg">카테고리</a>
							<div id="sub-menu">
								<ul>
									<li><a href="/market/listProduct?category_code=sp">국,찌개</a></li>
									<li><a href="/market/listProduct?category_code=d">반찬</a></li>
									<li><a href="/market/listProduct?category_code=s">샐러드</a></li>
									<li><a href="/market/listProduct?category_code=n">면류</a></li>
									<li><a href="/market/listProduct?category_code=r">밥,죽</a></li>
									<li><a href="/market/listProduct?category_code=b">베이커리</a></li>
									<li><a href="/market/listProduct?category_code=v">비건</a></li>
								</ul>
							</div>
						</li>
						<li class="menu2"><a href="/market/recentProduct">신제품</a></li>
					</ul>
					<div class="cart_inner">
						<button class="cart_show"><img src="/images/icon_cart.png"></button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>