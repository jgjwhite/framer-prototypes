
# Variables 
green = new Color("00F5A1")
grey = new Color("rgba(0,0,0,0.45)")
yellow = new Color("FEF36F")
red = new Color("E61248")
lightGrey = new Color("E9E9E9")

	# Purchase Card positions
cardPosition = 0
budgetValue = 32
	
	# Activation counters
count = 0
i = 0 # sub-count for progressBar

# Layer Set-up

class Card extends Layer
	constructor: (options={}) ->

		# Here we define the initial parameters for the parent/"topmost" layer
		options.width = 302
		options.height = 84
		options.backgroundColor = "fff"
		options.borderRadius = 4
		options.shadowY = 2
		options.shadowBlur = 12
		options.shadowColor = "rgba(0, 0, 0, 0.1)"
		options.shadowSpread = 5
		options.clip = true
		options.index = 2
		
		super options # Initialize above first
			
			# draggable properties
		@.draggable.enabled = true
		@.draggable.horizontal = false
		@.draggable.constraints =
			x: 0
			y: 168
			width: 327
			height: 480
		@.draggable.momentumOptions = {
			friction: 10
			tolerance: 0.5
		}

		# Convert to TextLayer?
		amount = new Layer
			parent: @ 
			y: 48
			x: 16
			width: 405
			height: 123
			html: options.title # custom options
			backgroundColor: null 			
			style: # Give the text some basic styling
				fontSize: "28px"
				fontWeight: "400"
				fontFamily: "Graphik"
				color: "black"

		location = new Layer
			parent: @ 
			y: 12
			x: 16
			width: 405
			height: 123
			html: options.location # custom options
			backgroundColor: null 			
			style: # Give the text some basic styling
				fontSize: "16px"
				fontWeight: "400"
				fontFamily: "Graphik"
				color: grey
				textTransform: "uppercase"
				letterSpacing: 2
		
		date = new Layer
			parent: @
			y: 12
			x: 248
			width: 405
			height: 123
			html: options.date
			backgroundColor: null
			style:
				fontSize: "16px"
				fontWeight: "400"
				fontFamily: "Graphik"
				color: grey
				textTransform: "uppercase"
				letterSpacing: 2

	# Purchase Card Arrays
amount = [22.97, 11.74]
progressWidth = [180, 244, 320]
progressColour = [yellow, red]


# Budget & Envelope.
back = new Layer
	width: 348
	height: 276
	x: 16
	y: 346
	image: "images/Bottom.png"
	clip = true
	index = 1

details = new Layer
	parent: back
	width: 302
	height: 260
	backgroundColor: "fff"
	x: 24
	y: 16
	borderRadius: 4
	shadowY: 2
	shadowBlur: 8
	shadowColor: "rgba(0, 0, 0, 0.1)"
	shadowSpread: 5
	clip: true

bar = new Layer
	parent: details
	width: 302
	height: 16
	backgroundColor: lightGrey
	
progress = new Layer
	parent: details
	x: 0
	y: 0
	height: 16
	width: progressWidth[0]
	backgroundColor: green

label =  new TextLayer
	parent: details
	y: 21
	x: 16
	text: "Grocery"
	fontSize: 16
	fontFamily: "Graphik"
	color: "#000"
	textTransform: "uppercase"

left = new TextLayer
	parent: details
	y: 21
	x: 240 
	fontSize: 16
	text: "${amount}"
	fontFamily: "Graphik"
	color: "#000"
	textTransform: "uppercase"
	textAlign: "right"

left.template =
	amount: budgetValue

left.templateFormatter =
	amount: (value) ->
		Utils.round(value, 2)


cover = new Layer #cover envelope.
	width: 356
	height: 248
	image: "images/Top.png"
	y: 366
	x: 12
	index: 3

# Base Layers
textToday = new TextLayer
	text: "${today} left this week"
	fontSize: 26
	fontWeight: 600
	fontFamily: 'Graphik'
	color: "#000"
	letterSpacing: 0.25
	x: 24
	y: 52
	index: 0

textToday.template =
	today: 42

textToday.templateFormatter =
	today: (value) ->
		Utils.round(value, 2)

settings = new Layer
	image: "images/settings.png"
	width: 24
	height: 24
	x: 327
	y: 56

textEnvelopes = new TextLayer
	x: 24
	y: 300
	text: "Envelopes"
	fontSize: 24
	fontWeight: 400
	fontFamily: 'Graphik'
	color: "#000"
	letterSpacing: 0.25
	index: 0

add = new Layer
	width: 19
	height: 19
	image: "images/add.png"
	y: 306
	x: 327
	index: 0

purchasesEmpty = new Layer
	width: 306
	height: 82
	image: "images/empty.png"
	y: 168
	x: Align.center
	index: 0

textPurchases = new TextLayer
	text: "Purchases"
	fontSize: 24
	fontWeight: 400
	fontFamily: 'Graphik'
	color: "#000"
	letterSpacing: 0.25
	x: 24
	y: 124
	index: 0

# Progress Bar
barFull = new Layer
	width: 375
	height: 32
	backgroundColor: lightGrey
	index: 0

barProgress = new Layer
	width: 265
	height: 32
	backgroundColor: green
	index: 1

# Fab Icon
fabIcon = new Layer
	width: 64
	height: 64
	x: 288
	y: 460
	borderRadius: 100
	backgroundColor: "#000"
	shadowBlur: 12
	shadowSpread: 4
	shadowY: 2
	shadowColor: "rgba(0,0,0,0.25)"
	index: 5

payIcon = new Layer
	parent: fabIcon
	image: 'images/payIcon.png'
	height: 36
	width: 26
	x: Align.center
	y: Align.center

addIcon = new Layer
	parent: fabIcon	
	image: "images/add-white.png"
	height: 24
	width: 24
	x: Align.center
	y: Align.center
	scale: 0

# Navigation
tabBar = new Layer
	width: 375
	height: 68
	y: 552
	image: 'images/bottomNav.png'
	shadowBlur: 8
	shadowSpread: 4
	shadowY: 2
	shadowColor: "rgba(0,0,0,0.10)"
	index: 10

navigationBar = new Layer
	image: 'images/navBar.png'
	width: 376
	height: 56
	y: 614
	x: -1
	index: 12

# Snack Bar 
snackBar = new Layer
	width: 375
	height: 32
	backgroundColor: "#000"
	y: 554
	index: 4

snackDesc = new TextLayer
	parent: snackBar
	text: "Spent 2.97 at Jerry's Convenience"
	fontSize: 14
	fontWeight: 400
	fontFamily: 'Graphik'
	color: "#fff"
	letterSpacing: 0.25
	y: 8
	x: 16

snackEdit = new TextLayer
	parent: snackBar
	text: "EDIT"
	fontSize: 14
	fontWeight: 400
	fontFamily: 'Graphik'
	color: "#00F5A1"
	letterSpacing: 0.25
	opacity: 0.85
	y: 8
	x: 320

# Bottom Sheet
bottomSheet = new Layer
	image: "images/bottomSheet.png"
	width: 375
	height: 420
	y: 540 # Start position
	index: 4

fade = new Layer
	width: 375
	height: 667
	index: 3
	backgroundColor: "rgba(0,0,0,0.45)"
	backgroundBlur: 2
	opacity: 0

# Purchase Cards.
cardOne = new Card
	title: "$#{amount[1]}"
	location: "Metro"
	date: "3/29"
	x: Align.center
	y: 168
	index: 1

cardTwo = new Card
	title: "$#{amount[0]}"
	location: "Superstore"
	date: "3/29"
	x: Align.center
	y: 178
	index: 1

# Logic, Draggable Purchase Cards 
cardDistance = (layer, value, width, colour, y) ->
	if layer.y > 280 
		layer.animate
			y: 620
			options: 
				time: 0.85
			
		left.template =
			amount: budgetValue - value
		budgetValue = budgetValue - value # update budget
		
		progress.animate
			width: width
			backgroundColor: colour
		
	else
		layer.animate
			y: y
			options:
				curve: "spring(250,37,20)"
				time: 0.35

cardOne.onDragEnd ->
	cardDistance(cardOne, amount[1], progressWidth[2], progressColour[1], 168)

cardTwo.onDragEnd -> # Top layer
	cardDistance(cardTwo, amount[0], progressWidth[1], progressColour[0], 178)

# Activation Functions
activate = ->
	bottomSheet.animate
		y: 200
		options:
			curve: "spring(250,37,20)"
		
	fade.animate
		opacity: 1
		options:
			time: 0.45

	payIcon.animate
		scale: 0
		options:
			time: 0.25

	addIcon.animate
		scale: 1
		rotation: 360
		options:
			delay: 0.25
			time: 0.25

# Deactivation Function.
deactivate = ->
	bottomSheetReverse = new Animation bottomSheet,
		y: 540
		options:
			curve: "spring(250,37,20)"
		
	bottomSheetReverse.start()

	fade.animate
		opacity: 0
		options:
			time: 0.75
			
	payIcon.animate
		scale: 1
		options:
			delay: 0.25
			time: 0.45

	addIcon.animate
		scale: 0
		options:
			time: 0.25
		
	bottomSheetReverse.onAnimationEnd -> # chaining animiations
		
		fabIcon.animate
			y: 426
			options:
				curve: "spring(250,37,20)"
		
		snackBar.animate
			y: 520
			options:
				curve: "spring(250,37,20)"

		snackDesc.animate
			template:
# 				amount: amount[i]
# 				location: location[i]
				amount: 2.97
				location: "Jerry's Convenience"

		barProgress.animate # progress bar animation.
# 			backgroundColor: colours[i]
# 			width: barLength[i]
			backgroundColor: green
			width: 285
			options:
				time: 0.5
			
		textToday.animate
			template:
				today: 39.03
			options:
				time: 0.5
				
		cardThree = new Card
			title: 2.97
			location: "Jerry's Convenience"
			date: "3/29"
			y: 188
			x: 375
			index: 1
		
		cardThree.animate	
			x: Align.center
			options:
				time: 0.25
				curve: "spring(250,37,20)"
		
		cardThree.onDragEnd ->
			cardDistance(cardThree, 2.97, 196, green, 188)
	
		i++ # increment i; loop through arrays

		snackBar.onAnimationEnd ->
			
			snackBar.animate
				y: 554
				options:
					delay: 1.5
					curve: "spring(250,37,20)"
			
			fabIcon.animate
				y: 460
				options:
					delay: 1.5
					curve: "spring(250,37,20)"






# Activation Logic
logic = () ->
	if count % 2 == 0 # if count is even
		deactivate()
		
	else 
		activate() 

# Activation Interaction.
fabIcon.onClick ->
	count++
	logic(count)



