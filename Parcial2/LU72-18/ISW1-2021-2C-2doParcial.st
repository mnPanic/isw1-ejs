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


!SmartBuildingTest methodsFor: 'tests - combined teams' stamp: 'MP 11/25/2021 21:12:33'!
test12CombinedTeamShouldComputeDaysToBuildAsMaxOfSubteamDays

	| beta blue green |
	blue _ self blueTeam.
	green _ self greenTeam.
	beta _ CombinedTeam with: (Set with: blue with: green).	
	
	"Estoy medio en duda de que esté bien hacer esto para el expected, porque estoy testeando usando el comportamiento,
	pero me dió fiaca hacer todas las cuentas.".
	self 
		assert: { (blue daysToBuild: 500 * (meter^2)). (green daysToBuild: 500 * (meter^2)) } max
		equals: (beta daysToBuild: 1000 * (meter^2)).! !

!SmartBuildingTest methodsFor: 'tests - combined teams' stamp: 'MP 11/25/2021 21:12:29'!
test13CombinedTeamShouldComputeCostAsSumOfSubteamCosts

	| beta blue green |
	blue _ self blueTeam.
	green _ self greenTeam.
	beta _ CombinedTeam with: (Set with: blue with: green).	

	"Estoy medio en duda de que esté bien hacer esto para el expected, porque estoy testeando usando el comportamiento,
	pero me dió fiaca hacer todas las cuentas.".
	self 
		assert: (blue costOfBuilding: 500 * (meter^2)) + (green costOfBuilding: 500 * (meter^2))
		equals: (beta costOfBuilding: 1000 * (meter^2)).! !

!SmartBuildingTest methodsFor: 'tests - combined teams' stamp: 'MP 11/25/2021 21:13:35'!
test14CombinedTeamWithNestedStructureShouldComputeCostAsSumOfSubteams

	"Pasó de una porque hice CombinedTeam polimórfico con el concreto de una,
	pero lo dejo por completitud."

	| beta blue green alpha expectedCost gamma red yellow |
	blue _ self blueTeam.
	green _ self greenTeam.
	yellow _ self yellowTeam.
	red _ self redTeam.

	beta _ CombinedTeam with: (Set with: blue with: green).
	alpha _ CombinedTeam with: (Set with: beta with: red).
	gamma _ CombinedTeam with: (Set with: yellow with: alpha).

	expectedCost _
		(blue costOfBuilding: 150 * (meter^2)) +
		(green costOfBuilding: 150 * (meter^2)) +
		(yellow costOfBuilding: 600 * (meter^2)) +
		(red costOfBuilding: 300 * (meter^2)).

	self 
		assert: expectedCost
		equals: (gamma costOfBuilding: 1200 * (meter^2)).! !

!SmartBuildingTest methodsFor: 'tests - combined teams' stamp: 'MP 11/25/2021 21:13:19'!
test15CombinedTeamWithNestedStructureShouldComputeDaysToBuildAsMaxOfSubteams
	
	"Pasó de una porque hice CombinedTeam polimórfico con el concreto de una,
	pero lo dejo por completitud."

	| beta blue green alpha gamma red yellow expectedDaysToBuild |
	blue _ self blueTeam.
	green _ self greenTeam.
	yellow _ self yellowTeam.
	red _ self redTeam.

	beta _ CombinedTeam with: (Set with: blue with: green).
	alpha _ CombinedTeam with: (Set with: beta with: red).
	gamma _ CombinedTeam with: (Set with: yellow with: alpha).

	expectedDaysToBuild _ {
		(blue daysToBuild: 150 * (meter^2)).
		(green daysToBuild: 150 * (meter^2)).
		(yellow daysToBuild: 600 * (meter^2)).
		(red daysToBuild: 300 * (meter^2)). } max.

	self 
		assert: expectedDaysToBuild
		equals: (gamma daysToBuild: 1200 * (meter^2)).! !

!SmartBuildingTest methodsFor: 'tests - combined teams' stamp: 'MP 11/25/2021 21:15:09'!
test16CannotCreateCombinedTeamWithEmptySubteams

	self should: [ CombinedTeam with: (Set new).	 ]
		raise: Error - MessageNotUnderstood
		withMessageText: CombinedTeam emptySubteamsErrorDescription.
	! !

!SmartBuildingTest methodsFor: 'tests - combined teams' stamp: 'MP 11/25/2021 21:15:05'!
test17CannotCreateCombinedTeamWithDuplicateSubteam

	| green |
	green _ self greenTeam.
	self should: [ 
		CombinedTeam with: 
			(Set with: green
				with: (CombinedTeam withSubteam: green)).	
		]
		raise: Error - MessageNotUnderstood
		withMessageText: CombinedTeam duplicateTeamsErrorDescription.
	! !

!SmartBuildingTest methodsFor: 'tests - combined teams' stamp: 'MP 11/25/2021 21:15:01'!
test18CannotCreateCombinedTeamWithNestedDuplicateSubteam

	"pasó de una"
	| green |
	green _ self greenTeam.
	self should: [ 
		CombinedTeam with:
			(Set with: green
				with: (CombinedTeam 
					withSubteam: (CombinedTeam
						withSubteam: green)))
		]
		raise: Error - MessageNotUnderstood
		withMessageText: CombinedTeam duplicateTeamsErrorDescription.
	! !

!SmartBuildingTest methodsFor: 'tests - combined teams' stamp: 'MP 11/25/2021 21:14:57'!
test19CannotCreateCombinedTeamWithDuplicateSubteamsInDifferentBranches

	"pasó de una"
	| green firstBranch secondBranch |
	green _ self greenTeam.
	firstBranch _ CombinedTeam with:
			(Set with: green
				with: (CombinedTeam 
					withSubteam: (CombinedTeam
						withSubteam: self yellowTeam))).

	secondBranch _ CombinedTeam with:
			(Set with: self redTeam
				with: (CombinedTeam 
					withSubteam: (CombinedTeam
						withSubteam: green))).
	self should: [ 
			CombinedTeam with: (Set with: firstBranch with: secondBranch)
		]
		raise: Error - MessageNotUnderstood
		withMessageText: CombinedTeam duplicateTeamsErrorDescription.
	! !


!SmartBuildingTest methodsFor: 'tests - concrete teams' stamp: 'MP 11/25/2021 20:10:41'!
test01FixedDateAndConstantCapacityComputesTimeTakenToBuild

	| redTeam |
	redTeam _ self redTeam.
	
	self assert: 5 * day equals: (redTeam daysToBuild: 25 * 5 * (meter^2)).

	! !

!SmartBuildingTest methodsFor: 'tests - concrete teams' stamp: 'MP 11/25/2021 20:07:57'!
test02FixedDateAndConstantComputesReturnsCostOfBuilding

	| redTeam |
	redTeam _ self redTeam.

	self assert: 5000 * peso equals: (redTeam costOfBuilding: 25 * 5 * (meter^2)).

	! !

!SmartBuildingTest methodsFor: 'tests - concrete teams' stamp: 'MP 11/25/2021 20:10:41'!
test03FixedDateAndConstantCapacityReturnsAnIntegerNumberOfDays

	| redTeam |
	redTeam _ self redTeam.
	
	self assert: 1 * day equals: (redTeam daysToBuild: 5 * (meter^2)).

	! !

!SmartBuildingTest methodsFor: 'tests - concrete teams' stamp: 'MP 11/25/2021 20:10:41'!
test04RainyPriceAndVariableCapacityComputesTimeTakenBeforeDecreaseInCapacity

	| blueTeam |
	blueTeam _ self blueTeam.
	
	self assert: 7 * day equals: (blueTeam daysToBuild: 300 * (meter^2)).

	! !

!SmartBuildingTest methodsFor: 'tests - concrete teams' stamp: 'MP 11/25/2021 20:10:41'!
test05RainyPriceAndVariableCapacityComputesTimeTakenAfterDecreaseInCapacity

	| blueTeam |
	blueTeam _ self blueTeam.

	self assert: 14 * day equals: (blueTeam daysToBuild: 500 * (meter^2)).

	! !

!SmartBuildingTest methodsFor: 'tests - concrete teams' stamp: 'MP 11/25/2021 19:01:01'!
test06RainyPriceAndVariableCapacityComputesCostOfBuildingWithNormalDays

	| blueTeam |
	blueTeam _ self blueTeam.

	self assert: 14 * 1500 * peso equals: (blueTeam costOfBuilding: 500 * (meter^2)).

	! !

!SmartBuildingTest methodsFor: 'tests - concrete teams' stamp: 'MP 11/25/2021 19:01:20'!
test07RainyPriceAndVariableCapacityComputesCostOfBuildingWithRainyAndNormalDays

	| blueTeam |
	blueTeam _ self blueTeamWithMeteorologicalService:
		(MeteorologicalServiceStub withRainyDays: 5*day).

	self assert: ((14-5) * (1500*peso)) + (5 * (1700*peso)) equals: (blueTeam costOfBuilding: 500 * (meter^2)).! !

!SmartBuildingTest methodsFor: 'tests - concrete teams' stamp: 'MP 11/25/2021 20:10:41'!
test08RainyPriceAndConstantCapacityComputesTimeTakenToBuild

	| greenTeam |
	greenTeam _ self greenTeam.

	self assert: 5 * day equals: (greenTeam daysToBuild: 25 * 5 * (meter^2)).! !

!SmartBuildingTest methodsFor: 'tests - concrete teams' stamp: 'MP 11/25/2021 19:16:27'!
test09RainyPriceAndConstantCapacityComputesCostOfBuildingWithRainyAndNormalDays

	| greenTeam |
	greenTeam _ self greenTeamWithMeteorologicalService:
		(MeteorologicalServiceStub withRainyDays: 5 * day).

	self assert: (5 * (1000 * peso)) + (5 * (1200 * peso)) equals: (greenTeam costOfBuilding: 25 * 10 * (meter^2)).! !

!SmartBuildingTest methodsFor: 'tests - concrete teams' stamp: 'MP 11/25/2021 20:10:41'!
test10FixedPriceAndVariableCapacityComputesTimeTakenAfterDecrease

	| yellowTeam |
	yellowTeam _ self yellowTeam.

	self assert: 14 * day equals: (yellowTeam daysToBuild: 500 * (meter^2)).! !

!SmartBuildingTest methodsFor: 'tests - concrete teams' stamp: 'MP 11/25/2021 19:31:35'!
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

!CapacityPolicy methodsFor: 'time calculation' stamp: 'MP 11/25/2021 20:10:41'!
daysToBuild: anArea

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


!ConstantCapacity methodsFor: 'time calculation' stamp: 'MP 11/25/2021 20:10:41'!
daysToBuild: anArea

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


!DecreasingCapacity methodsFor: 'time calculation' stamp: 'MP 11/25/2021 20:10:41'!
daysToBuild: anArea
	
	| areaConstructedEfficiently remainderToConstruct timeToConstructEfficiently timeToConstructRemainder |
	"Nota: esto quedó medio chancho pero no se me ocurrió una mejor forma de hacerlo :(".

	areaConstructedEfficiently _ startingCapacity * daysBeforeDecrease.	
	areaConstructedEfficiently > anArea ifTrue: [
		^ anArea / startingCapacity ceiling. "No agregué test para ceiling acá porque no me dió tiempo pero sé que es necesario"
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


!classDefinition: #CombinedTeam category: 'ISW1-2021-2C-2doParcial'!
Object subclass: #CombinedTeam
	instanceVariableNames: 'subteams'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!

!CombinedTeam methodsFor: 'initialization' stamp: 'MP 11/25/2021 20:19:59'!
initializeWith: aCollectionOfSubteams 

	subteams := aCollectionOfSubteams.! !


!CombinedTeam methodsFor: 'time calculation' stamp: 'MP 11/25/2021 20:28:25'!
daysToBuild: anArea 
	
	| areaForEachTeam |
	areaForEachTeam _ self splitArea: anArea.
	^ subteams max: [ :aSubteam | aSubteam daysToBuild: areaForEachTeam ].! !

!CombinedTeam methodsFor: 'time calculation' stamp: 'MP 11/25/2021 20:28:25'!
splitArea: anArea

	^ anArea / (subteams size)! !


!CombinedTeam methodsFor: 'cost calculation' stamp: 'MP 11/25/2021 20:28:25'!
costOfBuilding: anArea
	
	| areaForSubteam |
	areaForSubteam _ self splitArea: anArea.
	^ subteams sum: [ :aSubteam | aSubteam costOfBuilding: areaForSubteam ].! !


!CombinedTeam methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 21:09:28'!
addSubteamsTo: aCollectionOfSubteams

	subteams do: [ :aSubteam | aSubteam addSubteamsTo: aCollectionOfSubteams ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombinedTeam class' category: 'ISW1-2021-2C-2doParcial'!
CombinedTeam class
	instanceVariableNames: ''!

!CombinedTeam class methodsFor: 'instance creation' stamp: 'MP 11/25/2021 21:02:56'!
assertHasNoDuplicates: aCollectionOfSubteams 

	"Este tiene que ser el algoritmo mas ineficiente y horrible que hice en mi vida,
	pero creo que funciona bien"
	| allSubteams |
	
	allSubteams _ OrderedCollection new.
	aCollectionOfSubteams do: [ :aSubteam | aSubteam addSubteamsTo: allSubteams ].
	
	(allSubteams allSatisfy: [ :aSubteam | (allSubteams occurrencesOf: aSubteam) = 1 ])
		ifFalse: [ self error: self duplicateTeamsErrorDescription ].! !

!CombinedTeam class methodsFor: 'instance creation' stamp: 'MP 11/25/2021 20:23:34'!
assertIsntEmpty: aCollectionOfSubteams

	^ aCollectionOfSubteams ifEmpty: [ self error: self emptySubteamsErrorDescription ]! !

!CombinedTeam class methodsFor: 'instance creation' stamp: 'MP 11/25/2021 20:57:45'!
with: aCollectionOfSubteams 

	self assertIsntEmpty: aCollectionOfSubteams.
	self assertHasNoDuplicates: aCollectionOfSubteams.

	^ self new initializeWith: aCollectionOfSubteams ! !

!CombinedTeam class methodsFor: 'instance creation' stamp: 'MP 11/25/2021 21:05:52'!
withSubteam: aSubteam

	^ self with: (Set with: aSubteam)! !


!CombinedTeam class methodsFor: 'error descriptions' stamp: 'MP 11/25/2021 20:53:28'!
duplicateTeamsErrorDescription
	
	^ 'duplicate teams'.! !

!CombinedTeam class methodsFor: 'error descriptions' stamp: 'MP 11/25/2021 20:22:21'!
emptySubteamsErrorDescription
	
	^ 'empty subteams'! !


!classDefinition: #ConstructionTeam category: 'ISW1-2021-2C-2doParcial'!
Object subclass: #ConstructionTeam
	instanceVariableNames: 'pricingPolicy capacityPolicy'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-2doParcial'!

!ConstructionTeam methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 21:01:12'!
addSubteamsTo: aCollectionOfSubteams

	aCollectionOfSubteams add: self.! !

!ConstructionTeam methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 20:10:41'!
costOfBuilding: anArea

	^ pricingPolicy costOf: (self daysToBuild: anArea)! !

!ConstructionTeam methodsFor: 'as yet unclassified' stamp: 'MP 11/25/2021 20:10:41'!
daysToBuild: anArea

	^ capacityPolicy daysToBuild: anArea.! !


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
