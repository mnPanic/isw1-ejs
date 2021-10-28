!classDefinition: #MarsRoverObserverTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverObserverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverObserverTest methodsFor: 'tests' stamp: 'MP 10/28/2021 01:04:32'!
test01PositionLogOfStillRoverIsEmpty

	| rover expectedLog positionLogger |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	positionLogger _ MarsRoverChangeLogger of: rover tracking: { PositionTracker new }.
	
	expectedLog _ OrderedCollection new.
	
	self assert: expectedLog equals: positionLogger log. ! !

!MarsRoverObserverTest methodsFor: 'tests' stamp: 'MP 10/28/2021 01:07:10'!
test02PositionLogTracksForwardMovement

	| rover expectedLog positionLogger |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	positionLogger _ MarsRoverChangeLogger of: rover tracking: { PositionTracker new }.
	rover process: 'f'.
	
	expectedLog _ OrderedCollection with: '1@2'.
	
	self assert: expectedLog equals: positionLogger log. ! !

!MarsRoverObserverTest methodsFor: 'tests' stamp: 'MP 10/28/2021 01:16:00'!
test03PositionLogTracksBackwardMovement

	| rover expectedLog positionLogger |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	positionLogger _ MarsRoverChangeLogger of: rover tracking: { PositionTracker new }.
	rover process: 'b'.
	
	expectedLog _ OrderedCollection with: '1@0'.
	
	self assert: expectedLog equals: positionLogger log. ! !

!MarsRoverObserverTest methodsFor: 'tests' stamp: 'MP 10/28/2021 01:16:04'!
test04PositionLogDoesntTrackMovementsBeforeStart

	| rover expectedLog positionLogger |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	rover process: 'fb'.
	positionLogger _ MarsRoverChangeLogger of: rover tracking: { PositionTracker new }.
	rover process: 'f'.
	
	expectedLog _ OrderedCollection with: '1@2'.
	
	self assert: expectedLog equals: positionLogger log. ! !

!MarsRoverObserverTest methodsFor: 'tests' stamp: 'MP 10/28/2021 01:16:10'!
test05HeadingLogOfStillRoverIsEmpty

	| rover expectedLog headingLogger |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	headingLogger _ MarsRoverChangeLogger of: rover tracking: { HeadingTracker new }.
	
	expectedLog _ OrderedCollection new.
	
	self assert: expectedLog equals: headingLogger log. ! !

!MarsRoverObserverTest methodsFor: 'tests' stamp: 'MP 10/28/2021 01:16:16'!
test06PositionLogTracksMovementsInAllDirections

	| rover expectedLog positionLogger |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	positionLogger _ MarsRoverChangeLogger of: rover tracking: { PositionTracker new }.
	
	rover process: 'lflflflf'.
	expectedLog _ OrderedCollection with: '0@1' with: '0@0' with: '1@0' with: '1@1'.
	
	
	self assert: expectedLog equals: positionLogger log. ! !

!MarsRoverObserverTest methodsFor: 'tests' stamp: 'MP 10/28/2021 01:16:20'!
test07HeadingLogTracksMovementsInAllDirections

	| rover expectedLog headingLogger |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	headingLogger _ MarsRoverChangeLogger of: rover tracking: { HeadingTracker new }.
	
	rover process: 'lflflflf'.
	expectedLog _ OrderedCollection with: 'West' with: 'South' with: 'East' with: 'North'.
	
	
	self assert: expectedLog equals: headingLogger log. ! !

!MarsRoverObserverTest methodsFor: 'tests' stamp: 'MP 10/28/2021 01:16:25'!
test08PositionAndHeadingLogTracksMovementsAndRotations

	| rover expectedLog positionAndHeadingLogger |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	positionAndHeadingLogger _ MarsRoverChangeLogger of: rover
		tracking: { PositionTracker new. HeadingTracker new. }.
	
	rover process: 'lflflflf'.
	expectedLog _ (OrderedCollection new)
		add: 'West';
		add: '0@1';
		add: 'South';
		add: '0@0';
		add: 'East';
		add: '1@0';
		add: 'North';
		add: '1@1';
		yourself.
		
	
	self assert: expectedLog equals: positionAndHeadingLogger log. ! !

!MarsRoverObserverTest methodsFor: 'tests' stamp: 'MP 10/28/2021 01:17:36'!
test09PositionStatusViewerShowsCurrentPositionAfterMovement

	| rover roverStatusView |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	roverStatusView _  MarsRoverStatusViewer of: rover tracking: { PositionTracker new. }.
	rover process: 'f'.
	
	self assert: '1@2' equals: roverStatusView positionTextField.! !

!MarsRoverObserverTest methodsFor: 'tests' stamp: 'MP 10/28/2021 01:13:56'!
test10HeadingStatusViewerShowsCurrentHeadingAfterRotation

	| rover roverStatusView |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	roverStatusView _ MarsRoverStatusViewer of: rover tracking: { HeadingTracker new. }.
	rover process: 'r'.
	
	self assert: 'East' equals: roverStatusView headingTextField. ! !

!MarsRoverObserverTest methodsFor: 'tests' stamp: 'MP 10/28/2021 01:15:40'!
test11PositionAndHeadingStatusViewerShowsCurrentPositionAndHeading

	| rover roverStatusView |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	roverStatusView _ MarsRoverStatusViewer of: rover
		tracking: { PositionTracker new. HeadingTracker new. }.
	
	rover process: 'fr'.
	
	self assert: 'East' equals: roverStatusView headingTextField. 
	self assert: '1@2' equals: roverStatusView positionTextField. ! !

!MarsRoverObserverTest methodsFor: 'tests' stamp: 'MP 10/28/2021 01:20:28'!
test12PositionStatusViewerDoesntShowHeading

	| rover roverStatusView |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	roverStatusView _ MarsRoverStatusViewer of: rover
		tracking: { PositionTracker new. }.
	
	self should: [ roverStatusView headingTextField ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException | 
			self assert: MarsRoverStatusViewer notTrackingHeadingErrorDescription equals: anException messageText
		].! !

!MarsRoverObserverTest methodsFor: 'tests' stamp: 'MP 10/28/2021 01:26:30'!
test13HeadingStatusViewerDoesntShowPosition

	| rover roverStatusView |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	roverStatusView _ MarsRoverStatusViewer of: rover
		tracking: { HeadingTracker new. }.
	
	self should: [ roverStatusView positionTextField ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException | 
			self assert: MarsRoverStatusViewer notTrackingPositionErrorDescription equals: anException messageText
		].! !


!classDefinition: #MarsRoverTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:21:23'!
test01DoesNotMoveWhenNoCommand

	self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: '' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:12'!
test02IsAtFailsForDifferentPosition

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@2 heading: self north)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:31'!
test03IsAtFailsForDifferentHeading

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@1 heading: self south)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:17'!
test04IncrementsYAfterMovingForwardWhenHeadingNorth

	self 
		assertIsAt: 1@3 
		heading: self north 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:11'!
test06DecrementsYAfterMovingBackwardsWhenHeadingNorth

	self 
		assertIsAt: 1@1 
		heading: self north 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:59'!
test07PointToEashAfterRotatingRightWhenHeadingNorth

	self 
		assertIsAt: 1@2 
		heading: self east 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:51'!
test08PointsToWestAfterRotatingLeftWhenPointingNorth

	self 
		assertIsAt: 1@2 
		heading: self west 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:45'!
test09DoesNotProcessInvalidCommand

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: self north.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: self north) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:39'!
test10CanProcessMoreThanOneCommand

	self 
		assertIsAt: 1@4 
		heading: self north 
		afterProcessing: 'ff' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:31'!
test11IncrementsXAfterMovingForwareWhenHeadingEast

	self 
		assertIsAt: 2@2 
		heading: self east 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:19'!
test12DecrementsXAfterMovingBackwardWhenHeadingEast

	self 
		assertIsAt: 0@2 
		heading: self east 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:14'!
test13PointsToSouthAfterRotatingRightWhenHeadingEast

		self 
		assertIsAt: 1@2 
		heading: self south 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:05'!
test14PointsToNorthAfterRotatingLeftWhenPointingEast

		self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:00'!
test15ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingSouth

	self 
		assertIsAt: 1@1 
		heading: self west 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self south 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:52'!
test16ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingWest

	self 
		assertIsAt: 0@2 
		heading: self north 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self west 
! !


!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:31'!
east

	^ MarsRoverHeadingEast ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:38'!
north

	^ MarsRoverHeadingNorth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:45'!
south

	^ MarsRoverHeadingSouth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:54'!
west

	^ MarsRoverHeadingWest ! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'HAW 10/7/2021 20:20:47'!
assertIsAt: newPosition heading: newHeadingType afterProcessing: commands whenStartingAt: startPosition heading: startHeadingType

	| marsRover |
	
	marsRover := MarsRover at: startPosition heading: startHeadingType. 
	
	marsRover process: commands.
	
	self assert: (marsRover isAt: newPosition heading: newHeadingType)! !


!classDefinition: #MarsRover category: 'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'MP 10/28/2021 00:54:13'!
initializeAt: aPosition heading: aHeadingType

	position _ aPosition.
	head _ aHeadingType for: self.
	
	observers _ OrderedCollection new.! !


!MarsRover methodsFor: 'heading' stamp: 'AF 10/26/2021 18:20:54'!
headEast
	
	self headTo: (MarsRoverHeadingEast for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'AF 10/26/2021 18:20:05'!
headNorth
	
	self headTo: (MarsRoverHeadingNorth for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'AF 10/26/2021 18:19:41'!
headSouth
	
	self headTo: (MarsRoverHeadingSouth for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'MP 10/28/2021 00:52:31'!
headTo: aMarsRoverHeading
	
	head := aMarsRoverHeading.

	self notifyObserversOfChangeInHeading! !

!MarsRover methodsFor: 'heading' stamp: 'AF 10/26/2021 18:19:05'!
headWest
	
	self headTo: (MarsRoverHeadingWest for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	head rotateLeft! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	head rotateRight! !


!MarsRover methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:16:32'!
isAt: aPosition heading: aHeadingType

	^position = aPosition and: [ head isHeading: aHeadingType ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'moving' stamp: 'AF 10/26/2021 17:52:20'!
moveBackward
	
	head moveBackward.! !

!MarsRover methodsFor: 'moving' stamp: 'MP 10/27/2021 23:43:43'!
moveEast
	
	self offsetPositionBy: 1@0.! !

!MarsRover methodsFor: 'moving' stamp: 'AF 10/26/2021 17:50:47'!
moveForward
	
	head moveForward.
	! !

!MarsRover methodsFor: 'moving' stamp: 'MP 10/27/2021 23:43:43'!
moveNorth
	
	self offsetPositionBy: 0@1.! !

!MarsRover methodsFor: 'moving' stamp: 'MP 10/27/2021 23:43:43'!
moveSouth

	self offsetPositionBy: 0@-1.! !

!MarsRover methodsFor: 'moving' stamp: 'MP 10/27/2021 23:43:43'!
moveWest
	
	self offsetPositionBy: -1@0.! !

!MarsRover methodsFor: 'moving' stamp: 'MP 10/28/2021 00:51:30'!
offsetPositionBy: anOffset
	
	position := position + anOffset.

	self notifyObserversOfChangeInPosition.! !


!MarsRover methodsFor: 'command processing' stamp: 'HAW 6/30/2018 19:48:26'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 8/22/2019 12:08:50'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !


!MarsRover methodsFor: 'observing - private' stamp: 'MP 10/28/2021 00:51:43'!
notifyObserversOfChangeInHeading

	^ observers do: [ :anObserver | anObserver notifyChangeInHeading: head ]! !

!MarsRover methodsFor: 'observing - private' stamp: 'MP 10/28/2021 00:51:28'!
notifyObserversOfChangeInPosition

	^ observers do: [ :anObserver | anObserver notifyChangeInPosition: position ]! !


!MarsRover methodsFor: 'observing' stamp: 'MP 10/28/2021 00:50:40'!
registerObserver: anObserver 
	
	observers add: anObserver.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:10:30'!
at: aPosition heading: aHeadingType
	
	^self new initializeAt: aPosition heading: aHeadingType! !


!classDefinition: #MarsRoverHeading category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:15:38'!
isHeading: aHeadingType

	^self isKindOf: aHeadingType ! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'initialization' stamp: 'HAW 10/7/2021 20:11:59'!
initializeFor: aMarsRover 
	
	marsRover := aMarsRover.! !


!MarsRoverHeading methodsFor: 'printing' stamp: 'MP 10/28/2021 00:57:18'!
printString

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: 'MarsRover-WithHeading'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:11:35'!
for: aMarsRover 
	
	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverHeadingEast category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headSouth! !


!MarsRoverHeadingEast methodsFor: 'printing' stamp: 'AF 10/26/2021 17:45:41'!
printString

	^'East'.! !


!classDefinition: #MarsRoverHeadingNorth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headEast! !


!MarsRoverHeadingNorth methodsFor: 'printing' stamp: 'AF 10/26/2021 17:57:38'!
printString

	^'North'.! !


!classDefinition: #MarsRoverHeadingSouth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headWest! !


!MarsRoverHeadingSouth methodsFor: 'printing' stamp: 'AF 10/26/2021 17:57:54'!
printString

	^'South'.! !


!classDefinition: #MarsRoverHeadingWest category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	^marsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headNorth! !


!MarsRoverHeadingWest methodsFor: 'printing' stamp: 'AF 10/26/2021 17:58:05'!
printString

	^'West'.! !


!classDefinition: #MarsRoverObserver category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverObserver
	instanceVariableNames: 'headingTracker positionTracker'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverObserver methodsFor: 'initialization' stamp: 'MP 10/28/2021 01:28:57'!
initializeFor: aMarsRover tracking: aListOfTrackers

	"
	Creemos que puede ser un poco over engineered el hecho de recibir una lista de trackers
	como colaborador, pero lo que nos permite es tener una única lista de observadores del
	lado del Rover, y no tener que tener una explosión de todas las posibles combinaciones
	de colaboradores del lado de los observadores.
	"

	aMarsRover registerObserver: self.
	
	positionTracker _ NoTracker new.
	headingTracker _ NoTracker new.
	
	aListOfTrackers do: [ :aTracker | aTracker useIn: self ].! !


!MarsRoverObserver methodsFor: 'initialization - private' stamp: 'MP 10/28/2021 00:50:23'!
useHeadingTracker: aMarsRoverTracker

	headingTracker _ aMarsRoverTracker.! !

!MarsRoverObserver methodsFor: 'initialization - private' stamp: 'MP 10/28/2021 00:50:20'!
usePositionTracker: aMarsRoverTracker

	positionTracker _ aMarsRoverTracker.! !


!MarsRoverObserver methodsFor: 'observing' stamp: 'MP 10/28/2021 00:50:23'!
notifyChangeInHeading: aMarsRoverHeading
	
	headingTracker notifyChange: aMarsRoverHeading in: self.! !

!MarsRoverObserver methodsFor: 'observing' stamp: 'MP 10/28/2021 00:50:20'!
notifyChangeInPosition: aPosition
	
	positionTracker notifyChange: aPosition in: self.! !


!MarsRoverObserver methodsFor: 'observing - private' stamp: 'MP 10/28/2021 00:38:20'!
applyChangeInHeading: aMarsRoverHeading

	self subclassResponsibility.! !

!MarsRoverObserver methodsFor: 'observing - private' stamp: 'MP 10/28/2021 00:38:25'!
applyChangeInPosition: aPosition

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverObserver class' category: 'MarsRover-WithHeading'!
MarsRoverObserver class
	instanceVariableNames: ''!

!MarsRoverObserver class methodsFor: 'instance creation' stamp: 'MP 10/28/2021 00:41:06'!
of: aMarsRover tracking: aListOfTrackers

	^self new initializeFor: aMarsRover tracking: aListOfTrackers.! !


!classDefinition: #MarsRoverChangeLogger category: 'MarsRover-WithHeading'!
MarsRoverObserver subclass: #MarsRoverChangeLogger
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverChangeLogger methodsFor: 'initialization' stamp: 'MP 10/28/2021 00:40:23'!
initializeFor: aMarsRover tracking: aListOfTrackers
	
	super initializeFor: aMarsRover tracking: aListOfTrackers.
	log _ OrderedCollection new.! !


!MarsRoverChangeLogger methodsFor: 'accessing' stamp: 'MP 10/27/2021 23:08:42'!
log
	
	^ log.! !


!MarsRoverChangeLogger methodsFor: 'observing - private' stamp: 'MP 10/28/2021 00:15:04'!
applyChangeInHeading: aMarsRoverHeading
	
	log add: aMarsRoverHeading printString.! !

!MarsRoverChangeLogger methodsFor: 'observing - private' stamp: 'MP 10/28/2021 00:30:23'!
applyChangeInPosition: aPosition

	log add: aPosition printString! !


!classDefinition: #MarsRoverStatusViewer category: 'MarsRover-WithHeading'!
MarsRoverObserver subclass: #MarsRoverStatusViewer
	instanceVariableNames: 'positionTextField headingTextField'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverStatusViewer methodsFor: 'accessing' stamp: 'MP 10/28/2021 01:22:21'!
headingTextField
	
	self assertTrackingHeading.
	
	^ headingTextField printString.! !

!MarsRoverStatusViewer methodsFor: 'accessing' stamp: 'MP 10/28/2021 01:27:01'!
positionTextField

	self assertTrackingPosition.
	
	^ positionTextField printString.! !


!MarsRoverStatusViewer methodsFor: 'observing - private' stamp: 'MP 10/28/2021 00:41:58'!
applyChangeInHeading: aMarsRoverHeading 
	
	headingTextField _ aMarsRoverHeading.! !

!MarsRoverStatusViewer methodsFor: 'observing - private' stamp: 'MP 10/28/2021 00:42:09'!
applyChangeInPosition: aPosition 
	
	positionTextField _ aPosition.! !


!MarsRoverStatusViewer methodsFor: 'assertions' stamp: 'MP 10/28/2021 01:22:21'!
assertTrackingHeading

	^ headingTextField ifNil: [ self error: self class notTrackingHeadingErrorDescription ]! !

!MarsRoverStatusViewer methodsFor: 'assertions' stamp: 'MP 10/28/2021 01:27:01'!
assertTrackingPosition

	^ positionTextField ifNil: [ self error: self class notTrackingPositionErrorDescription ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverStatusViewer class' category: 'MarsRover-WithHeading'!
MarsRoverStatusViewer class
	instanceVariableNames: ''!

!MarsRoverStatusViewer class methodsFor: 'error descriptions' stamp: 'MP 10/28/2021 01:23:45'!
notTrackingHeadingErrorDescription

	^'not tracking heading!!'.! !

!MarsRoverStatusViewer class methodsFor: 'error descriptions' stamp: 'MP 10/28/2021 01:23:40'!
notTrackingPositionErrorDescription

	^'not tracking position!!'.! !


!classDefinition: #MarsRoverTracker category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverTracker
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTracker methodsFor: 'observing - private' stamp: 'MP 10/28/2021 01:28:02'!
notifyChange: aMarsRoverHeading in: anObserver

	self subclassResponsibility ! !


!MarsRoverTracker methodsFor: 'initialization - private' stamp: 'MP 10/28/2021 01:28:57'!
useIn: aMarsRoverObserver

	self subclassResponsibility.! !


!classDefinition: #HeadingTracker category: 'MarsRover-WithHeading'!
MarsRoverTracker subclass: #HeadingTracker
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!HeadingTracker methodsFor: 'initialization - private' stamp: 'MP 10/28/2021 01:28:57'!
useIn: aMarsRoverObserver

	aMarsRoverObserver useHeadingTracker: self.! !


!HeadingTracker methodsFor: 'observing - private' stamp: 'MP 10/28/2021 00:21:41'!
notifyChange: aMarsRoverHeading in: anObserver

	anObserver applyChangeInHeading: aMarsRoverHeading.! !


!classDefinition: #NoTracker category: 'MarsRover-WithHeading'!
MarsRoverTracker subclass: #NoTracker
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!NoTracker methodsFor: 'observing - private' stamp: 'MP 10/28/2021 00:33:11'!
notifyChange: aCollaborator in: anObserver! !


!classDefinition: #PositionTracker category: 'MarsRover-WithHeading'!
MarsRoverTracker subclass: #PositionTracker
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!PositionTracker methodsFor: 'initialization - private' stamp: 'MP 10/28/2021 01:28:57'!
useIn: aMarsRoverObserver

	aMarsRoverObserver usePositionTracker: self.! !


!PositionTracker methodsFor: 'observing - private' stamp: 'MP 10/28/2021 00:22:04'!
notifyChange: aPosition in: anObserver

	anObserver applyChangeInPosition: aPosition.! !
