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
# /*========================================== Lable Click ==================================================*/	


	$('.lable_listItem').on "click", () -> 
		$('.lable_listItem').removeClass 'active'
		$('.composition_imageLink').removeClass 'active'
		activePoint = $(this).attr('pivotPoint')
		pivotPointList = $('.composition_image').find('.composition_imageLink')
	

		for elements in pivotPointList
			if activePoint == $(elements).attr("pivotPoint")
				$(elements).addClass('active')
				$(this).toggleClass('active')

		compositionSec=$('.componentDetails')
		for compElement in compositionSec
			if activePoint == $(compElement).attr('relPoint')
				$(compElement).removeClass("componentDetails--disable")
			else	
				$(compElement).addClass("componentDetails--disable")


# /*========================================== Image Dots Click ==================================================*/


	$('.composition_imageLink').on "click", () -> 
		$('.lable_listItem').removeClass 'active'
		$('.composition_imageLink').removeClass 'active'
		activePoint = $(this).attr('pivotPoint')
		pivotPointList = $('.lable_list').find('.lable_listItem')
	

		for elements in pivotPointList
			if activePoint == $(elements).attr("pivotPoint")
				$(elements).addClass('active')
				$(this).toggleClass('active')

		compositionSec=$('.componentDetails')
		for compElement in compositionSec
			if activePoint == $(compElement).attr('relPoint')
				$(compElement).removeClass("componentDetails--disable")
			else	
				$(compElement).addClass("componentDetails--disable")



# /*========================================== Cross Click ==================================================*/
	$('.crossButton').on 'click', (e) ->
		e.preventDefault()
		$(this).parent().parent().addClass('componentDetails--disable')
		$(this).parent().find(".componentDetails_wrapper").css({"display":"none"})
		$(this).css({"display":"none"})

		pivotPointList = $('.composition_image').find('.composition_imageLink')
		for elements in pivotPointList
			if $(this).parent().parent().attr('relPoint') == $(elements).attr('pivotPoint')
				$(elements).removeClass('active')

		labelList = $('.composition_image').find('.lable_listItem')
		for elements in labelList
			if $(this).parent().parent().attr('relPoint') == $(elements).attr('pivotPoint')
				$(elements).removeClass('active')		



# /*========================================== Component Heading Click ==================================================*/

	$(".componentsHeading h3").on "click", () ->
		$(this).parent().parent().removeClass("componentDetails--disable")
		$(this).parent().parent().siblings('div').addClass("componentDetails--disable")
		$(this).siblings('.crossButton').css({"display":"block"})
		$(this).parent().parent().siblings('div').find('a').css({"display":"none"})

		pivotPointList = $('.composition_image').find('.composition_imageLink')
		for elements in pivotPointList
			if $(this).parent().parent().attr('relPoint') == $(elements).attr('pivotPoint')
				$(elements).addClass('active')
			else	
				$(elements).removeClass('active')

		labelList = $('.composition_image').find('.lable_listItem')
		for elements in labelList
			if $(this).parent().parent().attr('relPoint') == $(elements).attr('pivotPoint')
				$(elements).addClass('active')	
			else		
				$(elements).removeClass('active')	







