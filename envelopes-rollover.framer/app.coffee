
# Variables 
grey = new Color("rgba(0,0,0,0.45)")
green = new Color("00F5A1")
yellow = new Color("FEF36F")
red = new Color("E61248")
lightGrey = new Color("E9E9E9")

class Card extends Layer
	constructor: (options={}) ->

		# Here we define the initial parameters for the parent/"topmost" layer
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

class Budget extends Layer 
	constructor: (options={}) -> # bottom layer		
		options.width = 348
		options.height = 276
		options.backgroundColor = null
		options.image = "images/Bottom.png"
		options.clip = true
		options.index = 1
		
		super options # Initialize above first
		
		details = new Layer
			parent: @
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
			
		@progress = new Layer
			parent: details
			x: 0
			y: 0
			height: 16
			width: 276
			backgroundColor: green

		label =  new Layer
			parent: details
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
			parent: details
			y: 12
			x: 240 # align right?
			width: 0
			html: options.left
			style:
				fontSize: "16px"
				fontFamily: "Graphik"
				color: "#000"
				textTransform: "uppercase"
				textAlign: "right"

		cover = new Layer
			parent: @
			width: 352
			height: 248
			image: "images/Top.png"
			y: 16
			x: -2
		
			# Animation, to be triggered externally
		@reset = new Animation @progress,
			width: 0
			backgroundColor: green
			options:
				delay: 0.15
				time: 1.25

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
	today: 39

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
	width: 285
	height: 32
	backgroundColor: yellow
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
	index: 4

payIcon = new Layer
	parent: fabIcon
	image: 'images/payIcon.png'
	height: 36
	width: 26
	x: Align.center
	y: Align.center

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


# Arrays
	# Purchase Card Arrays.
amount = ["$4.80", "$22.16", "$72.76"] # Purchases
location = ["Early Bird Espresso", "Presto", "Sams Convenience"]
date = ["3/29", "3/28", "3/28"]

	# Budget Card Arrays – Input values here.
label = ["Coffee", "Transit", "Grocery"] # Budget Cards
left = ["$4.20", "$22.10", "$11.20"]
budgetProgress = [302, 302, 287]
budgetColour = [red, red, yellow]

	# push budget layers into this array.
budgets = []


# Card Builds
for i in [0..1]
	card = new Card
		title: amount[i]
		location: location[i]
		date: date[i]
		y: 168 + (i*10)
		x: 24
		index: 1

for i in [0..2]
	budget = new Budget
		name: "budget" + i
		x: 16
		y: 336 + (i*56)
		label: label[i]
		left: left[i]
	
	budgets.push(budget)
	
	budget.progress.width = budgetProgress[i]
	budget.progress.backgroundColor = budgetColour[i]



# Opening Animation & Modal Window
splashScreen = new Layer
	width: 375
	height: 667
	image: "images/Splash.png"
	index: 11
	x: -1

modalBackground = new Layer
	width: 375
	height: 667
	backgroundColor: "rgba(0,0,0,0.65)"
	backgroundBlur: 2
	opacity: 0

modal = new Layer
	width: 310
	height: 321
	image: "images/Modal.png"
	x: Align.center
	y: -420

	# Opening Animation
splashIntro = new Animation splashScreen,
	x: -375
	options:
		delay: 1.75
		time: 0.5
		curve: "spring(160,30,10)"

splashIntro.start()

splashIntro.onAnimationEnd ->
	
	modalBackground.animate
		opacity: 1
		options:
			time: 0.25
			curve: "spring(160,30,10)"
	
	modal.animate
		y: Align.center
		options:
			time: 0.15
			curve: "spring(160,30,10)"

# Tap Event, Modal
modal.onTap ->
	modal.animate
		y: -420
		options:
			time: 0.15
			curve: "spring(160,30,10)"
	
	modalBackground.animate
		opacity: 0
		options:
			delay: 0.10
			time: 0.45

	modalBackground.onAnimationEnd ->
		barProgress.animate
			width: 0
			backgroundColor: green
			options: 
				delay: 0.25
				time: 1.25

		for i in [0..2]
			budgets[i].reset.start()

		textToday.animate
			color: green
			template:
				today: 229
			options:
				time: 0.5
		
		textToday.onAnimationEnd ->
			textToday.animate
				color: "#000"
				options: 
					delay: 0.75


	
	




