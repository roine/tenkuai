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
		visible: 4,
		start: 0
	});

	$("#loginButton").click(function() {
		$('#loginBox').slideToggle();
	});


});
