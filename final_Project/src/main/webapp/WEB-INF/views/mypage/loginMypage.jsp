<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/mypageCommon.css" type="text/css">
<link rel="stylesheet" href="../resources/css/loginMypage.css" type="text/css">
</head>
<body>
	<div id="container">
		<div><jsp:include page="../common/header.jsp"></jsp:include></div>
		<div class="page_article">
		
		
			<div id="snb">
				<h2 class="tit_snb">마이보글</h2>
				<div class="inner_snb">
					<ul class="list_menu">
						<li><a href="/mypage/orderList">주문 내역</a></li>
						<li><a href="/mypage/listReviewWrite">상품 후기</a></li>
						<li><a href="/mypage/listQna">상품 문의</a></li>
						<li><a href="/mypage/loginMypage">개인 정보 수정</a></li>
					</ul>
				</div>
			</div>


<!-- 마이페이지 메인에서 개인정보수정 탭을 누르면 이리로 온다 그리고 확인을 누르면 updateCustomer로 가기 -->
	<div id="lm_container">
		<div id="lm_title">
			<h2>개인 정보 수정</h2>
		</div>
		<h4>비밀번호 재확인</h4>
		<hr>
		<form action="loginMypage" method="post">
			<div id="lm_content">
				<div id="lm_id">
					아이디 <span id="lm_id_content"> ${cust_id }</span>
				</div>
				<div id="lm_pwd">
					비밀번호 <input id="lm_pwd_content" type="password" name="cust_pwd">
				</div>
			</div>
			<hr>
			<input id="lm_submit" type="submit" value="확인">
		</form>
	</div>
	
	
			</div>
		
	</div>
	<div><jsp:include page="../common/footer.jsp"></jsp:include></div>
</body>
</html>