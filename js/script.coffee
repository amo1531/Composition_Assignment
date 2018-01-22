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


	$('.Lable_listItem').on "click", () -> 
		$('.Lable_listItem').removeClass 'active'
		$('.CompositionImage_Link').removeClass 'active'
		activePoint = $(this).attr('pivotPoint')
		pivotPointList = $('.CompositionImage').find('.CompositionImage_Link')
	

		for elements in pivotPointList
			if activePoint == $(elements).attr("pivotPoint")
				$(elements).addClass('active')
				$(this).toggleClass('active')

		compositionSec=$('.ComponentDetails')
		for compElement in compositionSec
			if activePoint == $(compElement).attr('relPoint')
				$(compElement).removeClass("ComponentDetails--disable")
			else	
				$(compElement).addClass("ComponentDetails--disable")


# /*========================================== Image Dots Click ==================================================*/


	$('.CompositionImage_Link').on "click", () -> 
		$('.Lable_listItem').removeClass 'active'
		$('.CompositionImage_Link').removeClass 'active'
		activePoint = $(this).attr('pivotPoint')
		pivotPointList = $('.Lable_list').find('.Lable_listItem')
	

		for elements in pivotPointList
			if activePoint == $(elements).attr("pivotPoint")
				$(elements).addClass('active')
				$(this).toggleClass('active')

		compositionSec=$('.Component_details')
		for compElement in compositionSec
			if activePoint == $(compElement).attr('relPoint')
				$(compElement).removeClass("ComponentDetails--disable")
			else	
				$(compElement).addClass("ComponentDetails--disable")



# /*========================================== Cross Click ==================================================*/
	$('.CrossButton').on 'click', (e) ->
		e.preventDefault()
		$(this).parent().parent().addClass('ComponentDetails--disable')
		$(this).parent().find(".ComponentDetails_wrapper").css({"display":"none"})
		$(this).css({"display":"none"})

		pivotPointList = $('.CompositionImage').find('.CompositionImage_Link')
		for elements in pivotPointList
			if $(this).parent().parent().attr('relPoint') == $(elements).attr('pivotPoint')
				$(elements).removeClass('active')

		labelList = $('.CompositionImage').find('.Lable_listItem')
		for elements in labelList
			if $(this).parent().parent().attr('relPoint') == $(elements).attr('pivotPoint')
				$(elements).removeClass('active')		



# /*========================================== Component Heading Click ==================================================*/

	$(".ComponentsHeading h3").on "click", () ->
		$(this).parent().parent().removeClass("ComponentDetails--disable")
		$(this).parent().parent().siblings('div').addClass("ComponentDetails--disable")
		$(this).siblings('.CrossButton').css({"display":"block"})
		$(this).parent().parent().siblings('div').find('a').css({"display":"none"})

		pivotPointList = $('.CompositionImage').find('.CompositionImage_Link')
		for elements in pivotPointList
			if $(this).parent().parent().attr('relPoint') == $(elements).attr('pivotPoint')
				$(elements).addClass('active')
			else	
				$(elements).removeClass('active')

		labelList = $('.CompositionImage').find('.Lable_listItem')
		for elements in labelList
			if $(this).parent().parent().attr('relPoint') == $(elements).attr('pivotPoint')
				$(elements).addClass('active')	
			else		
				$(elements).removeClass('active')	







