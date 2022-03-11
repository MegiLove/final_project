<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="../resources/css/updateCustomer.css" type="text/css">
<link rel="stylesheet" href="../resources/css/mypageCommon.css" type="text/css">
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/footer.css" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function kakaopost() {
    new daum.Postcode({
        oncomplete: function(data) {
           document.querySelector("#cust_addr1").value = data.zonecode;
           document.querySelector("#address").value =  data.address
        }
    }).open();
}
function passConfirm() {
	
	var password = document.getElementById('cust_pwd');				//비밀번호 
	var passwordConfirm = document.getElementById('cust_pwd_ck');	//비밀번호 확인 값
	var confrimMsg = document.getElementById('confirmMsg');			//확인 메세지
	var correctColor = "#00ff00";
	var wrongColor ="#ff0000";
	
	if(password.value == passwordConfirm.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
		confirmMsg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
		confirmMsg.innerHTML ="비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
	}else{
		confirmMsg.style.color = wrongColor;
		confirmMsg.innerHTML ="비밀번호 불일치";
		return false;
	}
}
</script>
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
	<!-- 이름줄때 앞에 join_ 붙이기 -->
	<div class="join_container">
		<div >
			<h2 id="join_title">개인 정보 수정</h2>
		</div>
		<div id="join_essential">
			<label class="join_8">*</label>필수입력사항
		</div>
		<!-- <hr id="hr" width="700px"> -->
		
		<form action="updateCustomer" method="post" name="joinForm">
			<div class="join_form">
			
				<div class="join_box">
					<strong class="join_name">아이디</strong><label class="join_8">*</label>
						<span class="join_tag" id="join_tag_id">
							<input type="hidden" name="cust_id" value="${c.cust_id }"> ${c.cust_id }
						</span>
				</div> 
				
				<div class="join_box">
					<strong class="join_name">비밀번호</strong><label class="join_8">*</label>
						<span class="join_tag" id="join_tag_pwd">  
					  		<input type="password" name="cust_pwd" value="${c.cust_pwd }" id="cust_pwd" size="50"> 
					  	</span>
				</div>
				
				<div class="join_box">
					<strong class="join_name">비밀번호확인</strong><label class="join_8">*</label>
						<span class="join_tag" id="join_tag_pwdok">  
							<input type="password" name="cust_pwd_ck" id="cust_pwd_ck" onkeyup="passConfirm()" size="50"> <span id ="confirmMsg"></span><br>
						</span>
				</div>
				
				<div class="join_box">
					<strong class="join_name">이름</strong><label class="join_8">*</label>
						<span class="join_tag" id="join_tag_name">  
						  <input type="text" name="cust_name" value="${c.cust_name }" size="50"><br>
						</span>
				</div>
				
				<div class="join_box">
					<strong class="join_name">휴대폰</strong><label class="join_8">*</label>
						<span class="join_tag" id="join_tag_phone"> 
							<input type="text" name="cust_phone" value="${c.cust_phone }" size="50"><br>
						</span>
				</div>
				
				<div class="join_box">
					<strong class="join_name">이메일</strong><label class="join_8">*</label>
						<span class="join_tag" id="join_tag_email"> 
							<input type="hidden" name="cust_email" value="${c.cust_email }">  ${c.cust_email }
						</span>
				</div>
				
				<div class="join_box">
					<strong class="join_name">주소</strong><label class="join_8">*</label>
						<span class="join_tag" id="join_tag_addr">			
							<input type="text" name="cust_addr1" id="cust_addr1"value="${c.cust_addr1 }"size="10"> 
			           		<input type="button" value="우편번호찾기" onclick="kakaopost()" class="btnCheck" style="height: 30px; width: 100px;"><br>
							<input type="text" name="cust_addr2" value="${c.cust_addr2 }" id="address" size="50"><br>
							<input type="text" name="cust_addr3" id="cust_addr3" value="${c.cust_addr3 }" size="50"><br>
						</span>
				</div>
				
				<br>
				<input type="submit" value="확인"  id="join_submit" style="height: 40px; width: 150px;" onclick="checkCustomer()">
			</div>
			
		</form>
	</div>
	
		</div>
	
	</div>
	<div><jsp:include page="../common/footer.jsp"></jsp:include></div>
	<!-- <div id="footer" class="hd_footer">
		<div class="hd_footer_inner">
			<div class="hd_footer_left">
				<ul class="item">
					<li>회사소개</li>
					<li>이용약관</li>
					<li>개인정보처리방침</li>
					<li>맴버십프로그램</li>
				</ul>
				<div class="service">
					<strong class="service_title">고객센터</strong>
					<span class="service_tel">1800-0000</span>
					<p class="service_desc">
						평일,토요일 7:00~18:00
						<br>
						공휴일 7시 ~ 13시 (일요일 휴무)
					</p>
				</div>
			</div>
			<div class="hd_footer_right">
				<div class="company">
					<strong class="company_name">보글박스</strong>
					<div class="company_info">
						대표이사 : 일찍끝내조 | 사업장소재지 : 서울특별시 마포구 월드컵북로 21
						<br>
						사업자등록번호 : 211-12-1234
						호스팅 서비스 사업자 : (주)보글박스
					</div>
				</div>
				<em class="copyright">Copyright ⓒ2022 BOGGLE BOX. All Rights Reserved.</em>
			</div>
		</div>
	</div>
 -->
</body>
</html>