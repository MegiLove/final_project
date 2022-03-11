<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/mgr_insertProduct.css" type="text/css">
</head>
<body>
<div><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="mgr_list">
		<h2>상품 등록</h2>
		<br>
		<form action="mgr_insertProduct" method="post" enctype="multipart/form-data">
		<table id="product_box">
			<colgroup>
				<col style="width: 130px;">
				<col style="width: auto">
			</colgroup>
			<tbody>
			
				<input type="hidden" name="product_no" value="${product_no}">
				<tr id="pro_tr_name">
					<th>
						<div class="qna_name">상품이름</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_name"><input type="text" name="product_name"></div>
					</td>
				</tr>
				<tr id="pro_tr_price">
					<th>
						<div class="qna_name">상품가격</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_price"><input type="text" name="product_price"></div>
					</td>
				</tr>
				<tr id="pro_tr_desc">
					<th>
						<div class="qna_name">상품설명</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_desc"> <input type="text" name="product_desc"></div>
					</td>
				</tr>
				<tr id="pro_tr_cate">
					<th>
						<div class="qna_name">카테고리 코드</div>
					</th>
					<td>
						<div class="qna_content" id="p_category_code"> <input type="text" name="category_code"></div>
					</td>
				</tr>
				
				<tr>
					<th>
						<div class="qna_name">상품상세사진</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_detail">
							<input type="file" name="uploadFiledetail">
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="qna_name">상품사진</div>
					</th>
					<td>
						<div class="qna_content" id="p_product_img">
							<input type="file" name="uploadFile">
						</div>
					</td>
				</tr>
				
			</tbody>
		</table>
		<input type="submit" value="등록">
		<input type="reset" value="취소">		
	</form>
	</div>	
	
	   <div><jsp:include page="../common/footer.jsp"></jsp:include></div>
</body>
</html>