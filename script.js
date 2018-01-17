$(document).ready(function() {

	var canvas = document.querySelector("canvas");
	var c = canvas.getContext("2d");
	c.beginPath();
	c.lineWidth=0.2;
	c.moveTo(136.5,58);
	c.lineTo(250.5,20);
	c.lineTo(300.5,20);
	c.stroke();

	c.moveTo(186.5,67);
	c.lineTo(258.5,40);
	c.lineTo(308.5,40);
	c.stroke();

	c.moveTo(210.5,75);
	c.lineTo(264.5,58);
	c.lineTo(314.5,58);
	c.stroke();

	c.moveTo(216.5,89);
	c.lineTo(274.5,77);
	c.lineTo(324.5,77);
	c.stroke();

	
	$('#firstComponent').addClass('componentDetails--disable');
	$('.crossButton').on('click', function (e) {

		e.preventDefault();
		$('#firstComponent').removeClass('componentDetails--disable');
		$(this).parent().parent().addClass('componentDetails--disable');
		$(this).parent().find(".componentDetails_wrapper").css("display","none");
		$(this).css("display","none");
	});

	$(".componentsHeading h3").on("click",function(){
		$(this).parent().parent().removeClass("componentDetails--disable");
		$(this).siblings('a').css("display","block");

	});

});















