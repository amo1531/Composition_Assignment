$(document).ready ->
	pivotpoints=[
					{id:0,x:129,y:109},
					{id:1,x:182,y:126},
					{id:2,x:205,y:146},
					{id:3,x:210,y:174}
				]

	# console.log(jQuery.type(pivotpoints[0].id))
	canvas = document.querySelector("canvas")
	c = canvas.getContext("2d")
	screenWidth = $(window).width()
	if (screenWidth < 900) 
		canvas.height = 300
		canvas.width = 300
	else 
		canvas.height = 300
		canvas.width = 550
	yfromtop=25
	ycommon=40
	$.each(pivotpoints,(index,value) ->
		xcord = pivotpoints[index].x
		ycord = pivotpoints[index].y
		# console.log(xcord,ycord)
		c.beginPath()
		c.strokeStyle = "#666666"
		c.moveTo(xcord, ycord)
		if (screenWidth < 900)
			c.lineTo(265,yfromtop)
			c.lineTo(340,yfromtop)
			yfromtop=yfromtop+ycommon
			c.stroke()
		else
			c.lineTo(265,yfromtop)
			c.lineTo(500,yfromtop)
			yfromtop=yfromtop+ycommon
			c.stroke()
	)
	
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

		extendPoint = $(this).attr('pivotpoint')
		# console.log(jQuery.type(extendPoint))
		# console.log(extendPoint)
		$.each(pivotpoints,(index,value) ->
			xcord=pivotpoints[index].x
			ycord=pivotpoints[index].y
			idcord=pivotpoints[index].id.toString()
			# console.log("cords"+xcord,ycord,idcord,extendPoint)
			console.log("Type of Idcord"+jQuery.type(idcord))
			console.log("idcords -"+idcord,"extendcord -"+extendPoint)
			# console.log("result of equals "+extendPoint == idcord)
			if (extendPoint == idcord && screenWidth > 900)
				console.log("inside")
				c.beginPath()
				xyz=25+idcord*40;
				c.moveTo(500,xyz)
				c.lineTo(600,xyz)
				c.stroke()
		)
	
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







