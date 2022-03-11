<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/mypageCommon.css" type="text/css">
<link rel="stylesheet" href="../resources/css/qna.css" type="text/css">
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
			
			<!-- 오른쪽 -->
			<div class="page_section">
				<!-- 제목 -->
				<div class="head_article" id="qna_head">
					<h2>1:1 문의</h2>
				</div> 
				
				<div id="qna_container">
					<div id="qna_name">
						<span class="qna_name" id="qna_no">번호</span> 
						<span class="qna_name">|</span> 
						<span class="qna_name" id="qna_title">제목</span> 
						<span class="qna_name">|</span> 
						<span class="qna_name" id="qna_date">작성일</span>
					</div>
						
					<c:forEach var="q" items="${list }">
						<div id="qna_content">
							<div id="qna_content_no">${q.qna_no }</div>
							<!-- <span class="qna_name" id="qna_div1">|</span> -->				
							<a id="qna_content_title" href="detailQna?qna_no=${q.qna_no }" >${q.qna_title }</a>
							<!-- <div class="qna_name" id="qna_div2">|</div> -->
							<div  id="qna_content_date"><fmt:formatDate value="${q.qna_date }"/><br></div>
							<!-- <div>
							<hr id="qna_hr">
							</div> -->
						</div>
					</c:forEach>
					<br>
					<div id="qna_insert"><a href="insertQna" style="color: white;">문의작성</a></div>
					<br>
					<br>
					
					<div id="qna_page">
						<c:forEach var="i" begin="1" end="${totalPage }">
							<a href="listQna?pageNUM=${i }">${i }</a>&nbsp;&nbsp;		
						</c:forEach>
					</div>
				</div>
			
			</div>
		</div>
		
	</div>
	<div><jsp:include page="../common/footer.jsp"></jsp:include></div>
	
</body>
</html>