<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- slick 라이브러리 추가 -->
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/main.css" type="text/css">
<script type="text/javascript">
	$(document).ready(function(){
		$(".slide_div").slick(
			{
				dots:false,
				autoplay:true,
				autoplaySpeed:3000
			}		
		);
	});
</script>
</head>
<body>
	<div id="container">
		<div><jsp:include page="common/header.jsp"></jsp:include></div>
		<div id="main">
			<div class="banner-sect">
				<div class="slide_div">
					<div>
						<a><img src="/images/banner1.jpg" width="100%"></a>
					</div>
					<div>
						<a><img src="/images/banner2.jpg" width="100%"></a>
					</div>
					<div>
						<a><img src="/images/banner3.jpg" width="100%"></a>
					</div>
				</div>
			</div>
			<div class="discount-sect"></div>
			<div class="best-sect"></div>
		</div>
		<div><!-- 푸터 --></div>
	</div>
</body>
</html>