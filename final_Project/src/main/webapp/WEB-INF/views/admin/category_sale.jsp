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
</head>
<body>

      <h1>카테고리별 판매량</h1>
      <select id="category_code">
        <option value="sp">국, 찌개</option>
        <option value="d">반찬</option>
        <option value="s">샐러드</option>
        <option value="n">면류</option>
        <option value="r">밥,죽</option>
        <option value="b">베이커리</option>
        <option value="v">비건</option>
      </select>
      <input type="submit" value="확인" onclick='Show_Category();'><br>
      
      <div id="cate_list">
      
      </div>

    
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
    		for (var index = 0; index < count; index++) {
    			obj[index].product_no;
    			obj[index].product_name;
    			
    			var data = new Object();
    			data.product_no= obj[index].product_no;
    			data.product_name= obj[index].product_name;
    			
    			document.body.append(data.product_no); 
    			document.body.append(data.product_name); 
    		}
    	}
    }
    </script>
    
    


    
    
</body>
</html>