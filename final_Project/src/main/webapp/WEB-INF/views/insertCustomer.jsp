<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	
	function idCheck() {
		if(document.joinForm.cust_id.value == "" || document.joinForm.cust_id.value.length < 0){
			alert("아이디를 먼저 입력해 주세요")
			document.loginForm.cust_id.focus();
		}else{
			//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
			//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
			window.open("joinIdCheck.jsp?cust_id="+document.joinForm.cust_id.value,"","width=500, height=300");
		}
	}
	
	function checkId(){
        var id = $('#id').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'/user/idCheck', //Controller에서 인식할 주소
            type:'post', //POST 방식으로 전달
            data:{id:id},
            success:function(){
                console.log("처리 성공 시 변경되는 내용");
            },
            error:function(){
                alert("에러입니다");
            }
        });
    };
    
 // 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#cust_id").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#cust_id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/user/idCheck?cust_id='+ cust_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(idJ.test(user_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#reg_submit").attr("disabled", false);
				
						} else if(user_id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
</script>
</head>
<body>
	<h2>회원가입</h2>
	<h4>*필수입력사항</h4>
	<hr>
	<form action="insertCustomer" method="post" name="joinForm">
		아이디* : <input type="text" placeholder="6자 이상의 영문 혹은 숫자를 조합" name="cust_id" id="cust_id" size="27">
				<!-- <input type="button" onclick="idCheck()" value="중복확인"><br> -->
				<div id="id_check"></div>
		비밀번호* : <input type="password" placeholder="비밀번호를 입력해주세요" name="cust_pwd" id="cust_pwd" size="27"><br>
		
		비밀번호확인* : <input type="password" placeholder="비밀번호를 한번 더 입력해주세요" name="cust_pwd_ck" id="cust_pwd_ck" onkeyup="passConfirm()" size="27"> <span id ="confirmMsg"></span><br>
		
		이름* : <input type="text" placeholder="이름을 입력해주세요" name="cust_name" size="27"><br>
		
		휴대폰* : <input type="text" placeholder="숫자만 입력해주세요" name="cust_phone" size="27"><br>
		
		이메일* : <input type="text" placeholder="예) bogglebox@boggle.com" name="cust_email" size="27">
				<input type="submit" value="중복확인"><br>
		
		주소*	:	<input type="text" name="cust_addr1" id="cust_addr1" placeholder="우편번호" size="10"> 
           		<input type="button" value="우편번호찾기" onclick="kakaopost()"><br>
				<input type="text" name="cust_addr2" id="address" placeholder="도로명주소" size="27"><br>
				<input type="text" name="cust_addr3" placeholder="상세주소" size="27"><br>
		<br>
		<input type="submit" value="가입하기" onclick="checkCustomer()">
	</form>
</body>
</html>