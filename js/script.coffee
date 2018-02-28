window.Composition = class Composition
	constructor: ->
		@canvasColor = '#666666'
		canvas = document.querySelector("canvas")
		@context = canvas.getContext("2d")
		imageArray = 
		[
			{"src":"./Images/sph4.svg" , "obj":"sph4" },
			{"src":"./Images/bsph4.svg" , "obj":"bsph4"}, 
			{"src":"./Images/oct3.svg" , "obj":"oct3"},
			{"src":"./Images/sphi4.svg" , "obj":"sphi4" }
		]

		random = Math.floor((Math.random() * 4))
		@imageSource = imageArray[random].src
		@randomObj = imageArray[random].obj
		
	init: ->
		@initialize()
		$(window).on "resize", =>
			@resizeCanvas()

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
			$.getJSON('JSON/data.json',(data) => 
				$.each(data.pivotpoints[@randomObj],(index,value) =>

					idcord=data.pivotpoints[@randomObj][index].id.toString()
					topHeight=25+idcord*40
					if (activePoint == idcord)
						@context.beginPath()
						@context.moveTo(500,topHeight)
						@context.lineTo(550,topHeight)
						@context.arc(550,topHeight,5,0,2 * Math.PI,false)
						@context.fillStyle = @canvasColor
						@context.fill()
						@context.stroke()
					else
						@context.clearRect(500,topHeight-10,100,20)
				)	
			)

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

		$.getJSON('JSON/data.json',(data) => 
			$.each(data.pivotpoints[@randomObj],(index,value) =>

				idcord=data.pivotpoints[@randomObj][index].id
				topHeight=25+idcord*40	
				@context.clearRect(500,topHeight-10,100,20)
			)
		)


	initialize: ->
		$('.SphereImage').attr('src', @imageSource)
		@resizeCanvas()

	resizeCanvas: ->
		console.log "resize"
		canvas.height = 300
		@context.strokeStyle = @canvasColor
		if ($(window).width() < 900) 
			console.log "resize mobile"
			canvas.width = 300
			@redraw()
		else 
			console.log "resize wide"
			canvas.width = 570
			@redraw()
		
	#/* *************************** For canva on page Load ********************************* */#
		
	redraw: () ->
		console.log "redraw"
		$.getJSON('JSON/data.json',(data) => 
			$.each(data.pivotpoints[@randomObj],(index,value) =>
				
				xcord = data.pivotpoints[@randomObj][index].x
				ycord = data.pivotpoints[@randomObj][index].y
				idcord = data.pivotpoints[@randomObj][index].id
				topHeight = 25 + idcord * 40
				$("a.CompositionImage_link[pivotpoint="+idcord+"]").css("top":ycord-7,"left":xcord-7)
				@context.beginPath()
				@context.moveTo(xcord, ycord)
				@context.lineTo(265,topHeight)
				if ($(window).width() < 900)
					@context.lineTo(340,topHeight)
				else
					@context.fillStyle = @canvasColor
					if(idcord == 0) 
						@context.lineTo(550,topHeight)
						@context.stroke()
						@context.closePath()
						@context.beginPath()
						@context.arc(550,topHeight,5,0,2 * Math.PI,false)
						@context.fill()
					else
						@context.lineTo(500,topHeight)	
				@context.stroke()
			)
		)

$(document).ready ->
	compositionObject = new Composition()
	compositionObject.init()