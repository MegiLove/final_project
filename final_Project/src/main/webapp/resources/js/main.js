$(document).ready(function(){
	$(".slide_div").slick(
		{
			dots: false,
			autoplay: true,
			autoplaySpeed: 3000
		}		
	);
	
	$(".b-post-wrapper").slick(
		{
			slidesToShow : 4,
			slidesToScroll : 4,
			autoplay: false,
			nextArrow: $(".next"),
			prevArrow: $(".prev")
		}
	);
	
	$(".m-post-wrapper").slick(
		{
			slidesToShow : 3,
			slidesToScroll : 3,
			autoplay: true,
			autoplaySpeed: 2000,
			arrows: false,
			dots : true,
			pauseOnHover : true,
			vertical : true
		}
	);
});