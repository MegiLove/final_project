<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/mgr_detailProduct.css" type="text/css">
</head>
<body>
<div><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="mgr_list">
		<h2>상품 상세</h2>
		<br>

		<table id="product_box">
			<colgroup>
				<col style="width: 130px;">
				<col style="width: auto">
			</colgroup>
			<tbody>
				<tr id="pro_tr_no">
					<th>
						<div class="qna_name">상품번호</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_no">${p.product_no }</div>
					</td>
				</tr>
				<tr id="pro_tr_name">
					<th>
						<div class="qna_name">상품이름</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_name">${p.product_name }</div>
					</td>
				</tr>
				<tr id="pro_tr_price">
					<th>
						<div class="qna_name">상품가격</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_price">${p.product_price }</div>
					</td>
				</tr>
				<tr id="pro_tr_desc">
					<th>
						<div class="qna_name">상품설명</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_desc">${p.product_desc}</div>
					</td>
				</tr>
				<tr id="pro_tr_date">
					<th>
						<div class="qna_name">상품등록날짜</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_date">${p.product_date}</div>
					</td>
				</tr>
				<tr id="pro_tr_margin">
					<th>
						<div class="qna_name">상품할인여부</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_margin">${p.product_margin}</div>
					</td>
				</tr>
				<tr id="pro_tr_cate">
					<th>
						<div class="qna_name">카테고리 코드</div>
					</th>
					<td>
						<div class="qna_content" id="p_category_code">${p.category_code}</div>
					</td>
				</tr>
				
				<tr>
					<th>
						<div class="qna_name">상품상세사진</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_detail">
							<img src="../images/${p.product_detail }"
								onerror="this.style.display='none'" width="100" height="100">
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="qna_name">상품사진</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_img">
							<img src="../images/${p.product_img }"
								onerror="this.style.display='none'" width="100" height="100">
						</div>
					</td>
				</tr>
				
			</tbody>
		</table>

		<button type="button" onclick="location.href='mgr_updateProduct?product_no=${p.product_no }' " id="updatepro">상품수정</button>
	<button type="button" onclick="location.href='mgr_deleteProduct?product_no=${p.product_no }' " id="deletepro">상품삭제</button>
	</div>

	   <div><jsp:include page="../common/footer.jsp"></jsp:include></div>
</body>
</html>