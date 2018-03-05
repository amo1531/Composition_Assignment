window.Composition = class Composition
	constructor: ->
		@canvasColor = '#666666'
		canvas = document.querySelector("canvas")
		@context = canvas.getContext("2d")
		@pivotpointList = $('.Composition_image').find('.CompositionImage_link')
		@labelList = $('.Composition_image').find('.Label_listItem')
		@compositionSec=$('.Component_details')
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

		$('.Label_listItem , .CompositionImage_link').on "click", (e) => 

			target = $(e.currentTarget)
			className = $(e.currentTarget).attr('class')
			activePoint = $(target).attr('pivotpoint')

			if(className == 'Label_listItem')
				@addClass(target,@pivotpointList,activePoint)
			else
				@addClass(target,@labelList,activePoint)
			
			@addDisableClass(activePoint,@compositionSec)
			
			if($(window).width() > 900) 
				@extendLineToComponentDiv(activePoint)

		$('.CrossButton , .Component_heading h3').on 'click', (e) =>

			className = $(e.currentTarget).attr('class')
			activePoint = $(e.currentTarget).parent().parent().attr('relpoint')

			if (className == 'CrossButton')
				$(e.currentTarget).parent().parent().addClass('Component_details--disable')
				$(e.currentTarget).parent().find(".Component_wrapper").css({"display":"none"})
			else
				@addDisableClass(activePoint,@compositionSec)
			
			@activeClassOnCrossAndHeading(activePoint ,@labelList, className)
			@activeClassOnCrossAndHeading(activePoint ,@pivotpointList, className)
			@removeExtendedLine()
			

	addDisableClass: (active,@targetArray) ->

		$.each(@targetArray,(index,obj) =>
			if active == $(obj).attr('relpoint')
				$(obj).removeClass("Component_details--disable")
			else	
				$(obj).addClass("Component_details--disable")
		)

	activeClassOnCrossAndHeading: (active ,@targetArray ,className) ->

		$.each(@targetArray,(index,obj) =>
			if (active == $(obj).attr('pivotpoint'))
				if(className == 'CrossButton')
					$(obj).removeClass('active')
				else
					$(obj).addClass('active')
			else
				$(obj).removeClass('active')
		)

	addClass: (target ,@targetArray ,active) ->

		$('.Label_listItem').removeClass 'active'
		$('.CompositionImage_link').removeClass 'active'
		
		$.each(@targetArray,(index,obj) =>

			if (active == $(obj).attr('pivotpoint'))
				$(obj).addClass('active')
				$(target).toggleClass('active')
		)

	extendLineToComponentDiv: (activePoint) ->

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
	removeExtendedLine :->

		$.getJSON('JSON/data.json',(data) => 
			$.each(data.pivotpoints[@randomObj],(index,value) =>

				idcord=data.pivotpoints[@randomObj][index].id.toString()
				topHeight=25+idcord*40
				@context.clearRect(500,topHeight-10,100,20)
			)
		)

	initialize: ->

		$('.SphereImage').attr('src', @imageSource)
		@resizeCanvas()

	resizeCanvas: ->

		canvas.height = 300
		@context.strokeStyle = @canvasColor

		if ($(window).width() < 900) 
			canvas.width = 300
			@redraw()
		else 
			canvas.width = 570
			@redraw()
		
	#/* *************************** For canva on page Load ********************************* */#
		
	redraw: () ->
	
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