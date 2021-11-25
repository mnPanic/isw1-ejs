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

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 18:22:50'!
constructionTeamWithFixedPricePerDay: aPricePerDay constantCapacity: aCapacityPerDay

	^FixedDateAndConstantCapacityConstructionTeam withFixedPrice: aPricePerDay constantCapacity: aCapacityPerDay.
	
	! !

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 19:21:10'!
constructionTeamWithFixedPricePerDay: aPricePerDay
startingCapacity: aStartingCapacity
after: anAmountOfDays
decreasingCapacityTo: aCapacityAfterDecrease 

	^ FixedPriceAndVariableCapacityConstructionTeam
		withPricePerDay: aPricePerDay
		startingCapacity: aStartingCapacity after: anAmountOfDays
		decreasingCapacityTo: aCapacityAfterDecrease! !

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 19:07:19'!
constructionTeamWithPricePerDay: aPricePerNormalDay
whenRaining: aPricePerRainyDay
constantCapacity: aCapacityPerDay

	^ RainyPriceAndConstantCapacityConstructionTeam
		withPricePerDay: aPricePerNormalDay
		whenRaining: aPricePerRainyDay
		constantCapacity: aCapacityPerDay.

	! !

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 19:12:38'!
constructionTeamWithPricePerDay: aPricePerNormalDay
whenRaining: aPricePerRainyDay
constantCapacity: aCapacityPerDay
consultingWeatherTo: aMeteorologicalService.

	^ RainyPriceAndConstantCapacityConstructionTeam
		withPricePerDay: aPricePerNormalDay
		whenRaining: aPricePerRainyDay
		constantCapacity: aCapacityPerDay
		consultingWeatherTo: aMeteorologicalService.

	! !

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 19:07:03'!
constructionTeamWithPricePerDay: aPricePerNormalDay
whenRaining: aPricePerRainyDay
startingCapacity: aStartingCapacity
after: anAmountOfDays
decreasingCapacityTo: aCapacityAfterDecrease 
consultingWeatherTo: aMeteorologicalService

	^ RainyPriceAndVariableCapacityConstructionTeam
		withPricePerDay: aPricePerNormalDay
		whenRaining: aPricePerRainyDay
		startingCapacity: aStartingCapacity after: anAmountOfDays
		decreasingCapacityTo: aCapacityAfterDecrease
		consultingWeatherTo: aMeteorologicalService.! !

!SmartBuildingTest methodsFor: 'team building' stamp: 'MP 11/25/2021 19:20:13'!
greenTeam

	^ self
		constructionTeamWithFixedPricePerDay: 1500 * peso / day
		startingCapacity: 300 * (meter^2) / week
		after: 10 * day "les agarra la pachorra"
		decreasingCapacityTo: 20 * (meter^2) / day
! !

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

!SmartBuildingTest methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 19:18:13'!
test10

	| yellowTeam |
	yellowTeam _ self yellowTeam.

	self assert: 1 * day equals: (yellowTeam timeInDaysTakenToBuild: 25 * 10 * (meter^2)).! !


!classDefinition: #FixedDateAndConstantCapacityConstructionTeam category: 'ISW1-2021-2C-2doParcial'!
Object subclass: #FixedDateAndConstantCapacityConstructionTeam
	instanceVariableNames: 'pricePerDay capacityPerDay'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!

!FixedDateAndConstantCapacityConstructionTeam methodsFor: 'initialization' stamp: 'MP 11/25/2021 18:01:11'!
initializeWithFixedPrice: aPricePerDay constantCapacity: aCapacityPerDay 

	pricePerDay := aPricePerDay.
	capacityPerDay := aCapacityPerDay.! !


!FixedDateAndConstantCapacityConstructionTeam methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 18:08:40'!
costOfBuilding: anArea 
	
	^ (self timeInDaysTakenToBuild: anArea) * pricePerDay.! !

!FixedDateAndConstantCapacityConstructionTeam methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 18:11:36'!
timeInDaysTakenToBuild: anArea

	^ (anArea / capacityPerDay) ceiling.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FixedDateAndConstantCapacityConstructionTeam class' category: 'ISW1-2021-2C-2doParcial'!
FixedDateAndConstantCapacityConstructionTeam class
	instanceVariableNames: ''!

!FixedDateAndConstantCapacityConstructionTeam class methodsFor: 'instance creation' stamp: 'MP 11/25/2021 18:00:53'!
withFixedPrice: aPricePerDay constantCapacity: aCapacityPerDay 

	^self new initializeWithFixedPrice: aPricePerDay constantCapacity: aCapacityPerDay ! !


!classDefinition: #FixedPriceAndVariableCapacityConstructionTeam category: 'ISW1-2021-2C-2doParcial'!
Object subclass: #FixedPriceAndVariableCapacityConstructionTeam
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!


!classDefinition: #MeteorologicalServiceStub category: 'ISW1-2021-2C-2doParcial'!
Object subclass: #MeteorologicalServiceStub
	instanceVariableNames: 'daysOfRain'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!

!MeteorologicalServiceStub methodsFor: 'initialization' stamp: 'MP 11/25/2021 18:59:25'!
initializeWithRainyDays: aNumberOfDays

	daysOfRain := aNumberOfDays.! !


!MeteorologicalServiceStub methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 18:59:25'!
daysOfRainInTheNext: aNumberOfDays
	
	^ daysOfRain.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MeteorologicalServiceStub class' category: 'ISW1-2021-2C-2doParcial'!
MeteorologicalServiceStub class
	instanceVariableNames: ''!

!MeteorologicalServiceStub class methodsFor: 'instance creation' stamp: 'MP 11/25/2021 18:53:26'!
withRainyDays: aNumberOfDays 

	^self new initializeWithRainyDays: aNumberOfDays ! !


!classDefinition: #RainyPriceAndConstantCapacityConstructionTeam category: 'ISW1-2021-2C-2doParcial'!
Object subclass: #RainyPriceAndConstantCapacityConstructionTeam
	instanceVariableNames: 'pricePerNormalDay pricePerRainyDay capacityPerDay weatherService meteorologicalService'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!

!RainyPriceAndConstantCapacityConstructionTeam methodsFor: 'initialization' stamp: 'MP 11/25/2021 19:15:29'!
initializeWithPricePerDay: aPricePerNormalDay
whenRaining: aPricePerRainyDay
constantCapacity: aConstantCapacity 
consultingWeatherTo: aMeteorologicalService

	pricePerNormalDay := aPricePerNormalDay.
	pricePerRainyDay := aPricePerRainyDay.
	capacityPerDay := aConstantCapacity.
	meteorologicalService _ aMeteorologicalService.! !

!RainyPriceAndConstantCapacityConstructionTeam methodsFor: 'initialization' stamp: 'MP 11/25/2021 19:08:30'!
timeInDaysTakenToBuild: anArea

	^ (anArea / capacityPerDay) ceiling.! !


!RainyPriceAndConstantCapacityConstructionTeam methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 19:15:09'!
costOfBuilding: anArea 

	| normalDays rainyDays timeTakenInDays |
	timeTakenInDays _ self timeInDaysTakenToBuild: anArea.
	rainyDays _ meteorologicalService daysOfRainInTheNext: timeTakenInDays.
	normalDays _ timeTakenInDays - rainyDays.
	
	^ (normalDays * pricePerNormalDay) + (rainyDays * pricePerRainyDay).
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RainyPriceAndConstantCapacityConstructionTeam class' category: 'ISW1-2021-2C-2doParcial'!
RainyPriceAndConstantCapacityConstructionTeam class
	instanceVariableNames: ''!

!RainyPriceAndConstantCapacityConstructionTeam class methodsFor: 'instance creation' stamp: 'MP 11/25/2021 19:14:12'!
withPricePerDay: aPricePerNormalDay
whenRaining: aPricePerRainyDay
constantCapacity: aConstantCapacity
consultingWeatherTo: aWeatherService

	^self new
		initializeWithPricePerDay: aPricePerNormalDay
		whenRaining: aPricePerRainyDay
		constantCapacity: aConstantCapacity 
		consultingWeatherTo: aWeatherService
! !


!classDefinition: #RainyPriceAndVariableCapacityConstructionTeam category: 'ISW1-2021-2C-2doParcial'!
Object subclass: #RainyPriceAndVariableCapacityConstructionTeam
	instanceVariableNames: 'pricePerNormalDay pricePerRainyDay startingCapacity daysBeforeDecrease capacityAfterDecrease meteorologicalService'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!

!RainyPriceAndVariableCapacityConstructionTeam methodsFor: 'initialization' stamp: 'MP 11/25/2021 18:52:43'!
initializeWithPricePerDay: aPricePerNormalDay
whenRaining: aPricePerRainyDay
startingCapacity: aStartingCapacity
after: anAmountOfDays
decreasingCapacityTo: aCapacityAfterDecrease
consultingWeatherTo: aMeteorologicalService

	pricePerNormalDay _ aPricePerNormalDay.
	pricePerRainyDay _ aPricePerRainyDay.
	startingCapacity _ aStartingCapacity.
	daysBeforeDecrease _ anAmountOfDays.
	capacityAfterDecrease _ aCapacityAfterDecrease.
	meteorologicalService _ aMeteorologicalService.! !


!RainyPriceAndVariableCapacityConstructionTeam methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 18:58:30'!
costOfBuilding: anArea

	| normalDays rainyDays timeTakenInDays |
	timeTakenInDays _ self timeInDaysTakenToBuild: anArea.
	rainyDays _ meteorologicalService daysOfRainInTheNext: timeTakenInDays.
	normalDays _ timeTakenInDays - rainyDays.
	
	^ (normalDays * pricePerNormalDay) + (rainyDays * pricePerRainyDay).! !

!RainyPriceAndVariableCapacityConstructionTeam methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 18:46:28'!
timeInDaysTakenToBuild: anArea
	
	| areaConstructedEfficiently remainderToConstruct timeToConstructEfficiently timeToConstructRemainder |
	areaConstructedEfficiently _ startingCapacity * daysBeforeDecrease.	
	areaConstructedEfficiently > anArea ifTrue: [
		^ anArea / startingCapacity.	
	].

	remainderToConstruct _ anArea - areaConstructedEfficiently.
	timeToConstructRemainder _ remainderToConstruct / capacityAfterDecrease.
	timeToConstructEfficiently _ areaConstructedEfficiently / startingCapacity.
	
	^ (timeToConstructEfficiently + timeToConstructRemainder) ceiling.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RainyPriceAndVariableCapacityConstructionTeam class' category: 'ISW1-2021-2C-2doParcial'!
RainyPriceAndVariableCapacityConstructionTeam class
	instanceVariableNames: ''!

!RainyPriceAndVariableCapacityConstructionTeam class methodsFor: 'instance creation' stamp: 'MP 11/25/2021 18:52:22'!
withPricePerDay: aPricePerNormalDay
whenRaining: aPricePerRainyDay
startingCapacity: aStartingCapacity
after: anAmountOfDays
decreasingCapacityTo: aCapacityAfterDecrease 
consultingWeatherTo: aMeteorologicalService

	^self new
		initializeWithPricePerDay: aPricePerNormalDay
		whenRaining: aPricePerRainyDay
		startingCapacity: aStartingCapacity after: anAmountOfDays
		decreasingCapacityTo: aCapacityAfterDecrease 
		consultingWeatherTo: aMeteorologicalService.! !
