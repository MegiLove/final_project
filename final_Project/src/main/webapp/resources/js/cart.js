/*$(document).ready(function() {
	CartPaging();
});


//페이징
function CartPaging() {

	$.ajax({

		url: "/cart/CartPaging",
		data: $("#userID").serialize() + "&" + $("#cartNum").serialize(),
		dataType: "JSON",
		cache: false,
		async: true,
		type: "POST",
		success: function(obj) {
			CartPagingCallback(obj);
		},
		error: function(xhr, status, error) { }

	});
}

function CartPagingCallback(obj) {

	var cartNum = $("#cartNum").val();
	var list = obj;

	if (list != null) {
		str = "";
		var startPageNum = list.startPageNum;
		var endPageNum = list.endPageNum;
		var prev = list.prev;
		var next = list.next;

		str += "<ul class=\"page_nation\">";

		if (prev) {
			str += "<a class=\"arrow prev\" href=\"/cart/cartBbs?cartNum=" + (startPageNum - 1) + "\"><span><<</span></a>";
		}
		for (i = startPageNum; i <= endPageNum; i++) {
			if (i == cartNum) {
				str += "<a class=\"active\" href=\"/cart/cartBbs?cartNum=" + i + "\">" + i + "</a>";
			}
			else {
				str += "<a href=\"/cart/cartBbs?cartNum=" + i + "\">" + i + "</a>";
			}
		}

		if (next) {
			str += "<a class=\"arrow next\" href=\"/cart/cartBbs?cartNum=" + (endPageNum + 1) + "\"><span>>></span></a>";
		}

		str += "</ul>";
		$("#tPaging").html(str);
	}

}
*/

//장바구니 체크 합계
function itemSum(frm, index, price,cnt) {
	console.log(index);
	console.log(frm.cartBox[index].checked);
	if(frm.cartBox[index].checked){
		frm.total_sum.value = parseInt(frm.total_sum.value) + parseInt(price*cnt);
	}
	else{
		frm.total_sum.value = parseInt(frm.total_sum.value) - parseInt(price*cnt);
	}
}

//장바구니 분량 수정
function CartUpdate(product_cnt, product_no, cart_no, cust_id, index) {
	var productNumber = product_no[index].value;
	var productCountValue = product_cnt[index].value;
	var cartNumber = cart_no[index].value;
	var customerId = cust_id[index].value;
	console.log(productCountValue);
	console.log(productNumber);

	if (productCountValue == 0 || productCountValue == undefined) {
		alert("수량을 입력해주세요.")
	}

	var yn = confirm("장바구니 수량을 변경 하시겠습니까?");

	if (yn) {
		$.ajax({

			url: "updateCart",
			data: "product_cnt=" + productCountValue + "&" + $("#cust_id").serialize() + "&product_no=" + productNumber +"&cart_no=" + cartNumber+"&cust_id=" + customerId,
			dataType: "JSON",
			cache: false,
			async: true,
			type: "POST",
			success: function(obj) {
				CartUpdateCallback(obj);
			},
			error: function(xhr, status, error) { }

		});
	}
}

//장바구니 수량 변경 함수
function CartUpdateCallback(obj) {
	console.log("callback 호출");
	console.log(obj);

	
	var cart_no = obj.cart_no;
	console.log(cart_no);
	
	if (obj != null) {
			console.log("callback success");
			location.href = "/market/cartProduct";
	}
}

//장바구니 상품 삭제
function CartDelete(cart_no, index) {
	var cartNumber = cart_no[index].value;
	var yn = confirm("장바구니에 담긴 상품을 삭제하시겠습니까?");

	if (yn) {
		$.ajax({

			url: "deleteCart",
			data: "cart_no=" + cartNumber,
			dataType: "JSON",
			cache: false,
			async: true,
			type: "POST",
			success: function(obj) {
				CartDeleteCallback(obj);
			},
			error: function(xhr, status, error) { }

		});
	}
}

//장바구니 삭제 함수
function CartDeleteCallback(obj) {
	console.log(obj);
	if (obj != null) {
		console.log("callback success");
		location.href = "/market/cartProduct";
	}
}

//장바구니 선택주문
function CheckOrder(frm) {
	var count = frm.cartBox.length;
	var a = 0;
	var yn = confirm("선택한 상품들을 구매하시겠습니까?");

	if (yn) {
		for (var index = 0; index < count; index++) {
			if (frm.cartBox[index].checked == true) {
				a += 1;
				console.log(frm.product_no[index].value);
				
				$.ajax({

					url: "cartOrder",
					data: $("#cust_id").serialize() + "&product_no=" + frm.product_no[index].value,
					dataType: "JSON",
					cache: false,
					async: true,
					type: "POST",
					success: function(obj) {
						CheckOrderCallback(obj);
					},
					error: function(xhr, status, error) { }

				});
			}
		}
	}
	if (yn && a == 0) {
		alert("선택된 제품이 없습니다.");
	}
}

function CheckOrderCallback(obj){
	console.log(obj);
	if (obj != null) {
		console.log("callback success");
		location.href = "/market/insertOrder";
	}
}

//장바구니 전체주문
function AllOrder(frm) {

	var count = frm.cartBox.length;

	var yn = confirm("전체 상품을 구매하시겠습니까?");

	if (yn) {
		for (var index = 0; index < count; index++) {

			var product_no = frm.product_no[index].value;
			$.ajax({

				url: "cartOrder",
				data: $("#cust_id").serialize() + "&product_no=" + product_no,
				dataType: "JSON",
				cache: false,
				async: true,
				type: "POST",
				success: function(obj) {
					console.log(obj);
					location.href="market/insertOrder"
				},
				error: function(xhr, status, error) { }

			});
		}

	}
}