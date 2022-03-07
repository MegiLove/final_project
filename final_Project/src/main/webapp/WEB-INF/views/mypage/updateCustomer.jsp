<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/insertCustomer.css" type="text/css">
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
<!-- 이름줄때 앞에 join_ 붙이기 -->
	<div class="join_container">
		<div id="join_title">
			<h2>개인 정보 수정</h2>
		</div>
		<div id="join_essential">
			<label class="join_8">*</label>필수입력사항
		</div>
		<hr width="1000px">
		
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
</body>
</html>