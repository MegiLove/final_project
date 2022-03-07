<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<script type="text/javascript">
	$(function(){
		$("#btnSubmit").click(function(){
			alert("후기를 작성해주셔서 감사합니다.");
		});
	});
</script>
</head>
<body>
	<div id="container">
		<div id="header"><!-- 헤더 --></div>
		<div class="page_article">
			<div><!-- 메뉴 --></div>
			<div class="page_section">
				<div class="head_article">
					<h2>후기 작성</h2>
				</div>
				<form name="form_review" id="form_review" action="/mypage/updateReview" method="post" enctype="multipart/form-data">
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
									<td><input type="hidden" name="review_no" value="${r.review_no }"></td>
								</tr>
								<tr>
									<th>제목</th>
									<td>
										<input type="text" name="review_title" placeholder="제목을 입력해주세요.">
									</td>
								</tr>
								<tr>
									<th>후기내용</th>
									<td>
										<textarea id="fieldCmt" name="review_content" rows="10" cols="100" 
											placeholder="내용을 입력해주세요.반품/환불 문의는 상품문의로 가능합니다." style="height:202px;"></textarea>
									</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td>
										<input type="hidden" name="review_img">
										<input type="file" name="uploadFile">
									</td>
								</tr>
								<tr>
									<td><input type="hidden" name="review_code" value="1"></td>
								</tr>
							</tbody>
						</table>
						<input type="submit" id="btnSubmit" class="btn_reg" value="등록">
					</div>
				</form>
			</div>
		</div>
		<div id="footer"><!-- 푸터 --></div>
	</div>
</body>
</html>