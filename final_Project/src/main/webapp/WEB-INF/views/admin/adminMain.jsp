<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/adminMain.css" type="text/css">
</head>
<body>
<div><jsp:include page="../common/header.jsp"></jsp:include></div>
<div class="admin_list">
<h2>������ ������</h2>
	<div class="box" id="box1">
	<a href="mgr_listProduct"> <img class="mgr_product" src="/images/��ǰ����.png" style=display:block; width="200" height="200"/>��ǰ����</a><br>
	</div>
	<div class="box" id="box2">
	<a href="mgr_listQna"> <img class="mgr_qna" src="/images/��ǰ����.png" style=display:block; width="200" height="200"/>��ǰ���Ǵ��</a><br>
	</div>
	<div class="box" id="box3">
	<a href="category_sale"> <img class="category" src="/images/ī�װ��� �Ǹŷ�.png" style=display:block; width="200" height="200"/>ī�װ����Ǹŷ�</a><br>
	</div>
	<div class="box" id="box4">
	<a href="monthTotal.html"> <img class="month" src="/images/���� �Ѹ���.png" style=display:block; width="200" height="200"/>�����Ѹ���</a><br>
	</div>
	<div class="return">
	<a href="http://localhost:8080/main">���θ� ��������</a><br>
	</div>
	</div>
	<div><jsp:include page="../common/footer.jsp"></jsp:include></div>
	
</body>
</html>