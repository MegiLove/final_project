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
		$(".review_title").click(function(){
			$(".review-accordion").toggle("slow");
		});
		$(".qna_title").click(function(){
			$(".qna-accordion").toggle("slow");
		});
	});
</script>
</head>
<body>
	<div id="container">
		<div id="header"><jsp:include page="../common/header.jsp"></jsp:include></div>
		
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
					<div class="img-wrap" style="height: 100%;">
						<img id="img" src="/images/${p.product_img }">
					</div>
				</div>
				<div class="top-right-section">
					<div class="div-top-section" style="margin-bottom: 0;">
						<span class="short-desc">${p.product_desc}</span><br>
						<span class="name">${p.product_name}</span>
					</div>
	
					<div class="div-top-section" style="margin-top: 10px;">
						<div class="right-info-title">가격</div>
						<div class="right-info-desc">
							<span>${p.product_price}</span>
							<span>원</span>
						</div>
					</div>
					<div class="div-top-section">
						<div class="right-info-title">배송 정보</div>
						<div class="right-info-desc" style="margin-bottom: 20px;">
							<span>일반배송 : 3000원</span>
						</div>
					</div>
					<div class="hidden-info">
						<span id="cust_id" style="display:none;">${cust_id }</span>
						<span id="product_no" style="display:none;">${p.product_no }</span>
					</div>
					<div class="div-top-section button-wrap">
						<button type="button" class="btn btn-outline-primary top-button" data-bs-toggle="modal" data-bs-target="#exampleModal">장바구니</button>
					</div>
				</div>
			</div>
			
			<hr style="box-shadow: 0px 0px 3px 0px gray; margin: 3% 17%">
			
			<div class="tap-section">
				<button id="detailButton" class="btn btn-lg btn-primary tap-button" onclick="detailTap()">상품정보</button>
				<button id="reviewButton" class="btn btn-lg btn-secondary tap-button" onclick="reviewTap()">상품후기</button>
				<button id="qnaButton" class="btn btn-lg btn-secondary tap-button" onclick="qnaTap()">상품문의</button>
				<button id="exchangeButton" class="btn btn-lg btn-secondary tap-button" onclick="exchangeTap()">교환/반품</button>
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
											</div>
											<div class="review-accordion">
												<span>${r.review_content }</span>
												<img src="/images/${r.review_img }" onerror="this.style.display='none'">
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
											</div>
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
		<div id="footer"><!-- 푸터 --></div>
	</div>
	
</body>
</html> 