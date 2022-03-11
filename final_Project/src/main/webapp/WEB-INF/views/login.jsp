<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/login.css" type="text/css">
<script type="text/javascript" src="http://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	Kakao.init("51f6f1b1862f38ef216edbad5ec912c9");
	function kakaoLogin() {
		Kakao.Auth.loginForm({
			scope:"profile_nickname,account_email,gender,age_range,birthday",
			success:function(authObj){
				console.log(authObj);
				Kakao.API.request({
					url:"/v2/user/me",
					success:function(res){
						console.log(res);
						let email = res.kakao_account.email;
						location.href="/KakaoLoginOK/"+email;
					}
				});
			}
		});
	}
</script>
</head>
<body>
	<div><jsp:include page="./common/header.jsp"></jsp:include></div>
	<!--id나 class에 login 붙이기 -->
	<h2 id="login_login">로그인</h2>
	<hr width="700px">
	
	<div id="login_container">
		<form action="login" method="post">
			<p id="login_id">
				<input class="login_content" type="text" placeholder="아이디를 입력해주세요" name="cust_id" >
			</p>	
			<p id="login_pwd">
				<input class="login_content" type="password" placeholder="비밀번호를 입력해주세요" name="cust_pwd" >
			</p>
			<p id="login_find">
				<a href="find_id">아이디 찾기</a>&nbsp;|&nbsp;<a href="find_pwd">비밀번호 찾기</a>
			</p>
			<input id="login_btn" type="submit" value="로그인"><a id="login_insert" href="insertCustomer">회원가입</a><br>
			<a id="login_kakao" href="javascript:kakaoLogin()">카카오톡으로 로그인하기<img id="login_kakaoImg" src="/images/kakao.PNG"></a>
		</form>
	</div>
	<div><jsp:include page="./common/footer.jsp"></jsp:include></div>
	
</body>
</html>