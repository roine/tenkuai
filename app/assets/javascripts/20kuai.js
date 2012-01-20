$(document).ready(function() {
	
	$(".feedbackList").jCarouselLite({
	    btnNext: ".down",
	    btnPrev: ".up",
		vertical: true
	});
	
	$(".activityEntry").jCarouselLite({
	    btnNext: ".down",
	    btnPrev: ".up",
		vertical: true,
		circular: false,
		visible: 3,
		start: 0
	});
		
	$("#loginButton").click(function() {
	$('#loginBox').slideToggle();
	});
	
	var msie6 = $.browser == 'msie' && $.browser.version < 7;
	if (!msie6) {
		/*top is equal to the distance between ribbon-wrapper and the top of the screen, top value never change*/
	    var top = $('.ribbon-wrapper').offset().top - parseFloat($('.ribbon-wrapper').css('margin-top').replace(/auto/, 0));
		var top_last =  $('#lastFeatured').offset().top - parseFloat($('#lastFeatured').css('margin-top').replace(/auto/, 0));
		var top1 =  $('.ribbon-wrapper1').offset().top - parseFloat($('.ribbon-wrapper1').css('margin-top').replace(/auto/, 0));
		var top_last1 =  $('#lastFeatured1').offset().top - parseFloat($('#lastFeatured1').css('margin-top').replace(/auto/, 0));
		
	    $(window).scroll(function (event) {
	        $('.ribbon-wrapper, .ribbon-wrapper1').css({
	            'z-index': '200'
	        });
	
	        var y = $(this).scrollTop();
	        if (y >= top && y < top_last-50) {
	            $('.ribbon-wrapper').addClass('fixed');
	        } else{
	            $('.ribbon-wrapper').removeClass('fixed');
	        }
			if (y >= top1 && y < top_last1-50) {
	            $('.ribbon-wrapper1').addClass('fixed');
	        } else{
	            $('.ribbon-wrapper1').removeClass('fixed');
	        }
	    });
	}
	
});
