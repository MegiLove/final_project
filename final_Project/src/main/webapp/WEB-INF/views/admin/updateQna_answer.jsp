<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/updateQna_answer.css" type="text/css">
</head>
<body>
<div><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="mgr_list">
		<h2>1:1문의 답글달기</h2>
		<br>
		<form action="updateQna_answer" method="post"  enctype="multipart/form-data">
		<table id="qna_box">
			<colgroup>
				<col style="width: 110px;">
				<col style="width: auto">
			</colgroup>
			<tbody>
				 <input type="hidden" name="qna_no" value="${q.qna_no }">
				 <input type="hidden" name="qna_title" value="${q.qna_title }">
	 			<input type="hidden" name="detail_no" value="${q.detail_no }">
				<tr id="qna_tr_number">
					<th>
						<div class="qna_name">글 번호</div>
					</th>
					<td>
						<div class="qna_content" id="q_qna_no">${q.qna_no }</div>
					</td>
				</tr>
				<tr id="qna_tr_title">
					<th>
						<div class="qna_name">제목</div>
					</th>
					<td>
						<div class="qna_content" id="q_qna_title">${q.qna_title }</div>
					</td>
				</tr>
				<tr id="qna_tr_date">
					<th>
						<div class="qna_name">작성일자</div>
					</th>
					<td>
						<div class="qna_content" id="q_qna_date">${q.qna_date }</div>
					</td>
				</tr>
				<tr id="qna_tr_no">
					<th>
						<div class="qna_name">주문번호</div>
					</th>
					<td>
						<div class="qna_content" id="q_detail_no">${q.detail_no}</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="qna_name">문의 내용</div>
					</th>
					<td>
						<div class="qna_content" id="q_qna_content">
							<textarea rows="10" cols="50"
								readonly="readonly">${q.qna_content }</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="qna_name">첨부파일</div>
					</th>
					<td>
						<div class="qna_content" id="q_qna_img">
							<img src="/images/${q.qna_img }" 
								onerror="this.style.display='none'" width="100" height="100">
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="qna_name">답글</div>
					</th>
					<td>
						<div class="qna_content" id="q_qna_answer">
							<textarea rows="10" cols="50" name="qna_answer">${q.qna_answer }</textarea>							
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		

	<input type="submit" value="확인">
	<input type="reset" value="지우기">
	</form>
	</div>
			   <div><jsp:include page="../common/footer.jsp"></jsp:include></div>
</body>
</html>