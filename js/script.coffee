canvas = document.querySelector("canvas")
c = canvas.getContext("2d")
imageArray = 
[
	{
		"src":"./Images/sph4.svg",
		"id":"0"
	},
	{
		"src":"./Images/bsph4.svg",
		"id":"1"
	},
	{
		"src":"./Images/oct3.svg",
		"id":"2"
	},
	{
		"src":"./Images/sphi4.svg",
		"id":"3"
	}
]

$(document).ready ->
	initialize()
	# $(window).bind('onload',redraw())
	@canvasColor = '#666666'
initialize = () ->

	$(window).bind('resize',resizeCanvas)
	resizeCanvas()

resizeCanvas = () ->
	canvas.height = 300
	
	if ($(window).width() < 900) 
		c.strokeStyle = "#666666"
		canvas.width = 300
		redraw()
	else 
		canvas.width = 570
		c.strokeStyle = "#666666"
		redraw()
	
#/* *************************** For canva on page Load ********************************* */#
	
redraw = () ->

	$.getJSON('JSON/sph4.json',(data) ->
	
		$.each(data,(index,value) ->
			xcord = data[index].x
			ycord = data[index].y
			idcord = data[index].id
			topHeight = 25 + idcord * 40
			$("a.CompositionImage_link[pivotpoint="+idcord+"]").css("top":ycord-7,"left":xcord-7)
			c.beginPath()
			c.moveTo(xcord, ycord)
			c.lineTo(265,topHeight)
			if ($(window).width() < 900)
				c.lineTo(340,topHeight)
			else
				c.fillStyle = "#666666"
				if(idcord == 0) 
					c.lineTo(550,topHeight)
					c.stroke()
					c.closePath()
					c.beginPath()
					c.arc(550,topHeight,5,0,2 * Math.PI,false)
					c.fill()
				else
					c.lineTo(500,topHeight)	
			c.stroke()
		)
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
		$.getJSON('JSON/sph4.json',(data) ->
			$.each(data,(index,value) ->
				idcord=data[index].id.toString()
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

	$.getJSON('JSON/sph4.json',(data) ->	
		$.each(data,(index,value) ->	
			idcord=data[index].id
			topHeight=25+idcord*40	
			c.clearRect(500,topHeight-10,100,20)
		)
	)