<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
</head>
<body>
	<div id="container">
		<div id="header"><!-- 헤더 --></div>
		<div class="page_article">
			<div><!-- 메뉴 --></div>
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
										<div name="review_title">${c.review_title }</div>
									</td>
								</tr>
								<tr>
									<th>후기내용</th>
									<td>
										<textarea id="fieldCmt" name="review_content" rows="10" cols="100" style="height:202px;">${c.review_content }</textarea>
									</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td>
										<img src="/images/${c.review_img }" onerror="this.style.display='none'">
									</td>
								</tr>
							</tbody>
						</table>
						<a href="/mypage/deleteReview/${c.review_no }">삭제</a>
					</div>
				</div>
			</div>
		</div>
		<div id="footer"><!-- 푸터 --></div>
	</div>
</body>
</html>