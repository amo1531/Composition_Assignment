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
		canvas.width = 570
		
	$.each(pivotpoints,(index,value) ->
		xcord = pivotpoints[index].x
		ycord = pivotpoints[index].y
		idcord=pivotpoints[index].id.toString()
		topHeight=25+idcord*40
		c.beginPath()
		c.strokeStyle = "#666666"
		c.moveTo(xcord, ycord)
		if (screenWidth < 900)
			c.lineTo(265,topHeight)
			c.lineTo(340,topHeight)
			c.stroke()
		else
			c.lineTo(265,topHeight)
			c.lineTo(500,topHeight)
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

		compositionSec=$('.ComponentInfo_details')
		for compElement in compositionSec
			if activePoint == $(compElement).attr('relpoint')
				$(compElement).removeClass("ComponentInfo_details--disable")
			else	
				$(compElement).addClass("ComponentInfo_details--disable")

		if(screenWidth > 900) 
			$.each(pivotpoints,(index,value) ->
				idcord=pivotpoints[index].id.toString()
				topHeight=25+idcord*40
				# console.log("cords"+xcord,ycord,idcord,activePoint)
				# console.log("Type of Idcord"+jQuery.type(idcord))
				# console.log("idcords -"+idcord,"extendcord -"+activePoint)
				# console.log("result of equals "+activePoint == idcord)
				if (activePoint == idcord)
					# console.log("idcords from array -"+idcord,"listItem -"+activePoint)
					c.beginPath()
					c.moveTo(500,topHeight)
					c.lineTo(550,topHeight)
					c.arc(550,topHeight,5,0,2 * Math.PI,false)
					c.fillStyle = '#666666'
					c.fill()
					c.stroke()
				else
					console.log "topHeight"+topHeight
					c.clearRect(500,topHeight-10,100,20)
					# console.log("else idcords from array -"+idcord," else listItem -"+activePoint)
			)

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

		# activePoint=$(this).parent().parent.attr('relpoint')


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







