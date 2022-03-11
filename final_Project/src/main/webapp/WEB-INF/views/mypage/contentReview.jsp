<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/contentReview.css" type="text/css">
<link rel="stylesheet" href="../resources/css/mypageCommon.css" type="text/css">
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
			<div class="page_section">
				<div class="head_article">
					<h2>후기 상세</h2>
				</div>
				<div class="content_review">
					<div class="write_board">
						<div class="goods_info">
							<img src="/images/${c.product_img }">
							<div class="product_name">${c.product_name }</div>
						</div>
						<table class="tbl">
							<colgroup>
								<col style="width:110px;">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th>제목</th>
									<td>
										<div class="r_title">${c.review_title }</div>
									</td>
								</tr>
								<tr>
									<th>후기내용</th>
									<td>
										<textarea class="r_content" rows="10" cols="80">${c.review_content }</textarea>
									</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td>
										<img class="r_img" src="/images/${c.review_img }" onerror="this.style.display='none'">
									</td>
								</tr>
							</tbody>
						</table>
						<a class="btn_list" href="/mypage/listReviewComplete">목록</a>
						<a class="btn_del" href="/mypage/deleteReview/${c.review_no }">삭제</a>
					</div>
				</div>
			</div>
		</div>
		<div><jsp:include page="../common/footer.jsp"></jsp:include></div>
	</div>
</body>
</html>