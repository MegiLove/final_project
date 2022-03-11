<%@page
	import="org.apache.catalina.filters.ExpiresFilter.XServletOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<link rel="stylesheet" href="../resources/css/common.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/orderPage.css" type="text/css">
</head>
<body>
	<div><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class=join_form>
	<div class="order_1">
	<h1>주문하기</h1>
	</div>
	<div class="order_2">
	<h3>주문자</h3>
	</div>
	<hr width="1000px">
	<form action="">
	<div class="order_form">
	
		이름<span class="order" id="order_name"><input type="text" name="name"><br> </span>
	
	
		휴대폰 번호<span class="order" id="order_phone"><input type="tel" name="phone"></span>	
	
	</div>
	</form>

	<h3>배송정보</h3>
	<hr width="1000px">
	<div>배송지</div>
	<input type="text" id="order_addr1" placeholder="우편번호">
	<input type="button" id="btnCheck" onclick="sample6_execDaumPostcode()"
		value="우편번호 찾기">
	<br>
	<input type="text" id="order_addr2" placeholder="주소">
	<br>
	<input type="text" id="order_addr3" placeholder="상세주소">
	<input type="text" id="sample6_extraAddress" placeholder="참고항목">
	<br>

	<h3>배송상품</h3>
	<hr width="1000px">
	<script>
		let today = new Date();
		let month = today.getMonth() + 1; // 월
		let date = today.getDate() + 1; // 날짜
		let day = today.getDay(); // 요일
		document.write(month + '/' + date + ' 도착 예정')
	</script>

	<%
	request.setCharacterEncoding("utf-8");
	String cpList = request.getParameter("cpList");
	System.out.println(cpList);
	%>


	<table style="width: 80%">
		<thead>
			<tr>
				<td>상품이미지</td>
				<td>상품이름</td>
				<td>수량</td>
				<td>가격</td>
			</tr>
		</thead>
		<tbody id="product_tbody"></tbody>
		<td id="totalSum" colspan=7 style="text-align: right;">총 상품 금액 :
			원</td>
	</table>

	<script>
		var cpList =
	<%=cpList%>
		function showcpList(cpList) {
			var tr_table = ""
			for (var i = 0; i < cpList.length; i++) {
				var tr_table = '<tr><td><img src="/images/'+cpList[i].product_img+'" width="100" height="100"></td><td>'
						+ cpList[i].product_name
						+ '</td><td>'
						+ cpList[i].product_cnt
						+ '개'
						+ '</td><td>'
						+ cpList[i].product_price + '원' + '</td></tr>'
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
			for (let i = 0; i < table.rows.length; i++) {
				sum += parseInt(table.rows[i].cells[3].innerHTML)
						* parseInt(table.rows[i].cells[2].innerHTML);
			}
			// 합계 출력
			console.log(sum);
			document.getElementById("totalSum").innerHTML = "총 상품 금액 : " + sum
					+ " 원";
		}
		calcSum();

		function OrderRequest() {
			var cpList =
				<%=cpList%>
			var orderList = new Array();
			for (var i = 0; i < cpList.length; i++) {
				var data = new Object();
				data.product_no    = cpList[i].product_no;
				data.product_img   = cpList[i].product_img;
				data.product_cnt   = cpList[i].product_cnt;
				data.cust_id       = cpList[i].cust_id;
				data.cart_no       = cpList[i].cart_no;
				data.product_name  = cpList[i].product_name;
				data.product_price = cpList[i].product_price;
				data.name= document.getElementsByName("name")[0].value;
				data.phone= document.getElementsByName("phone")[0].value;
			    data.order_addr1=document.getElementById("order_addr1").value;
			    data.order_addr2=document.getElementById("order_addr2").value;
			    data.order_addr3=document.getElementById("order_addr3").value;
			    //data.payment_code=document.getElementsByName("payment").value;
			    checkboxes 
			      = document.getElementsByName("payment");
			    checkboxes.forEach((cb) => {
				    if(cb.checked)data.payment_code = cb.value;
				  })
			    console.log(data);
				orderList.push(data);
			}
			console.log(orderList);
			
			if(orderList[0].payment_code == 0){
				//console.log(orderList[0].payment_code);
				
				var i_name = "";
				var i_price = 0;
				
				for(var i=0 ; i<orderList.length ; i++){
					i_name += orderList[i].product_name;
					if(i < orderList.length-1){
						i_name += ",";
					}
					i_price += parseInt(orderList[i].product_price)*parseInt(orderList[i].product_cnt);
				}
				
				i_price += 3000;
				//console.log(i_price);
				
				IMP.init("imp76937091");
				IMP.request_pay({ 
			          pg: "kcp",
			          pay_method: "card",
			          merchant_uid: "bogglebox" + new Date().getTime(),
			          name: i_name,
			          amount: i_price,
			          buyer_name: orderList[0].name,
			          buyer_tel: orderList[0].phone,
			      }, function (rsp) { 
			          if (rsp.success) {
			        	var jsonData = JSON.stringify(orderList);
			  			console.log(jsonData);

			  			var form = document.createElement('form'); // 폼객체 생성
			  			form.setAttribute('method', 'post'); //get,post 가능
			  			form.setAttribute('action', "/market/orderRequest"); //보내는 url
			  			document.charset = "utf-8";
			  			var objs;
			  			objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
			  			objs.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			  			objs.setAttribute('name', 'orderList'); // 객체이름
			  			objs.setAttribute('value', jsonData); //객체값
			  			objs.setAttribute('contentType', 'application/json');
			  			form.appendChild(objs);

			  			document.body.appendChild(form);
			  			form.submit();
			        	
			  			console.log("rsp:"+rsp);
			          } else {
			        	  alert('결제실패 : ' + response.error_msg);
			          }
			    });
			}else{
				var jsonData = JSON.stringify(orderList);
				console.log(jsonData);
	
				var form = document.createElement('form'); // 폼객체 생성
				form.setAttribute('method', 'post'); //get,post 가능
				form.setAttribute('action', "/market/orderRequest"); //보내는 url
				document.charset = "utf-8";
				var objs;
				objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
				objs.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				objs.setAttribute('name', 'orderList'); // 객체이름
				objs.setAttribute('value', jsonData); //객체값
				objs.setAttribute('contentType', 'application/json');
				form.appendChild(objs);
	
				document.body.appendChild(form);
				form.submit();
			}
			
		}
		
		
		
	</script>

	<h3>결제수단</h3>
	<hr>
	<input type="checkbox" name="payment" value="0" onclick='checkOnlyOne(this)'/>신용카드&nbsp;
	<input type="checkbox" name="payment" value="1" onclick='checkOnlyOne(this)'/>실시간 계좌이체&nbsp;
	<input type="checkbox" name="payment" value="2" onclick='checkOnlyOne(this)'/>휴대폰 결제
	<br>
	<input type="checkbox" name="payment" value="3" onclick='checkOnlyOne(this)'/>PAYCO&nbsp;&nbsp;&nbsp;
	<input type="checkbox" name="payment" value="4" onclick='checkOnlyOne(this)'/>kakaopay&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="checkbox" name="payment" value="5" onclick='checkOnlyOne(this)'/>Smilepay
	<br>
	
<script>
	function checkOnlyOne(element) {
		  
		  const checkboxes 
		      = document.getElementsByName("payment");
		  
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  
		  element.checked = true;
		}
</script>


	
		<button type="button" onclick="OrderRequest()" id="btnOrder">결제하기</button>
	</div>
		<div><jsp:include page="../common/footer.jsp"></jsp:include></div>

	<script
		src="${pageContext.request.contextPath}/resources/js/orderPage.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		//카카오 주소찾기 api
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
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
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('order_addr1').value = data.zonecode;
							document.getElementById("order_addr2").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("order_addr3")
									.focus();
						}
					}).open();
		}
	</script>
	<script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
</body>
</html>