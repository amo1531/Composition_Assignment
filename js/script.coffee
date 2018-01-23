$(document).ready ->

	canvas = document.querySelector("canvas")
	c = canvas.getContext("2d")
	c.beginPath()
	c.lineWidth = 0.2
	c.moveTo(136.5,58)
	c.lineTo(260,20)
	c.lineTo(300.5,20)
	c.stroke()

	c.moveTo(186.5,67)
	c.lineTo(260,40)
	c.lineTo(308.5,40)
	c.stroke()

	c.moveTo(210.5,75)
	c.lineTo(260,58)
	c.lineTo(314.5,58)
	c.stroke()

	c.moveTo(216.5,89)
	c.lineTo(260,77)
	c.lineTo(324.5,77)
	c.stroke()
# /*========================================== Label Click ==================================================*/	


	$('.Label_listItem').on "click", () -> 
		$('.Label_listItem').removeClass 'active'
		$('.Composition_image_link').removeClass 'active'
		activePoint = $(this).attr('pivotPoint')
		pivotPointList = $('.Composition_image').find('.Composition_image_link')
	

		for elements in pivotPointList
			if activePoint == $(elements).attr("pivotPoint")
				$(elements).addClass('active')
				$(this).toggleClass('active')

		compositionSec=$('.ComponentInfo_details')
		for compElement in compositionSec
			if activePoint == $(compElement).attr('relPoint')
				$(compElement).removeClass("ComponentInfo_details--disable")
			else	
				$(compElement).addClass("ComponentInfo_details--disable")


# /*========================================== Image Dots Click ==================================================*/


	$('.Composition_image_link').on "click", () -> 
		$('.Label_listItem').removeClass 'active'
		$('.Composition_image_link').removeClass 'active'
		activePoint = $(this).attr('pivotPoint')
		pivotPointList = $('.Label').find('.Label_listItem')
	

		for elements in pivotPointList
			if activePoint == $(elements).attr("pivotPoint")
				$(elements).addClass('active')
				$(this).toggleClass('active')

		compositionSec=$('.ComponentInfo_details')
		for compElement in compositionSec
			if activePoint == $(compElement).attr('relPoint')
				$(compElement).removeClass("ComponentInfo_details--disable")
			else	
				$(compElement).addClass("ComponentInfo_details--disable")



# /*========================================== Cross Click ==================================================*/
	$('.CrossButton').on 'click', (e) ->
		e.preventDefault()
		$(this).parent().parent().addClass('ComponentInfo_details--disable')
		$(this).parent().find(".Components_wrapper").css({"display":"none"})
		$(this).css({"display":"none"})

		pivotPointList = $('.Composition_image').find('.Composition_image_link')
		for elements in pivotPointList
			if $(this).parent().parent().attr('relPoint') == $(elements).attr('pivotPoint')
				$(elements).removeClass('active')

		labelList = $('.Composition_image').find('.Label_listItem')
		for elements in labelList
			if $(this).parent().parent().attr('relPoint') == $(elements).attr('pivotPoint')
				$(elements).removeClass('active')		



# /*========================================== Component Heading Click ==================================================*/

	$(".Components_heading h3").on "click", () ->
		$(this).parent().parent().removeClass("ComponentInfo_details--disable")
		$(this).parent().parent().siblings('div').addClass("ComponentInfo_details--disable")
		$(this).siblings('.CrossButton').css({"display":"block"})
		$(this).parent().parent().siblings('div').find('a').css({"display":"none"})

		pivotPointList = $('.Composition_image').find('.Composition_image_link')
		for elements in pivotPointList
			if $(this).parent().parent().attr('relPoint') == $(elements).attr('pivotPoint')
				$(elements).addClass('active')
			else	
				$(elements).removeClass('active')

		labelList = $('.Composition_image').find('.Label_listItem')
		for elements in labelList
			if $(this).parent().parent().attr('relPoint') == $(elements).attr('pivotPoint')
				$(elements).addClass('active')	
			else		
				$(elements).removeClass('active')	







