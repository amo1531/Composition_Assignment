$(document).ready ->

		canvas = document.querySelector("canvas")
		c = canvas.getContext("2d")
		screenWidth = $(window).width()
		$(window).on "resize", () ->
		if (screenWidth < 769) 
			canvas.height = 300
			canvas.width = 300
			c.beginPath()
			c.moveTo(135,117)
			c.lineTo(265,25)
			c.lineTo(340,25)

			c.moveTo(186,135)
			c.lineTo(265,65)
			c.lineTo(340,65)

			c.moveTo(210,150)
			c.lineTo(265,105)
			c.lineTo(340,105)

			c.moveTo(220,175)
			c.lineTo(265,145)
			c.lineTo(340,145)
			c.stroke()

		else 
			canvas.height = 300
			canvas.width = 550
			c.beginPath()

			c.moveTo(135,117)
			c.lineTo(265,25)
			c.lineTo(500,25)

			c.moveTo(186,135)
			c.lineTo(265,65)
			c.lineTo(500,65)

			c.moveTo(210,150)
			c.lineTo(265,105)
			c.lineTo(500,105)

			c.moveTo(220,175)
			c.lineTo(265,145)
			c.lineTo(500,145)
			c.stroke()
# /*========================================== Label Click ==================================================*/	


	$('.Label_listItem').on "click", () -> 
		$('.Label_listItem').removeClass 'active'
		$('.Composition_image_link').removeClass 'active'
		activePoint = $(this).attr('pivotpoint')
		pivotpointList = $('.Composition_image').find('.Composition_image_link')
	

		for elements in pivotpointList
			if activePoint == $(elements).attr("pivotpoint")
				$(elements).addClass('active')
				$(this).toggleClass('active')

		compositionSec=$('.ComponentInfo_details')
		for compElement in compositionSec
			if activePoint == $(compElement).attr('relpoint')
				$(compElement).removeClass("ComponentInfo_details--disable")
			else	
				$(compElement).addClass("ComponentInfo_details--disable")


# /*========================================== Image Dots Click =============================================*/


	$('.Composition_image_link').on "click", () -> 
		$('.Label_listItem').removeClass 'active'
		$('.Composition_image_link').removeClass 'active'
		activePoint = $(this).attr('pivotpoint')
		pivotpointList = $('.Label').find('.Label_listItem')
	

		for elements in pivotpointList
			if activePoint == $(elements).attr("pivotpoint")
				$(elements).addClass('active')
				$(this).toggleClass('active')

		compositionSec=$('.ComponentInfo_details')
		for compElement in compositionSec
			if activePoint == $(compElement).attr('relpoint')
				$(compElement).removeClass("ComponentInfo_details--disable")
			else	
				$(compElement).addClass("ComponentInfo_details--disable")



# /*========================================== Cross Click ==================================================*/
	$('.CrossButton').on 'click', (e) ->
		e.preventDefault()
		$(this).parent().parent().addClass('ComponentInfo_details--disable')
		$(this).parent().find(".Components_wrapper").css({"display":"none"})
		$(this).css({"display":"none"})

		pivotpointList = $('.Composition_image').find('.Composition_image_link')
		for elements in pivotpointList
			if $(this).parent().parent().attr('relpoint') == $(elements).attr('pivotpoint')
				$(elements).removeClass('active')

		labelList = $('.Composition_image').find('.Label_listItem')
		for elements in labelList
			if $(this).parent().parent().attr('relpoint') == $(elements).attr('pivotpoint')
				$(elements).removeClass('active')		



# /*========================================== Component Heading Click ======================================*/

	$(".Components_heading h3").on "click", () ->
		$(this).parent().parent().removeClass("ComponentInfo_details--disable")
		$(this).parent().parent().siblings('div').addClass("ComponentInfo_details--disable")
		$(this).siblings('.CrossButton').css({"display":"block"})
		$(this).parent().parent().siblings('div').find('a').css({"display":"none"})

		pivotpointList = $('.Composition_image').find('.Composition_image_link')
		for elements in pivotpointList
			if $(this).parent().parent().attr('relpoint') == $(elements).attr('pivotpoint')
				$(elements).addClass('active')
			else	
				$(elements).removeClass('active')

		labelList = $('.Composition_image').find('.Label_listItem')
		for elements in labelList
			if $(this).parent().parent().attr('relpoint') == $(elements).attr('pivotpoint')
				$(elements).addClass('active')	
			else		
				$(elements).removeClass('active')	







