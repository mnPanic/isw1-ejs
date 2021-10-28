!classDefinition: #MarsRoverObserverTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverObserverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:31:31'!
test01

	| rover expectedLog positionXX |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	positionXX _ self trackPositionChangesOf: rover.
	
	expectedLog _ OrderedCollection new.
	
	self assert: expectedLog equals: positionXX log. ! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:32:12'!
test02

	| rover expectedLog positionXX |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	positionXX _ self trackPositionChangesOf: rover.
	rover process: 'f'.
	
	expectedLog _ OrderedCollection with: '1@2'.
	
	self assert: expectedLog equals: positionXX log. ! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:34:25'!
test03

	| rover expectedLog positionXX |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	positionXX _ self trackPositionChangesOf: rover.
	rover process: 'b'.
	
	expectedLog _ OrderedCollection with: '1@0'.
	
	self assert: expectedLog equals: positionXX log. ! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:34:36'!
test04

	| rover expectedLog positionXX |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	rover process: 'fb'.
	positionXX _ self trackPositionChangesOf: rover.
	rover process: 'f'.
	
	expectedLog _ OrderedCollection with: '1@2'.
	
	self assert: expectedLog equals: positionXX log. ! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:38:16'!
test05

	| rover expectedLog headingXX |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	headingXX _ self trackHeadingChangesOf: rover.
	
	expectedLog _ OrderedCollection new.
	
	self assert: expectedLog equals: headingXX log. ! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:39:07'!
test06

	| rover expectedLog headingXX |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	headingXX _ self trackPositionChangesOf: rover.
	
	rover process: 'lflflflf'.
	expectedLog _ OrderedCollection with: '0@1' with: '0@0' with: '1@0' with: '1@1'.
	
	
	self assert: expectedLog equals: headingXX log. ! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:39:24'!
test07

	| rover expectedLog headingXX |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	headingXX _ self trackHeadingChangesOf: rover.
	
	rover process: 'lflflflf'.
	expectedLog _ OrderedCollection with: 'West' with: 'South' with: 'East' with: 'North'.
	
	
	self assert: expectedLog equals: headingXX log. ! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:48:05'!
test08

	| rover expectedLog positionAndHeadingXX |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	positionAndHeadingXX _ self trackPositionAndHeadingChangesOf: rover.
	
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
		
	
	self assert: expectedLog equals: positionAndHeadingXX log. ! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'AF 10/26/2021 18:39:17'!
test09

	| rover roverStatusView |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	roverStatusView _ self viewPositionOf: rover.
	rover process: 'f'.
	
	self assert: '1@2' equals: roverStatusView positionTextField. ! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'AF 10/26/2021 18:41:43'!
test10

	| rover roverStatusView |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	roverStatusView _ self viewHeadingOf: rover.
	rover process: 'r'.
	
	self assert: 'East' equals: roverStatusView headingTextField. ! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'AF 10/26/2021 18:54:50'!
test11

	| rover roverStatusView |
	rover _ MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	roverStatusView _ self viewPositionAndHeadingOf: rover.
	rover process: 'fr'.
	
	self assert: 'East' equals: roverStatusView headingTextField. 
	self assert: '1@2' equals: roverStatusView positionTextField. ! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'MP 10/27/2021 23:24:02'!
trackHeadingChangesOf: aMarsRover 
	
	^ MarsRoverChangeLogger logHeadingChangesOf: aMarsRover.! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'MP 10/27/2021 23:24:11'!
trackPositionAndHeadingChangesOf: aMarsRover 
	
	^ MarsRoverChangeLogger logPositionAndHeadingChangesOf: aMarsRover.! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'MP 10/27/2021 23:23:51'!
trackPositionChangesOf: aMarsRover 
	
	^ MarsRoverChangeLogger logPositionChangesOf: aMarsRover.! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'MP 10/27/2021 23:31:57'!
viewHeadingOf: aMarsRover 

	^ MarsRoverStatusViewX viewHeadingOf: aMarsRover.
! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'MP 10/27/2021 23:31:57'!
viewPositionAndHeadingOf: aMarsRover 
	
	^ MarsRoverStatusViewX viewPositionAndHeadingOf: aMarsRover.! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'MP 10/27/2021 23:31:57'!
viewPositionOf: aMarsRover 
	
	^ MarsRoverStatusViewX viewPositionOf: aMarsRover.! !


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
	instanceVariableNames: 'position head positionLogger headingLogger positionStatusViewer headingStatusViewer headingObservers positionObservers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'MP 10/27/2021 23:41:48'!
initializeAt: aPosition heading: aHeadingType

	position _ aPosition.
	head _ aHeadingType for: self.
	
	headingObservers _ OrderedCollection new.
	positionObservers _ OrderedCollection new.! !


!MarsRover methodsFor: 'heading' stamp: 'AF 10/26/2021 18:20:54'!
headEast
	
	self headTo: (MarsRoverHeadingEast for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'AF 10/26/2021 18:20:05'!
headNorth
	
	self headTo: (MarsRoverHeadingNorth for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'AF 10/26/2021 18:19:41'!
headSouth
	
	self headTo: (MarsRoverHeadingSouth for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'MP 10/27/2021 23:34:52'!
headTo: aMarsRoverHeading
	
	head := aMarsRoverHeading.

	headingObservers do: [ :anObserver | anObserver notifyChangeInHeading: head ].! !

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

!MarsRover methodsFor: 'moving' stamp: 'MP 10/27/2021 23:43:43'!
offsetPositionBy: anOffset
	
	position := position + anOffset.
	positionObservers do: [ :anObserver | anObserver notifyChangeInPosition: position ].! !


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


!MarsRover methodsFor: 'as yet unclassified' stamp: 'MP 10/27/2021 23:39:48'!
registerHeadingObserver: anObserver

	headingObservers add: anObserver.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MP 10/27/2021 23:41:33'!
registerPositionObserver: anObserver 
	
	positionObservers add: anObserver.! !

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


!MarsRoverHeadingEast methodsFor: 'as yet unclassified' stamp: 'AF 10/26/2021 17:45:41'!
printString

	^'East'.! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headSouth! !


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


!MarsRoverHeadingNorth methodsFor: 'as yet unclassified' stamp: 'AF 10/26/2021 17:57:38'!
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


!MarsRoverHeadingSouth methodsFor: 'as yet unclassified' stamp: 'AF 10/26/2021 17:57:54'!
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


!MarsRoverHeadingWest methodsFor: 'as yet unclassified' stamp: 'AF 10/26/2021 17:58:05'!
printString

	^'West'.! !


!classDefinition: #MarsRoverObserver category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverObserver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverObserver methodsFor: 'as yet unclassified' stamp: 'MP 10/27/2021 23:32:27'!
notifyChangeInHeading: aMarsRoverHeading

	self subclassResponsibility.! !

!MarsRoverObserver methodsFor: 'as yet unclassified' stamp: 'MP 10/27/2021 23:33:16'!
notifyChangeInPosition: aPosition

	self subclassResponsibility.! !


!classDefinition: #MarsRoverChangeLogger category: 'MarsRover-WithHeading'!
MarsRoverObserver subclass: #MarsRoverChangeLogger
	instanceVariableNames: 'marsRover log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverChangeLogger methodsFor: 'initialization' stamp: 'MP 10/27/2021 23:20:18'!
initialize
	
	log _ OrderedCollection new.! !

!MarsRoverChangeLogger methodsFor: 'initialization' stamp: 'MP 10/27/2021 23:37:04'!
observeHeadingChangesOf: aMarsRover

	aMarsRover registerHeadingObserver: self! !

!MarsRoverChangeLogger methodsFor: 'initialization' stamp: 'MP 10/27/2021 23:41:03'!
observePositionChangesOf: aMarsRover

	aMarsRover registerPositionObserver: self! !


!MarsRoverChangeLogger methodsFor: 'as yet unclassified' stamp: 'MP 10/27/2021 23:08:42'!
log
	
	^ log.! !

!MarsRoverChangeLogger methodsFor: 'as yet unclassified' stamp: 'MP 10/27/2021 23:14:00'!
notifyChangeInHeading: aMarsRoverHeading
	
	log add: aMarsRoverHeading printString.! !

!MarsRoverChangeLogger methodsFor: 'as yet unclassified' stamp: 'MP 10/27/2021 23:15:13'!
notifyChangeInPosition: aPosition
	
	log add: aPosition printString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverChangeLogger class' category: 'MarsRover-WithHeading'!
MarsRoverChangeLogger class
	instanceVariableNames: ''!

!MarsRoverChangeLogger class methodsFor: 'instance creation' stamp: 'IAR 10/26/2021 23:43:36'!
for: aMarsRover 

	^self new initializeFor: aMarsRover ! !

!MarsRoverChangeLogger class methodsFor: 'instance creation' stamp: 'MP 10/27/2021 23:25:12'!
logHeadingChangesOf: aMarsRover 

	^self new initialize observeHeadingChangesOf: aMarsRover! !

!MarsRoverChangeLogger class methodsFor: 'instance creation' stamp: 'MP 10/27/2021 23:22:16'!
logPositionAndHeadingChangesOf: aMarsRover 

	^(self new initialize)
		observePositionChangesOf: aMarsRover;
		observeHeadingChangesOf: aMarsRover.! !

!MarsRoverChangeLogger class methodsFor: 'instance creation' stamp: 'MP 10/27/2021 23:22:38'!
logPositionChangesOf: aMarsRover 

	^self new initialize observePositionChangesOf: aMarsRover! !


!classDefinition: #MarsRoverStatusViewX category: 'MarsRover-WithHeading'!
MarsRoverObserver subclass: #MarsRoverStatusViewX
	instanceVariableNames: 'positionTextField headingTextField marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverStatusViewX methodsFor: 'as yet unclasssified' stamp: 'AF 10/26/2021 18:53:29'!
headingTextField
	
	^ headingTextField printString.! !

!MarsRoverStatusViewX methodsFor: 'as yet unclasssified' stamp: 'MP 10/27/2021 23:30:50'!
notifyChangeInHeading: aMarsRoverHeading 
	
	headingTextField _ aMarsRoverHeading.! !

!MarsRoverStatusViewX methodsFor: 'as yet unclasssified' stamp: 'MP 10/27/2021 23:31:05'!
notifyChangeInPosition: aPosition 
	
	positionTextField _ aPosition.! !

!MarsRoverStatusViewX methodsFor: 'as yet unclasssified' stamp: 'AF 10/26/2021 18:38:09'!
positionTextField
	
	^positionTextField printString.! !

!MarsRoverStatusViewX methodsFor: 'as yet unclasssified' stamp: 'MP 10/27/2021 23:40:41'!
trackHeadingOf: aMarsRover 

	aMarsRover registerHeadingObserver: self.! !

!MarsRoverStatusViewX methodsFor: 'as yet unclasssified' stamp: 'MP 10/27/2021 23:40:53'!
trackPositionOf: aMarsRover 
	
	aMarsRover registerPositionObserver: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverStatusViewX class' category: 'MarsRover-WithHeading'!
MarsRoverStatusViewX class
	instanceVariableNames: ''!

!MarsRoverStatusViewX class methodsFor: 'instance creation' stamp: 'IAR 10/27/2021 00:35:10'!
viewHeadingOf: aMarsRover 

	^self new trackHeadingOf: aMarsRover ! !

!MarsRoverStatusViewX class methodsFor: 'instance creation' stamp: 'IAR 10/27/2021 00:37:53'!
viewPositionAndHeadingOf: aMarsRover 
	
	^ self new
		trackPositionOf: aMarsRover;
		trackHeadingOf: aMarsRover;
		yourself! !

!MarsRoverStatusViewX class methodsFor: 'instance creation' stamp: 'IAR 10/27/2021 00:34:37'!
viewPositionOf: aMarsRover 
	
	^ self new trackPositionOf: aMarsRover. ! !
