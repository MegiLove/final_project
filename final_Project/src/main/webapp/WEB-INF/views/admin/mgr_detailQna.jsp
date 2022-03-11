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
<link rel="stylesheet" href="../resources/css/common.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/mgr_detailQna.css"
	type="text/css">
</head>
<body>
	<div><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="mgr_list">
		<h2>1:1문의 상세</h2>
		<br>

		<table id="qna_box">
			<colgroup>
				<col style="width: 110px;">
				<col style="width: auto">
			</colgroup>
			<tbody>
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
							<img src="../images/${q.qna_img }"
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
							<textarea rows="10" cols="50" readonly="readonly">${q.qna_answer }</textarea>							
						</div>
					</td>
				</tr>
			</tbody>
		</table>

		<button type="button"
			onclick="location.href='updateQna_answer?qna_no=${q.qna_no }' "
			id="answer">답글달기</button>
		<button type="button" onclick="location.href='mgr_listQna' "
			id="listqna">목록</button>
	</div>
	<div><jsp:include page="../common/footer.jsp"></jsp:include></div>
</body>
</html>