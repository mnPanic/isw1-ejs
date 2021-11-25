!classDefinition: #SmartBuildingTest category: 'ISW1-2021-2C-2doParcial'!
TestCase subclass: #SmartBuildingTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 19:13:01'!
blueTeam

	^self blueTeamWithMeteorologicalService: self meteorologicalServiceWithoutRainyDays.

! !

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 18:52:05'!
blueTeamWithMeteorologicalService: aMeteorologicalService

	^ self
		constructionTeamWithPricePerDay: 1500 * peso / day
		whenRaining: 1700 * peso / day 
		startingCapacity: 300 * (meter^2) / week
		after: 10 * day "les agarra la pachorra"
		decreasingCapacityTo: 20 * (meter^2) / day
		consultingWeatherTo: aMeteorologicalService.
! !

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 19:43:26'!
constructionTeamWithFixedPricePerDay: aPricePerDay
constantCapacity: aCapacityPerDay

	^ ConstructionTeam
		withPricingPolicy: (FixedPrice perDay: aPricePerDay)
		withCapacityPolicy: (ConstantCapacity perDay: aCapacityPerDay).
	
	! !

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 19:53:06'!
constructionTeamWithFixedPricePerDay: aPricePerDay
startingCapacity: aStartingCapacity
after: anAmountOfDays
decreasingCapacityTo: aCapacityAfterDecrease 

	^ ConstructionTeam
		withPricingPolicy: (FixedPrice perDay: aPricePerDay)
		withCapacityPolicy: (DecreasingCapacity
			withStartingCapacity: aStartingCapacity
			andAfter: anAmountOfDays
			decreasingCapacityTo: aCapacityAfterDecrease)! !

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 19:57:54'!
constructionTeamWithPricePerDay: aPricePerNormalDay
whenRaining: aPricePerRainyDay
constantCapacity: aCapacityPerDay
consultingWeatherTo: aMeteorologicalService.

	^ ConstructionTeam
		withPricingPolicy: (RainPrice 	
			withPricePerNormalDay: aPricePerNormalDay
			whenRaining: aPricePerRainyDay
			consultingWeatherTo: aMeteorologicalService)
		withCapacityPolicy: (ConstantCapacity perDay: aCapacityPerDay).


	! !

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 19:57:54'!
constructionTeamWithPricePerDay: aPricePerNormalDay
whenRaining: aPricePerRainyDay
startingCapacity: aStartingCapacity
after: anAmountOfDays
decreasingCapacityTo: aCapacityAfterDecrease 
consultingWeatherTo: aMeteorologicalService

	^ ConstructionTeam
		withPricingPolicy: (RainPrice 	
			withPricePerNormalDay: aPricePerNormalDay
			whenRaining: aPricePerRainyDay
			consultingWeatherTo: aMeteorologicalService)
		withCapacityPolicy: (DecreasingCapacity 
			withStartingCapacity: aStartingCapacity
			andAfter: anAmountOfDays
			decreasingCapacityTo: aCapacityAfterDecrease
		)
! !

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 19:12:06'!
greenTeam

	^ self greenTeamWithMeteorologicalService: self meteorologicalServiceWithoutRainyDays.! !

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 19:12:23'!
greenTeamWithMeteorologicalService: aMeteorologicalService 
	
	^ self
		constructionTeamWithPricePerDay: 1000 * peso / day
		whenRaining: 1200 * peso / day
		constantCapacity: 25 * (meter^2) / day
		consultingWeatherTo: aMeteorologicalService.! !

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 19:13:12'!
meteorologicalServiceWithoutRainyDays

	^ MeteorologicalServiceStub withRainyDays: 0
! !

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 18:16:01'!
redTeam

	^ self constructionTeamWithFixedPricePerDay: 1000 * peso / day constantCapacity: 25 * (meter^2) / day! !

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 19:23:49'!
yellowTeam

	^ self
		constructionTeamWithFixedPricePerDay: 1000 * peso / day
		startingCapacity: 300 * (meter^2) / week
		after: 10 * day "les agarra la pachorra"
		decreasingCapacityTo: 20 * (meter^2) / day.! !


!SmartBuildingTest methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 18:15:01'!
test01FixedDateAndConstantCapacityComputesTimeTakenToBuild

	| redTeam |
	redTeam _ self redTeam.
	
	self assert: 5 * day equals: (redTeam timeInDaysTakenToBuild: 25 * 5 * (meter^2)).

	! !

!SmartBuildingTest methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 18:15:01'!
test02FixedDateAndConstantComputesReturnsCostOfBuilding

	| redTeam |
	redTeam _ self redTeam.
	
	self assert: 5000 * peso equals: (redTeam costOfBuilding: 25 * 5 * (meter^2)).

	! !

!SmartBuildingTest methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 18:15:01'!
test03FixedDateAndConstantCapacityReturnsAnIntegerNumberOfDays

	| redTeam |
	redTeam _ self redTeam.
	
	self assert: 1 * day equals: (redTeam timeInDaysTakenToBuild: 5 * (meter^2)).

	! !

!SmartBuildingTest methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 19:00:50'!
test04RainyPriceAndVariableCapacityComputesTimeTakenBeforeDecreaseInCapacity

	| blueTeam |
	blueTeam _ self blueTeam.
	
	self assert: 7 * day equals: (blueTeam timeInDaysTakenToBuild: 300 * (meter^2)).

	! !

!SmartBuildingTest methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 19:00:43'!
test05RainyPriceAndVariableCapacityComputesTimeTakenAfterDecreaseInCapacity

	| blueTeam |
	blueTeam _ self blueTeam.

	self assert: 14 * day equals: (blueTeam timeInDaysTakenToBuild: 500 * (meter^2)).

	! !

!SmartBuildingTest methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 19:01:01'!
test06RainyPriceAndVariableCapacityComputesCostOfBuildingWithNormalDays

	| blueTeam |
	blueTeam _ self blueTeam.

	self assert: 14 * 1500 * peso equals: (blueTeam costOfBuilding: 500 * (meter^2)).

	! !

!SmartBuildingTest methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 19:01:20'!
test07RainyPriceAndVariableCapacityComputesCostOfBuildingWithRainyAndNormalDays

	| blueTeam |
	blueTeam _ self blueTeamWithMeteorologicalService:
		(MeteorologicalServiceStub withRainyDays: 5*day).

	self assert: ((14-5) * (1500*peso)) + (5 * (1700*peso)) equals: (blueTeam costOfBuilding: 500 * (meter^2)).! !

!SmartBuildingTest methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 19:16:15'!
test08RainyPriceAndConstantCapacityComputesTimeTakenToBuild

	| greenTeam |
	greenTeam _ self greenTeam.

	self assert: 5 * day equals: (greenTeam timeInDaysTakenToBuild: 25 * 5 * (meter^2)).! !

!SmartBuildingTest methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 19:16:27'!
test09RainyPriceAndConstantCapacityComputesCostOfBuildingWithRainyAndNormalDays

	| greenTeam |
	greenTeam _ self greenTeamWithMeteorologicalService:
		(MeteorologicalServiceStub withRainyDays: 5 * day).

	self assert: (5 * (1000 * peso)) + (5 * (1200 * peso)) equals: (greenTeam costOfBuilding: 25 * 10 * (meter^2)).! !

!SmartBuildingTest methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 19:31:25'!
test10FixedPriceAndVariableCapacityComputesTimeTakenAfterDecrease

	| yellowTeam |
	yellowTeam _ self yellowTeam.

	self assert: 14 * day equals: (yellowTeam timeInDaysTakenToBuild: 500 * (meter^2)).! !

!SmartBuildingTest methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 19:31:35'!
test11FixedPriceAndVariableCapacityComputesCost

	| yellowTeam |
	yellowTeam _ self yellowTeam.

	self assert: 14 * 1000 * peso equals: (yellowTeam costOfBuilding: 500 * (meter^2)).! !


!classDefinition: #CapacityPolicy category: 'ISW1-2021-2C-2doParcial'!
Object subclass: #CapacityPolicy
	instanceVariableNames: 'pricingPolicy capacityPolicy'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!

!CapacityPolicy methodsFor: 'time calculation' stamp: 'MP 11/25/2021 19:57:09'!
timeInDaysTakenToBuild: anArea

	self subclassResponsibility! !


!classDefinition: #ConstantCapacity category: 'ISW1-2021-2C-2doParcial'!
CapacityPolicy subclass: #ConstantCapacity
	instanceVariableNames: 'capacity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!

!ConstantCapacity methodsFor: 'initialization' stamp: 'MP 11/25/2021 19:40:58'!
initializePerDay: aCapacity 

	capacity := aCapacity.! !


!ConstantCapacity methodsFor: 'time calculation' stamp: 'MP 11/25/2021 19:42:25'!
timeInDaysTakenToBuild: anArea

	^ (anArea / capacity) ceiling.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ConstantCapacity class' category: 'ISW1-2021-2C-2doParcial'!
ConstantCapacity class
	instanceVariableNames: ''!

!ConstantCapacity class methodsFor: 'instance creation' stamp: 'MP 11/25/2021 19:40:48'!
perDay: aCapacity 

	^self new initializePerDay: aCapacity ! !


!classDefinition: #DecreasingCapacity category: 'ISW1-2021-2C-2doParcial'!
CapacityPolicy subclass: #DecreasingCapacity
	instanceVariableNames: 'startingCapacity daysBeforeDecrease capacityAfterDecrease'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!

!DecreasingCapacity methodsFor: 'initialization' stamp: 'MP 11/25/2021 19:53:28'!
initializeWithStartingCapacity: aStartingCapacity
andAfter: anAmountOfDays
decreasingCapacityTo: aCapacityAfterDecrease 

	startingCapacity := aStartingCapacity.
	daysBeforeDecrease := anAmountOfDays.
	capacityAfterDecrease := aCapacityAfterDecrease.! !


!DecreasingCapacity methodsFor: 'time calculation' stamp: 'MP 11/25/2021 19:46:50'!
timeInDaysTakenToBuild: anArea
	
	| areaConstructedEfficiently remainderToConstruct timeToConstructEfficiently timeToConstructRemainder |
	areaConstructedEfficiently _ startingCapacity * daysBeforeDecrease.	
	areaConstructedEfficiently > anArea ifTrue: [
		^ anArea / startingCapacity ceiling. "TODO: test para ceiling"
	].

	remainderToConstruct _ anArea - areaConstructedEfficiently.
	timeToConstructRemainder _ remainderToConstruct / capacityAfterDecrease.
	timeToConstructEfficiently _ areaConstructedEfficiently / startingCapacity.
	
	^ (timeToConstructEfficiently + timeToConstructRemainder) ceiling.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DecreasingCapacity class' category: 'ISW1-2021-2C-2doParcial'!
DecreasingCapacity class
	instanceVariableNames: ''!

!DecreasingCapacity class methodsFor: 'instance creation' stamp: 'MP 11/25/2021 19:53:37'!
withStartingCapacity: aStartingCapacity
andAfter: anAmountOfDays
decreasingCapacityTo: aCapacityAfterDecrease	

	^self new
		initializeWithStartingCapacity: aStartingCapacity
		andAfter: anAmountOfDays
		decreasingCapacityTo: aCapacityAfterDecrease ! !


!classDefinition: #ConstructionTeam category: 'ISW1-2021-2C-2doParcial'!
Object subclass: #ConstructionTeam
	instanceVariableNames: 'pricingPolicy capacityPolicy'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!

!ConstructionTeam methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 19:44:19'!
costOfBuilding: anArea

	^ pricingPolicy costOf: (self timeInDaysTakenToBuild: anArea)! !

!ConstructionTeam methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 19:44:05'!
timeInDaysTakenToBuild: anArea

	^ capacityPolicy timeInDaysTakenToBuild: anArea.! !


!ConstructionTeam methodsFor: 'initialization' stamp: 'MP 11/25/2021 19:53:52'!
initializeWithPricingPolicy: aPricingPolicy
withCapacityPolicy: aCapacityPolicy

	pricingPolicy := aPricingPolicy.
	capacityPolicy := aCapacityPolicy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ConstructionTeam class' category: 'ISW1-2021-2C-2doParcial'!
ConstructionTeam class
	instanceVariableNames: ''!

!ConstructionTeam class methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 19:32:46'!
withPricingPolicy: aPricingPolicy ! !


!ConstructionTeam class methodsFor: 'instance creation' stamp: 'MP 11/25/2021 19:53:47'!
withPricingPolicy: aPricingPolicy
withCapacityPolicy: aCapacityPolicy

	^self new 
		initializeWithPricingPolicy: aPricingPolicy
		withCapacityPolicy: aCapacityPolicy ! !


!classDefinition: #MeteorologicalService category: 'ISW1-2021-2C-2doParcial'!
Object subclass: #MeteorologicalService
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!

!MeteorologicalService methodsFor: 'weather forecasting' stamp: 'MP 11/25/2021 19:55:43'!
daysOfRainInTheNext: aNumberOfDays
	
	self subclassResponsibility! !


!classDefinition: #MeteorologicalServiceStub category: 'ISW1-2021-2C-2doParcial'!
MeteorologicalService subclass: #MeteorologicalServiceStub
	instanceVariableNames: 'daysOfRain'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!

!MeteorologicalServiceStub methodsFor: 'initialization' stamp: 'MP 11/25/2021 18:59:25'!
initializeWithRainyDays: aNumberOfDays

	daysOfRain := aNumberOfDays.! !


!MeteorologicalServiceStub methodsFor: 'weather forecasting' stamp: 'MP 11/25/2021 18:59:25'!
daysOfRainInTheNext: aNumberOfDays
	
	^ daysOfRain.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MeteorologicalServiceStub class' category: 'ISW1-2021-2C-2doParcial'!
MeteorologicalServiceStub class
	instanceVariableNames: ''!

!MeteorologicalServiceStub class methodsFor: 'instance creation' stamp: 'MP 11/25/2021 18:53:26'!
withRainyDays: aNumberOfDays 

	^self new initializeWithRainyDays: aNumberOfDays ! !


!classDefinition: #PricingPolicy category: 'ISW1-2021-2C-2doParcial'!
Object subclass: #PricingPolicy
	instanceVariableNames: 'pricingPolicy capacityPolicy'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!

!PricingPolicy methodsFor: 'cost calculation' stamp: 'MP 11/25/2021 19:36:57'!
costOf: aNumberOfDays

	self subclassResponsibility.! !


!classDefinition: #FixedPrice category: 'ISW1-2021-2C-2doParcial'!
PricingPolicy subclass: #FixedPrice
	instanceVariableNames: 'pricePerDay'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!

!FixedPrice methodsFor: 'initialization' stamp: 'MP 11/25/2021 19:40:13'!
initializePerDay: aPricePerDay 

	pricePerDay _ aPricePerDay.! !


!FixedPrice methodsFor: 'cost calculation' stamp: 'MP 11/25/2021 19:37:17'!
costOf: aNumberOfDays

	^ pricePerDay * aNumberOfDays.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FixedPrice class' category: 'ISW1-2021-2C-2doParcial'!
FixedPrice class
	instanceVariableNames: ''!

!FixedPrice class methodsFor: 'instance creation' stamp: 'MP 11/25/2021 19:39:53'!
perDay: aPricePerDay

	^self new initializePerDay: aPricePerDay ! !


!classDefinition: #RainPrice category: 'ISW1-2021-2C-2doParcial'!
PricingPolicy subclass: #RainPrice
	instanceVariableNames: 'pricePerNormalDay pricePerRainyDay meteorologicalService'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!

!RainPrice methodsFor: 'initialization' stamp: 'MP 11/25/2021 19:54:02'!
initializeWithPricePerNormalDay: aPricePerNormalDay
whenRaining: aPricePerRainyDay
consultingWeatherTo: aMeteorologicalService 

	pricePerNormalDay := aPricePerNormalDay.
	pricePerRainyDay := aPricePerRainyDay.
	meteorologicalService := aMeteorologicalService.! !


!RainPrice methodsFor: 'cost calculation' stamp: 'MP 11/25/2021 19:51:11'!
costOf: aNumberOfDays

	| normalDays rainyDays |
	rainyDays _ meteorologicalService daysOfRainInTheNext: aNumberOfDays.
	normalDays _ aNumberOfDays - rainyDays.
	
	^ (normalDays * pricePerNormalDay) + (rainyDays * pricePerRainyDay).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RainPrice class' category: 'ISW1-2021-2C-2doParcial'!
RainPrice class
	instanceVariableNames: ''!

!RainPrice class methodsFor: 'instance creation' stamp: 'MP 11/25/2021 19:50:19'!
withPricePerNormalDay: aPricePerNormalDay
whenRaining: aPricePerRainyDay
consultingWeatherTo: aMeteorologicalService	

	^self new
		initializeWithPricePerNormalDay: aPricePerNormalDay
		whenRaining: aPricePerRainyDay
		consultingWeatherTo: aMeteorologicalService ! !
