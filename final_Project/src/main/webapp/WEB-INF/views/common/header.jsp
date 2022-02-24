<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="header">
		<section class="user-area"></section>	<!-- 로그인에 따라 바뀌는 곳 -->
		<div class="header_inner">
			<div class="header_sec">
				<h1 class="logo">
					<a href="/main"><img src="/images/BoggleBox_logo.jpg"></a>
				</h1>
				<div class="nb">
					<ul class="nb_list">
						<li><a href="market/listProduct?category_code=sp">카테고리</a>
							<ul class="drop-down">
								<li><a href="/market/listProduct?category_code=sp">국,찌개</a></li>
								<li><a href="/market/listProduct?category_code=d">반찬</a></li>
								<li><a href="/market/listProduct?category_code=s">샐러드</a></li>
								<li><a href="/market/listProduct?category_code=n">면류</a></li>
								<li><a href="/market/listProduct?category_code=r">밥,죽</a></li>
								<li><a href="/market/listProduct?category_code=b">베이커리</a></li>
								<li><a href="/market/listProduct?category_code=v">비건</a></li>
							</ul>
						</li>
						<li><a href="#">신제품</a></li>
					</ul>
				</div>
				<div></div>
			</div>
		</div>
	</div>
</body>
</html>