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

	$(".crossButton").on("click",function() {
			$(this).css({"display":"none"});
			$(this).parent().parent().css({"border-top":"none"});
			$(this).parent().parent().css({"border-bottom":"1px solid #d8d8d8;"});
			$(this).parent().siblings(".componentDetails_Wrapper").css({"display":"none"});

	});
	$(".componentsHeading h3").on("click",function(){
			$(this).parent().siblings(".componentDetails_Wrapper").css({"display":"block"});
			$(this).siblings(".crossButton").css({"display":"block"});
			$(this).parent().parent().css({"border-top":"2px solid #EE7D11"});
			$(this).parent().parent().css({"border-bottom":"none"});

	});
});
















