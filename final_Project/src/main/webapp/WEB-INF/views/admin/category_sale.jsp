<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
<link rel="stylesheet" href="../resources/css/category_sale.css" type="text/css">
</head>
<body>
<div><jsp:include page="../common/header.jsp"></jsp:include></div>
	<div class="cate">
      <h1>ī�װ��� �Ǹŷ�</h1>
      <select id="category_code">
        <option value="sp">��, �</option>
        <option value="d">����</option>
        <option value="s">������</option>
        <option value="n">���</option>
        <option value="r">��,��</option>
        <option value="b">����Ŀ��</option>
        <option value="v">���</option>
      </select>
      <input type="submit" value="Ȯ��" onclick='Show_Category();'><br>
    
    <script>
    	function Show_Category(category_code) {
    	var category_code =$("#category_code option:selected").attr('value');
    		$.ajax({
    			url: "category_sale",
    			data: "category_code=" + category_code,
    			dataType: "JSON",
    			cache: false,
    			async: true,
    			type: "POST",
    			success: function(obj) {
    				Show_CategoryCallback(obj);
    			},
    			error: function(xhr, status, error) { }

    		});
    	}
    
    function Show_CategoryCallback(obj) {
    	var count = obj.length;
    	console.log(obj);
    	if (obj != null) {
    		console.log("callback success");
    		document.getElementById("cate_list").innerHTML="";
    		for (var index = 0; index < count; index++) {
    			obj[index].product_no;
    			obj[index].product_name;
    			
    			var data = new Object();
    			data.product_name= obj[index].product_name;    			
    			//document.body.append(data.product_name);
    			document.getElementById("cate_list").innerHTML+="<br/><br/>"+(index+1)+"��: "+data.product_name;
    		}
    	}
    }
    </script>  
    
    <div id="cate_list"></div> 
    </div>     
    <div><jsp:include page="../common/footer.jsp"></jsp:include></div>
</body>
</html>