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

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:35:55'!
trackHeadingChangesOf: aMarsRover 
	
	^ MarsRoverHeadingXXXXXXXX for: aMarsRover! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:43:08'!
trackPositionAndHeadingChangesOf: aMarsRover 
	
	^ MarsRoverPositionHeadingXX for: aMarsRover.! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:28:24'!
trackPositionChangesOf: aMarsRover 
	
	^ MarsRoverPositionXXXXXXX for: aMarsRover.! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'IAR 10/27/2021 00:27:47'!
viewHeadingOf: aMarsRover 

	^ MarsRoverStatusView viewHeadingOf: aMarsRover.
! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'IAR 10/27/2021 00:38:59'!
viewPositionAndHeadingOf: aMarsRover 
	
	^ MarsRoverStatusView viewPositionAndHeadingOf: aMarsRover.! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'IAR 10/27/2021 00:23:54'!
viewPositionOf: aMarsRover 
	
	^ MarsRoverStatusView viewPositionOf: aMarsRover.! !


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
	instanceVariableNames: 'position head positionLogger headingLogger positionStatusViewer headingStatusViewer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'HAW 10/7/2021 20:10:49'!
initializeAt: aPosition heading: aHeadingType

	position := aPosition.
	head := aHeadingType for: self ! !


!MarsRover methodsFor: 'heading' stamp: 'AF 10/26/2021 18:20:54'!
headEast
	
	self headTo: (MarsRoverHeadingEast for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'AF 10/26/2021 18:20:05'!
headNorth
	
	self headTo: (MarsRoverHeadingNorth for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'AF 10/26/2021 18:19:41'!
headSouth
	
	self headTo: (MarsRoverHeadingSouth for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'IAR 10/26/2021 23:41:12'!
headTo: aMarsRoverHeading
	
	head := aMarsRoverHeading.
	headingLogger ifNotNil: [ headingLogger add: head ].
	headingStatusViewer ifNotNil: [ headingStatusViewer headingTextField: head ].! !

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

!MarsRover methodsFor: 'moving' stamp: 'AF 10/26/2021 18:14:47'!
moveEast
	
	self movePositionXXX: 1@0.! !

!MarsRover methodsFor: 'moving' stamp: 'AF 10/26/2021 17:50:47'!
moveForward
	
	head moveForward.
	! !

!MarsRover methodsFor: 'moving' stamp: 'AF 10/26/2021 18:14:34'!
moveNorth
	
	self movePositionXXX: 0@1.! !

!MarsRover methodsFor: 'moving' stamp: 'IAR 10/26/2021 23:33:52'!
movePositionXXX: anOffset
	
	position := position + anOffset.
	positionLogger ifNotNil: [ positionLogger add: position ].
	positionStatusViewer ifNotNil: [ positionStatusViewer positionTextField: position ].! !

!MarsRover methodsFor: 'moving' stamp: 'AF 10/26/2021 18:14:53'!
moveSouth

	self movePositionXXX: 0@-1.! !

!MarsRover methodsFor: 'moving' stamp: 'AF 10/26/2021 18:14:58'!
moveWest
	
	self movePositionXXX: -1@0.! !


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


!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/26/2021 17:40:09'!
trackHeadingChangesTo: aHeadingLog
	
	headingLogger _ aHeadingLog.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/26/2021 18:50:55'!
trackHeadingChangesToStatusView: aMarsRoverStatusView 
	
	headingStatusViewer _ aMarsRoverStatusView.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/26/2021 17:22:05'!
trackPositionChangesTo: anOrderedCollection 
	
	positionLogger _ anOrderedCollection.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/26/2021 18:49:58'!
trackPositionChangesToStatusView: aMarsRoverStatusView 

	positionStatusViewer _ aMarsRoverStatusView.! !

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


!classDefinition: #MarsRoverHeadingXXXXXXXX category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeadingXXXXXXXX
	instanceVariableNames: 'marsRover headingLog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingXXXXXXXX methodsFor: 'initialization' stamp: 'IAR 10/26/2021 23:37:44'!
initializeFor: aMarsRover 
	
	headingLog _ OrderedCollection new.
	aMarsRover trackHeadingChangesTo: self.! !


!MarsRoverHeadingXXXXXXXX methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:40:21'!
add: aHeading 
	
	headingLog add: aHeading printString.! !

!MarsRoverHeadingXXXXXXXX methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:38:41'!
log

	^ headingLog.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadingXXXXXXXX class' category: 'MarsRover-WithHeading'!
MarsRoverHeadingXXXXXXXX class
	instanceVariableNames: ''!

!MarsRoverHeadingXXXXXXXX class methodsFor: 'instance creation' stamp: 'IAR 10/26/2021 23:36:59'!
for: aMarsRover

	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverPositionHeadingXX category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverPositionHeadingXX
	instanceVariableNames: 'marsRover positionAndHeadingLog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverPositionHeadingXX methodsFor: 'initialization' stamp: 'IAR 10/26/2021 23:46:10'!
initializeFor: aMarsRover
	
	positionAndHeadingLog _ OrderedCollection new.
	aMarsRover trackPositionChangesTo: self.
	aMarsRover trackHeadingChangesTo: self.! !


!MarsRoverPositionHeadingXX methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:49:36'!
add: aPositionOrHeading
	
	positionAndHeadingLog add: aPositionOrHeading printString.! !

!MarsRoverPositionHeadingXX methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:48:54'!
log
	
	^ positionAndHeadingLog.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverPositionHeadingXX class' category: 'MarsRover-WithHeading'!
MarsRoverPositionHeadingXX class
	instanceVariableNames: ''!

!MarsRoverPositionHeadingXX class methodsFor: 'instance creation' stamp: 'IAR 10/26/2021 23:43:36'!
for: aMarsRover 

	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverPositionXXXXXXX category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverPositionXXXXXXX
	instanceVariableNames: 'positionLog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverPositionXXXXXXX methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:33:41'!
add: aPosition

	positionLog add: aPosition printString! !

!MarsRoverPositionXXXXXXX methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:27:23'!
initializeFor: aMarsRover
	
	positionLog _ OrderedCollection new.
	aMarsRover trackPositionChangesTo: self.! !

!MarsRoverPositionXXXXXXX methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:31:57'!
log
	^ positionLog.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverPositionXXXXXXX class' category: 'MarsRover-WithHeading'!
MarsRoverPositionXXXXXXX class
	instanceVariableNames: ''!

!MarsRoverPositionXXXXXXX class methodsFor: 'as yet unclassified' stamp: 'IAR 10/26/2021 23:26:22'!
for: aMarsRover
	
	^self new initializeFor: aMarsRover.! !


!classDefinition: #MarsRoverStatusView category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverStatusView
	instanceVariableNames: 'positionTextField headingTextField marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverStatusView methodsFor: 'as yet unclasssified' stamp: 'AF 10/26/2021 18:53:29'!
headingTextField
	
	^ headingTextField printString.! !

!MarsRoverStatusView methodsFor: 'as yet unclasssified' stamp: 'AF 10/26/2021 18:52:56'!
headingTextField: aMarsRoverHeading 
	
	headingTextField _ aMarsRoverHeading.! !

!MarsRoverStatusView methodsFor: 'as yet unclasssified' stamp: 'AF 10/26/2021 18:38:09'!
positionTextField
	
	^positionTextField printString.! !

!MarsRoverStatusView methodsFor: 'as yet unclasssified' stamp: 'AF 10/26/2021 18:37:20'!
positionTextField: aPosition 
	
	positionTextField _ aPosition.! !

!MarsRoverStatusView methodsFor: 'as yet unclasssified' stamp: 'IAR 10/27/2021 00:36:18'!
trackHeadingOf: aMarsRover 

	aMarsRover trackHeadingChangesToStatusView: self.! !

!MarsRoverStatusView methodsFor: 'as yet unclasssified' stamp: 'IAR 10/27/2021 00:35:50'!
trackPositionOf: aMarsRover 
	
	aMarsRover trackPositionChangesToStatusView: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverStatusView class' category: 'MarsRover-WithHeading'!
MarsRoverStatusView class
	instanceVariableNames: ''!

!MarsRoverStatusView class methodsFor: 'instance creation' stamp: 'IAR 10/27/2021 00:35:10'!
viewHeadingOf: aMarsRover 

	^self new trackHeadingOf: aMarsRover ! !

!MarsRoverStatusView class methodsFor: 'instance creation' stamp: 'IAR 10/27/2021 00:37:53'!
viewPositionAndHeadingOf: aMarsRover 
	
	^ self new
		trackPositionOf: aMarsRover;
		trackHeadingOf: aMarsRover;
		yourself! !

!MarsRoverStatusView class methodsFor: 'instance creation' stamp: 'IAR 10/27/2021 00:34:37'!
viewPositionOf: aMarsRover 
	
	^ self new trackPositionOf: aMarsRover. ! !
