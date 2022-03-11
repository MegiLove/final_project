<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/mgr_updateProduct.css" type="text/css">
</head>
<body>
<div><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="mgr_list">
		<h2>상품 수정</h2>
		<br>

		<table id="product_box">
			<colgroup>
				<col style="width: 130px;">
				<col style="width: auto">
			</colgroup>
			<tbody>
			<form action="mgr_updateProduct" method="post" enctype="multipart/form-data">
				<tr id="pro_tr_no">
					<th>
						<div class="qna_name">상품번호</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_no">${p.product_no }</div>
						<input type="hidden" name="product_no" value="${p.product_no }">
					</td>
				</tr>
				<tr id="pro_tr_name">
					<th>
						<div class="qna_name">상품이름</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_name"><input type="text" name="product_name" value="${p.product_name }"></div>
					</td>
				</tr>
				<tr id="pro_tr_price">
					<th>
						<div class="qna_name">상품가격</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_price"><input type="text" name="product_price" value="${p.product_price }"></div>
					</td>
				</tr>
				<tr id="pro_tr_desc">
					<th>
						<div class="qna_name">상품설명</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_desc"> <input type="text" name="product_desc" value="${p.product_desc }"></div>
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
						<div class="qna_content" id="p_product_margin"><input type="text" name="product_margin" value="${p.product_margin }"></div>
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
		<input type="submit" value="수정">
		</form>
	</div>	
		   <div><jsp:include page="../common/footer.jsp"></jsp:include></div>
</body>
</html>