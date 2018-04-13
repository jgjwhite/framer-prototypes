
# Variables 
green = new Color("00F5A1")
grey = new Color("rgba(0,0,0,0.45)")
yellow = new Color("FEF36F")
red = new Color("E61248")

count = 0
i = 0 # sub-count for progressBar


class Card extends Layer
	constructor: (options={}) ->
		options.width = 327
		options.height = 84
		options.backgroundColor = "fff"
		options.borderRadius = 4
		options.shadowY = 2
		options.shadowBlur = 12
		options.shadowColor = "rgba(0, 0, 0, 0.1)"
		options.shadowSpread = 5
		options.clip = true
		
		super options # Initialize above first

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
			x: 280
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

class Budget extends Layer # Cards only.
	constructor: (options={}) ->
		options.width = 302
		options.height = 260
		options.backgroundColor = "fff"
		options.borderRadius = 4
		options.shadowY = 2
		options.shadowBlur = 12
		options.shadowColor = "rgba(0, 0, 0, 0.1)"
		options.shadowSpread = 5
		options.clip = true
		
		super options # Initialize above first

		bar = new Layer
			parent: @
			x: 0
			y: 0
			width: 302
			height: 16
			backgroundColor: grey
			
		progress = new Layer
			parent: @
			x: 0
			y: 0
			height: 16
			width: 302
			backgroundColor: green
		
		label =  new Layer
			parent: @
			y: 12
			x: 16
			width: 0
			html: options.label
			style:
				fontSize: "16px"
				fontFamily: "Graphik"
				color: "#000"
				textTransform: "uppercase"

		amtLeft = new Layer
			parent: @
			y: 12
			x: 256 # align right?
			width: 0
			html: options.left
			style:
				fontSize: "16px"
				fontFamily: "Graphik"
				color: "#000"
				textTransform: "uppercase"
				textAlign: "right"

# Arrays
amount = ["$4.80", "$22.00", "$72.76"] # Purchases
location = ["Starbucks", "Walmart", "Whole Foods"]
date = ["3/29", "3/28", "3/28"]

label = ["Coffee"] # Budget Cards
left = ["$18"]

colours = [green, yellow, red] # variables stored above.
barLength = [200, 260, 375]

	# Templating
today = [42.88,36.14,22.94,-0.88] # Total amount, top headline.

# Base Layers
textToday = new TextLayer
	text: "${today} left today"
	fontSize: 26
	fontWeight: 600
	fontFamily: 'Graphik'
	color: "#000"
	letterSpacing: 0.25
	x: 24
	y: 52
	index: 0

textToday.template =
	today: today[0]

textToday.templateFormatter =
	today: (value) ->
		Utils.round(value, 2)


purchasesEmpty = new Layer
	width: 310
	height: 84
	image: "images/empty.png"
	y: 168
	x: Align.center

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

barFull = new Layer
	width: 375
	height: 32
	backgroundColor: "E9E9E9"
	index: 0

barProgress = new Layer
	width: 160
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

# Top Level (index 10) layers
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
	index: 10

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

# Snack Bar 
snackBar = new Layer
	width: 375
	height: 32
	backgroundColor: "#000"
	y: 554
	index: 4

snackDesc = new TextLayer
	parent: snackBar
# 	text: "Spent $4.60 at Starbucks"
	text: "Spent {amount} at {location}"
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

# Budget / Envelope.
envelope = new Layer
	image: "images/Top.png"
	width: 356
	height: 248
	x: 10
	y: 374
	index: 3

flap = new Layer
	image: "images/Bottom.png"
	width: 348
	height: 276
	x: 15
	y: 352
	index: 1

coffee = new Budget
	label: label[0]
	left: left[0]
	x: 36
	y: 370
	index: 2

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
				amount: amount[i]
				location: location[i]

		barProgress.animate # progress bar animation.
			backgroundColor: colours[i]
			width: barLength[i]
			options:
				time: 0.5
			
		textToday.animate
			template:
				today: today[i + 1]
			options:
				time: 0.5
				
		card = new Card
			title: amount[i]
			location: location[i]
			date: date[i]
			y: 168 + (i*10)
			x: 375
			index: 1
		
		card.animate	
			x: 24
			options:
				time: 0.25
				curve: "spring(250,37,20)"
		
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



