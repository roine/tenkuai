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
		visible: 4
	});

	$("#loginButton").click(function() {
	  $('#loginBox').slideToggle();
	});
	
});

