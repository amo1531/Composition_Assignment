pivotpoints=[
					{id:0,x:129,y:109},
					{id:1,x:182,y:126},
					{id:2,x:205,y:146},
					{id:3,x:210,y:174}
			]	
canvas = document.querySelector("canvas")
c = canvas.getContext("2d")

$(document).ready ->
	initialize()
	$(window).bind('onload',redraw())
	@canvasColor = '#666666'

initialize = () ->
	$(window).bind('resize',resizeCanvas)
	resizeCanvas()

resizeCanvas = () ->
	if ($(window).width() < 900) 
		canvas.height = 300
		canvas.width = 300
		c.strokeStyle = "#666666"
		redraw()
	else 
		canvas.height = 300
		canvas.width = 570
		c.strokeStyle = "#666666"
		redraw()
	
#/* *************************** For canva on page Load ********************************* */#
	
redraw = () ->
	$.each(pivotpoints,(index,value) ->
		xcord = pivotpoints[index].x
		ycord = pivotpoints[index].y
		idcord = pivotpoints[index].id

		topHeight = 25 + idcord * 40
		c.beginPath()
		c.moveTo(xcord, ycord)
		c.lineTo(265,topHeight)
		if ($(window).width() < 900)
			c.lineTo(340,topHeight)
		else
			if(idcord == 0) 
				c.lineTo(550,topHeight)
				c.stroke()
				c.closePath()
				c.beginPath()
				c.arc(550,topHeight,5,0,2 * Math.PI,false)
				c.fillStyle = $.canvasColor
				c.fill()
			else
				c.lineTo(500,topHeight)	
				c.fillStyle = $.canvasColor
		c.stroke()
	)
	
# /*========================================== Label Click ==================================================*/	

$('.Label_listItem , .CompositionImage_link').on "click", () -> 

	$('.Label_listItem').removeClass 'active'
	$('.CompositionImage_link').removeClass 'active'

	className = $(this).attr('class')
	activePoint = $(this).attr('pivotpoint')

	if(className == 'Label_listItem')
		pivotpointList = $('.Composition_image').find('.CompositionImage_link')
	else
		pivotpointList = $('.Label').find('.Label_listItem')

	for elements in pivotpointList
		if activePoint == $(elements).attr("pivotpoint")
			$(elements).addClass('active')
			$(this).toggleClass('active')

	compositionSec=$('.Component_details')
	for compElement in compositionSec
		if activePoint == $(compElement).attr('relpoint')
			$(compElement).removeClass("Component_details--disable")
		else	
			$(compElement).addClass("Component_details--disable")

	if($(window).width() > 900) 
		$.each(pivotpoints,(index,value) ->

			idcord=pivotpoints[index].id.toString()
			topHeight=25+idcord*40
			if (activePoint == idcord)
				c.beginPath()
				c.moveTo(500,topHeight)
				c.lineTo(550,topHeight)
				c.arc(550,topHeight,5,0,2 * Math.PI,false)
				c.fillStyle = "#666666"
				c.fill()
				c.stroke()
			else
				c.clearRect(500,topHeight-10,100,20)
		)

# /*========================================== Cross Click ==================================================*/

$('.CrossButton , .Component_heading h3').on 'click', () ->

	className = $(this).attr('class')
	activePoint = $(this).parent().parent().attr('relpoint')
	labelList = $('.Composition_image').find('.Label_listItem')
	pivotpointList = $('.Composition_image').find('.CompositionImage_link')

	if (className == 'CrossButton')
		$(this).parent().parent().addClass('Component_details--disable')
		$(this).parent().find(".Component_wrapper").css({"display":"none"})
	else
		$(this).parent().parent().removeClass("Component_details--disable")
		$(this).parent().parent().siblings('div').addClass("Component_details--disable")

	for elements in pivotpointList
		if activePoint == $(elements).attr('pivotpoint')
			if ($(this).attr('class') == 'CrossButton')
				$(elements).removeClass('active')
			else
				$(elements).addClass('active')
		else
			$(elements).removeClass('active')
			
	for elements in labelList
		if activePoint == $(elements).attr('pivotpoint')
			if ($(this).attr('class') == 'CrossButton')
				$(elements).removeClass('active')
			else
				$(elements).addClass('active')
		else
			$(elements).removeClass('active')
	idcord=pivotpoints[activePoint].id
	topHeight=25+idcord*40	
	c.clearRect(500,topHeight-10,100,20)