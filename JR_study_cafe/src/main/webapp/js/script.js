$(document).ready(function() {
	// recent post slideshow
	$('.posts_list').bxSlider({
		minSlides : 1,
		maxSlides : 3,
		moveSlides : 1,
		slideWidth : 370,
		slideMargin : 30,
		pager : false,
		nextSelector : '.recent_posts .controls .next',
		prevSelector : '.recent_posts .controls .prev'
	});

	$(".toggle").click(function() {
		$(".main-menu").slideToggle();
	});

	$(window).resize(function() {
		if ($(window).width() > 768) {
			// 참이면 할일
			$(".main-menu").show();
		} else {
			// 거짓이면 할일
			$(".main-menu").hide();
		}
	});

	// 상단 메뉴 고정
	var $header = $('header');
	$(window).scroll(function(){
		if($(this).scrollTop()>0) {
			$header.addClass('sticky');
		} else {
			$header.removeClass('sticky');
		}
	});
});