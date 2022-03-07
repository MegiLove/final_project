const leftButton = (object) => {
	let product_cnt = Number($(object).siblings('#product_cnt').text());
	let priceSpan = $(object).parents('.modal-info-cnt').siblings('.modal-info-price').children('#product_price');
	let product_price = Number($(priceSpan).text());
	
	if (product_cnt == 1) {
		alert('한 개 이상을 선택해주세요.');
		return;
	} else {
		$(object).siblings('#product_cnt').text('');
		$(object).siblings('#product_cnt').text(product_cnt-1);
		
		$(priceSpan).text('');
		$(priceSpan).text(product_price-(product_price/product_cnt));
	}
}


const rightButton = (object) => {
	let product_cnt = Number($(object).siblings('#product_cnt').text());
	let priceSpan = $(object).parents('.modal-info-cnt').siblings('.modal-info-price').children('#product_price');
	let product_price = Number($(priceSpan).text());
	

	$(object).siblings('#product_cnt').text('');
	$(object).siblings('#product_cnt').text(product_cnt+1);
	
	$(priceSpan).text('');
	$(priceSpan).text(product_price+(product_price/product_cnt));
}


const insertCart = () => {
	let cust_id = document.getElementById('cust_id').innerText;
	let product_cnt = $('#product_cnt').text();
	let product_no = document.getElementById('product_no').innerText;
	if(cust_id == ''){
		alert("로그인 한 회원만 가능합니다.");
		return;
	}else{
		let data = {
			"cust_id":cust_id,
			"product_no":product_no,
			"product_cnt":product_cnt
		}
		
		console.log(data);
		
		if (confirm('해당 상품을 장바구니에 넣으시겠습니까?')) {
			$.ajax({
				url:"insertCart",
				type:"post",
				data:JSON.stringify(data),
				contentType:"application/json",
				success:function(flag) {
					console.log(flag);
					let msg = (flag=='true'?'장바구니로 이동하시겠습니까?':'해당 상품은 이미 장바구니에 담겨있습니다. 장바구니로 이동하시겠습니까?') 
					if (confirm(msg)) {
						location.href = '/market/cartProduct';
					}
				}
			});
		}
	}
	
}


const changeColorBtn = () => {
	for (var i = 0; i < 4; i++) {
		$('.tap-button').eq(i).removeClass('btn-primary').addClass('btn-secondary');
	}		
}


const reviewTap = () => {
	changeColorBtn();
	$('#reviewButton').removeClass('btn-secondary').addClass('btn-primary');
	$('.detail-wrap').css('display','none');
	$('.qna-wrap').css('display','none');
	$('.exchange-wrap').css('display','none');
	$('.review-wrap').css('display','block');
}


const detailTap = () => {
	changeColorBtn();
	$('#detailButton').removeClass('btn-secondary').addClass('btn-primary');
	$('.review-wrap').css('display','none');
	$('.qna-wrap').css('display','none');
	$('.exchange-wrap').css('display','none');
	$('.detail-wrap').css('display','block');
}

const qnaTap = () => {
	changeColorBtn();
	$('#qnaButton').removeClass('btn-secondary').addClass('btn-primary');
	$('.detail-wrap').css('display','none');
	$('.review-wrap').css('display','none');
	$('.exchange-wrap').css('display','none');
	$('.qna-wrap').css('display','block');
}

const exchangeTap = () => {
	changeColorBtn();
	$('#exchangeButton').removeClass('btn-secondary').addClass('btn-primary');
	$('.detail-wrap').css('display','none');
	$('.review-wrap').css('display','none');
	$('.qna-wrap').css('display','none');
	$('.exchange-wrap').css('display','block');
}