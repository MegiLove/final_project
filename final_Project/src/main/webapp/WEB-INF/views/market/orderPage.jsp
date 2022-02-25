<%@page import="org.apache.catalina.filters.ExpiresFilter.XServletOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
		
	<h2>주문하기</h2>
	<h4>주문자</h4>
	<hr>
	<form action="orderPageOK" method="post">
		이름: <input type="text" name="name"><br> 휴대폰 번호:<input
			type="tel" name="phone">
	</form>

	<h4>배송정보</h4>
	<hr>
	<div>배송지</div>
  <input type="text" id="sample6_postcode" placeholder="우편번호">
  <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
  <input type="text" id="sample6_address" placeholder="주소"><br>
  <input type="text" id="sample6_detailAddress" placeholder="상세주소">
  <input type="text" id="sample6_extraAddress" placeholder="참고항목"><br>
  
  <h4>배송상품</h4>
	<hr>
	<script>
	let today = new Date();
	let month = today.getMonth() + 1;  // 월
	let date = today.getDate()+1;  // 날짜
	let day = today.getDay();  // 요일
	
	document.write(month + '/' + date + ' 도착 예정')
	</script>
	
  <%request.setCharacterEncoding("utf-8"); 
  	String cpList=request.getParameter("cpList");
  	System.out.println(cpList);
  %>
  
 
  <table border="1" width="80%">
  <thead>
			<tr>
				<td>상품이미지</td>
				<td>상품이름</td>
				<td>수량</td>
				<td>가격</td>
			</tr>
		</thead>
  <tbody id="product_tbody"></tbody>
 				<td id="totalSum" colspan=7 style="text-align:right;">총 상품 금액 : 원</td>
 </table>
 
  <script>
  	var cpList= <%=cpList%>
  	function showcpList(cpList){
  		console.log(cpList);
  		console.log(cpList.length);
  		var tr_table=""
  				for (var i = 0; i < cpList.length; i++) {  
  	  	            var tr_table = '<tr><td><img src="/images/'+cpList[i].product_img+'" width="100" height="100"></td><td>'+cpList[i].product_name+'</td><td>'+cpList[i].product_cnt+'개'+'</td><td>'+cpList[i].product_price+'원'+'</td></tr>'
  	  	            $("#product_tbody").append(tr_table);
  	  	        	console.log(tr_table);
  	  	        }			
  		 
  	}
  	showcpList(cpList);
  	
  	function calcSum() {
  	  // table element 찾기
  	  const table = document.getElementById('product_tbody');
  	  
  	  // 합계 계산
  	  let sum = 0;
  	  for(let i = 0; i < table.rows.length; i++)  {
  	    sum += parseInt(table.rows[i].cells[3].innerHTML)*parseInt(table.rows[i].cells[2].innerHTML);
  	  }
  	  // 합계 출력
  	  console.log(sum);
  	  document.getElementById("totalSum").innerHTML ="총 상품 금액 : " +sum+" 원";
  	}
  	calcSum();
  </script>
 
	<h4>결제수단</h4>
	<hr>
	<input type="checkbox" value="신용카드">신용카드
	<input type="checkbox" value="실시간 계좌이체">실시간 계좌이체
	<input type="checkbox" value="휴대폰 결제">휴대폰 결제<br>
	<input type="checkbox" value="PAYCO">PAYCO
	<input type="checkbox" value="kakaopay">kakaopay
	<input type="checkbox" value="Smilepay">Smilepay<br>
		
	<button type="button">결제하기</button>			
	
	<script
		src="${pageContext.request.contextPath}/resources/js/orderPage.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
	
	//카카오 주소찾기 api
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

</body>
</html>