<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../../resources/js/detailProduct.js" type="text/javascript"></script>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/detailProduct.css" type="text/css">
<style type="text/css">
	.review-accordion{
		display: none;
	}
	.qna-accordion{
		display: none;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".qna_title").click(function(){
			$(this).siblings(".qna-accordion").toggle("slow");
		});
		
		$(".review_title").click(function(){
			$(this).siblings(".review-accordion").toggle("slow");
		});
	});
</script>
</head>
<body>
	<div id="container">
		<div><jsp:include page="../common/header.jsp"></jsp:include></div>
		
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">구매하시는 상품의 수량을 선택해주세요.</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="product-body">
							<div class="modal-img-section">
								<img class="product-img" src="/images/${p.product_img }">
							</div>
							<div class="modal-info-section">
								<div class="modal-info-name">
									<span>${p.product_name}</span>
								</div>
								<div class="modal-info-cnt" align="center">
									<div>
										<span id="left-Button" onclick="leftButton(this)">&laquo;</span>&nbsp;
										<span id="product_cnt" style="font-weight: lighter;">1</span>&nbsp;
										<span id="right-Button" onclick="rightButton(this)">&raquo;</span>
									</div>
								</div>
								<div class="modal-info-price" align="center">
									<span id="product_price">${p.product_price}</span>
									<span>원</span>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" align="center">
						<button type="button" class="btn btn-primary" onclick="insertCart()">장바구니에 담기</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">쇼핑 계속하기</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="page_article">
			<div class="top-section">
				<div class="top-left-section">
					<div class="img-wrap">
						<img id="img" src="/images/${p.product_img }">
					</div>
				</div>
				<div class="top-right-section">
					<p class="info-area_desc">${p.product_desc}</p>
					<h3 class="info-area_name">${p.product_name}</h3>
					<div class="info-area-price">
						<span class="info-area_origin">${p.product_price}원</span>
					</div>
					<div class="info-area_box">
						<div class="info-area_box-list">
							<div class="info-area_box_tit">배송비</div>
							<div class="info-area_box_cont">
								<strong>3000원</strong>
							</div>
						</div>
						<div class="info-area_box-list">
							<div class="info-area_box_tit">판매자</div>
							<div class="info-area_box_cont">
								<div>보글박스</div>
							</div>
						</div>
					</div>
					<div class="hidden-info">
						<span id="cust_id" style="display:none;">${cust_id }</span>
						<span id="product_no" style="display:none;">${p.product_no }</span>
					</div>
					<div class="div-top-section button-wrap">
						<button type="button" class="btn btn-outline-primary top-button" data-bs-toggle="modal" data-bs-target="#exampleModal">장바구니 담기</button>
					</div>
				</div>
			</div>
			
			<div class="marketDetail_sect">
				<div class="tap-section">
					<ul class="tap-section_inner">
						<li id="detailButton" class="tab-section_list" onclick="detailTap()">
							<span class="tap-change" id="d_tap">상품정보</span>
						</li>
						<li id="reviewButton" class="tab-section_list" onclick="reviewTap()">
							<span class="tap-change" id="r_tap">상품후기</span>
						</li>
						<li id="qnaButton" class="tab-section_list" onclick="qnaTap()">
							<span class="tap-change" id="q_tap">상품문의</span>
						</li>
						<li id="exchangeButton" class="tab-section_list" onclick="exchangeTap()">
							<span class="tap-change" id="e_tap">교환/반품</span>
						</li>
					</ul>
				</div>
			
				<div class="bottom-section">
					<div class='review-wrap' style='display:none;'>
						<ul class='review-ul-body'>
							<c:choose>
								<c:when test="${not empty reviewList}">
									<c:forEach var="r" items="${reviewList }">
										<li class='li-tag'>
											<div class='review-box'>
												<div class='review-text-div'>
													<span class="review_title">${r.review_title }</span><br>
													<span>${r.cust_id }</span>
													<div class="review-accordion">
														<span>${r.review_content }</span>
														<img src="/images/${r.review_img }" onerror="this.style.display='none'">
													</div>
												</div>
											</div>
										</li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<img src="/images/icon_mark.png">
									등록된 상품후기가 없습니다.
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					
					<div class='detail-wrap'>
						<img src="/images/${p.product_detail }"> 
					</div>
					
					<div class='qna-wrap' style='display:none;'>
						<ul class='qna-ul-body'>
							<c:choose>
								<c:when test="${not empty qnaList}">
									<c:forEach var="q" items="${qnaList }">
										<li class='li-tag'>
											<div class='qna-box'>
												<div class='qna-text-div'>
													<span class="qna_title">${q.qna_title }</span><br>
													<span>${q.cust_id }</span>
														|
													<span><fmt:formatDate value="${q.qna_date }"/> </span>
													<div class="qna-accordion">
														<div class="qna-question">
															<span><img src="/images/icon_q.jpg" style="width: 25px; height: 25px;"></span>
															<span>${q.qna_content }</span>
															<img src="/images/${q.qna_img }" onerror="this.style.display='none'">
														</div>
														<c:if test="${not empty q.qna_answer}">
															<div class="qna-answer">
																<span><img src="/images/icon_a.jpg" style="width: 25px; height: 25px;"></span>
																<span>${q.qna_answer }</span>
															</div>
														</c:if>
													</div>
												</div>
											</div>
										</li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<img src="/images/icon_mark.png">
									등록된 상품문의가 없습니다.
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					
					<div class='exchange-wrap' style='display:none;'>
						<img src="/images/exchange_desc.jpg">
					</div>
				</div>
			</div>
		</div>
		<div><jsp:include page="../common/footer.jsp"></jsp:include></div>
	</div>
	
</body>
</html> 