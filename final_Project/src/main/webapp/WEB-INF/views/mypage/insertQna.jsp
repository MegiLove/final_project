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
<link rel="stylesheet" href="../resources/css/qnaDetail.css" type="text/css">
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
					<h2>1:1 문의 작성</h2>
				</div>
			
			<form action="insertQna" method="post" enctype="multipart/form-data">
			<table id="qna_box">
				<colgroup>
					<col style="width:110px;">
					<col style="width:auto">
				</colgroup>
					<tbody>
						<%-- <tr id="qna_tr_title">
							<th>
								<div class="qna_name">글 번호</div>
							</th>
							<td>
								<div class="qna_content" id="q_qna_no">${qna_no }<input type="hidden" name="qna_no" value="${qna_no }"></div>
							</td>
						</tr> --%>
						<tr id="qna_tr_title">
							<th>
								<div class="qna_name">제목</div>
							</th>
							<td>
								<div class="qna_content" id="q_qna_title"><input placeholder="제목을 입력해주세요" type="text" name="qna_title" style="height: 25px; width: 340px;"></div>
							</td>
						</tr>
						<tr id="qna_tr_no">
							<th>
								<div class="qna_name">주문번호</div>
							</th>
							<td>
								<div class="qna_content" id="q_detail_no_"><input placeholder="20220310001" type="text" name="detail_no" style="height: 25px; width: 100px;"></div>
							</td>
						</tr>
						<tr>
							<th>
								<div class="qna_name">문의 내용</div>
							</th>
							<td>
								<div class="qna_content" id="q_qna_content"><textarea placeholder="내용을 입력해주세요" name="qna_content" rows="10" cols="50"></textarea></div>
							</td>
						</tr>
						<tr>
							<th>
								<div class="qna_name">첨부파일</div>
							</th>
							<td>
								<div class="qna_content" id="q_qna_img"><input type="file" name="uploadFile"></div>
							</td>
						</tr>
				
						</tbody>
					</table>
					<br>
					<br>
					<div style="margin-left: 200px;">
						<input class="insert" type="reset" value="취소">
						<input class="insert" type="submit" value="확인">
					</div>
			</form>
	
			</div>
		
	</div>
	</div>
	<div><jsp:include page="../common/footer.jsp"></jsp:include></div>
</body>
</html>