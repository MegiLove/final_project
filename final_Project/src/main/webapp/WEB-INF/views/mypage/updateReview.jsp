<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/updateReview.css" type="text/css">
<link rel="stylesheet" href="../resources/css/mypageCommon.css" type="text/css">
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function btnSubmit(){
		let review_title = $(".review_title").val();
		let review_content = $(".review_content").val();
		
		if(review_title != "" && review_content != ""){
			alert("후기를 작성해주셔서 감사합니다.");
			document.form_review.submit();
		}else{
			alert("내용을 작성해주십시오.");
			return;
		}
	}
</script>
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
					<h2>후기 작성</h2>
				</div>
				<form name="form_review" action="/mypage/updateReview" method="post" enctype="multipart/form-data" class="form_review">
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
										<input type="text" name="review_title" class="review_title" placeholder="제목을 입력해주세요.">
									</td>
								</tr>
								<tr>
									<th>후기내용</th>
									<td>
										<div class="wrap_content">
											<textarea id="fieldCmt" name="review_content" class="review_content" rows="10" cols="80" 
												placeholder="내용을 입력해주세요.반품/환불 문의는 상품문의로 가능합니다." style="height:202px;"></textarea>
										</div>
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
						<input class="btn_rs" type="reset" value="취소">
						<input class="btn_su" type="button" onclick="btnSubmit();" value="등록">
					</div>
				</form>
			</div>
		</div>
		<div><jsp:include page="../common/footer.jsp"></jsp:include></div>
	</div>
</body>
</html>