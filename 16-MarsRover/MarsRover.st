!classDefinition: #TestMarsRover category: 'MarsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestMarsRover methodsFor: 'cardinal direction creation' stamp: 'IAR 10/5/2021 00:56:30'!
east

	^ East new! !

!TestMarsRover methodsFor: 'cardinal direction creation' stamp: 'IAR 10/5/2021 00:56:25'!
north

	^ North new! !

!TestMarsRover methodsFor: 'cardinal direction creation' stamp: 'IAR 10/5/2021 00:56:45'!
south

	^ South new! !

!TestMarsRover methodsFor: 'cardinal direction creation' stamp: 'IAR 10/5/2021 00:56:37'!
west

	^ West new! !


!TestMarsRover methodsFor: 'test process error conditions' stamp: 'AF 10/5/2021 18:33:59'!
test19ProcessingShouldStopWithErrorAtInvalidCommand
	
	| rover north |
	north _  self north.
	rover _ MarsRover at: 0@0 facing: north.
	self should: [rover process: 'fxf'.]  
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: MarsRover invalidCommandErrorDescription equals: anException messageText.
			self assert: (rover isAt: 0@1 facing: north).
		].
	! !


!TestMarsRover methodsFor: 'test process multiple commands' stamp: 'AF 10/5/2021 18:32:05'!
test18ProcessingMoreThanOneCommandShouldProcessAll
	
	| rover north |
	north _  self north.
	rover _ MarsRover at: 0@0 facing: north.
	rover process: 'ff'.
	self assert: (rover isAt: 0@2 facing: north).! !


!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:24:32'!
test01ProcessEmptyCommandShouldStayInPlace
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self north.
	rover process: ''.
	self assert: (rover isAt: 0@0 facing: self north).! !

!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:24:27'!
test02ProcessMovementCommandShouldMove
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self north.
	rover process: 'f'.
	self deny: (rover isAt: 0@0 facing: self north).! !

!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:24:11'!
test03ProcessFowardFacingNorth
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self north.
	rover process: 'f'.
	self assert: (rover isAt: 0@1 facing: self north).! !

!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:24:57'!
test04ProcessBackwardFacingNorth
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self north.
	rover process: 'b'.
	self assert: (rover isAt: 0@-1 facing: self north).! !

!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:25:17'!
test05ProcessRightFacingNorth
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self north.
	rover process: 'r'.
	self assert: (rover isAt: 0@0 facing: self east).! !

!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:25:39'!
test06ProcessLeftFacingNorth
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self north.
	rover process: 'l'.
	self assert: (rover isAt: 0@0 facing: self west).! !

!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:26:26'!
test07ProcessFowardFacingEast
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self east.
	rover process: 'f'.
	self assert: (rover isAt: 1@0 facing: self east).! !

!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:26:43'!
test08ProcessBackwardFacingEast
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self east.
	rover process: 'b'.
	self assert: (rover isAt: -1@0 facing: self east).! !

!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:27:01'!
test09ProcessRightFacingEast
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self east.
	rover process: 'r'.
	self assert: (rover isAt: 0@0 facing: self south).! !

!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:27:30'!
test10ProcessLeftFacingEast
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self east.
	rover process: 'l'.
	self assert: (rover isAt: 0@0 facing: self north).! !

!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:27:56'!
test11ProcessFowardFacingSouth
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self south.
	rover process: 'f'.
	self assert: (rover isAt: 0@-1 facing: self south).! !

!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:28:17'!
test12ProcessBackwardFacingSouth
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self south.
	rover process: 'b'.
	self assert: (rover isAt: 0@1 facing: self south).! !

!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:28:43'!
test13ProcessRightFacingSouth
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self south.
	rover process: 'r'.
	self assert: (rover isAt: 0@0 facing: self west).! !

!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:29:00'!
test14ProcessLeftFacingSouth
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self south.
	rover process: 'l'.
	self assert: (rover isAt: 0@0 facing: self east).! !

!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:29:21'!
test15ProcessFowardFacingWest
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self west.
	rover process: 'b'.
	self assert: (rover isAt: 1@0 facing: self west).! !

!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:29:56'!
test16ProcessRightFacingWest
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self west.
	rover process: 'r'.
	self assert: (rover isAt: 0@0 facing: self north).! !

!TestMarsRover methodsFor: 'test process single command' stamp: 'AF 10/5/2021 18:30:08'!
test17ProcessLeftFacingWest
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self west.
	rover process: 'l'.
	self assert: (rover isAt: 0@0 facing: self south).! !


!classDefinition: #CardinalDirection category: 'MarsRover'!
Object subclass: #CardinalDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!CardinalDirection methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:01:27'!
moveRoverBackward: aMarsRover

	self subclassResponsibility! !

!CardinalDirection methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:02:11'!
moveRoverForward: aMarsRover

	self subclassResponsibility! !

!CardinalDirection methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:02:34'!
rotateRoverLeft: aMarsRover

	self subclassResponsibility! !

!CardinalDirection methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:03:00'!
rotateRoverRight: aMarsRover

	self subclassResponsibility! !


!classDefinition: #East category: 'MarsRover'!
CardinalDirection subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:01:27'!
moveRoverBackward: aMarsRover

	aMarsRover moveBackwardFacingEast.! !

!East methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:02:11'!
moveRoverForward: aMarsRover

	aMarsRover moveForwardFacingEast.! !

!East methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:02:34'!
rotateRoverLeft: aMarsRover

	aMarsRover rotateLeftFacingEast.! !

!East methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:03:00'!
rotateRoverRight: aMarsRover

	aMarsRover rotateRightFacingEast! !


!classDefinition: #North category: 'MarsRover'!
CardinalDirection subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:01:27'!
moveRoverBackward: aMarsRover

	aMarsRover moveBackwardFacingNorth.! !

!North methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:02:11'!
moveRoverForward: aMarsRover

	aMarsRover moveForwardFacingNorth.! !

!North methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:02:34'!
rotateRoverLeft: aMarsRover

	aMarsRover rotateLeftFacingNorth.! !

!North methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:03:00'!
rotateRoverRight: aMarsRover

	aMarsRover rotateRightFacingNorth.! !


!classDefinition: #South category: 'MarsRover'!
CardinalDirection subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:01:27'!
moveRoverBackward: aMarsRover

	aMarsRover moveBackwardFacingSouth! !

!South methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:02:11'!
moveRoverForward: aMarsRover

	aMarsRover moveForwardFacingSouth.! !

!South methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:02:34'!
rotateRoverLeft: aMarsRover

	aMarsRover rotateLeftFacingSouth.! !

!South methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:03:00'!
rotateRoverRight: aMarsRover

	aMarsRover rotateRightFacingSouth.! !


!classDefinition: #West category: 'MarsRover'!
CardinalDirection subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:01:27'!
moveRoverBackward: aMarsRover

	aMarsRover moveBackwardFacingWest! !

!West methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:02:11'!
moveRoverForward: aMarsRover

	aMarsRover moveForwardFacingWest.! !

!West methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:02:34'!
rotateRoverLeft: aMarsRover

	aMarsRover rotateLeftFacingWest.! !

!West methodsFor: 'rover command processing - private' stamp: 'AF 10/5/2021 18:03:00'!
rotateRoverRight: aMarsRover

	aMarsRover rotateRightFacingWest.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'command processing' stamp: 'AF 10/5/2021 17:36:17'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [ :aCommand | self processCommand: aCommand. ]
	! !


!MarsRover methodsFor: 'command processing - private' stamp: 'AF 10/5/2021 18:09:38'!
moveBackwardFacingEast

	position _ position - (1@0)! !

!MarsRover methodsFor: 'command processing - private' stamp: 'AF 10/5/2021 18:09:40'!
moveBackwardFacingNorth

	position _ position - (0@1)! !

!MarsRover methodsFor: 'command processing - private' stamp: 'AF 10/5/2021 18:09:44'!
moveBackwardFacingSouth

	position _ position + (0@1)! !

!MarsRover methodsFor: 'command processing - private' stamp: 'AF 10/5/2021 18:09:49'!
moveBackwardFacingWest

	position _ position + (1@0).! !

!MarsRover methodsFor: 'command processing - private' stamp: 'IAR 10/5/2021 01:00:18'!
moveForwardFacingEast
	
	position _ position + (1@0).! !

!MarsRover methodsFor: 'command processing - private' stamp: 'AF 10/5/2021 18:09:57'!
moveForwardFacingNorth

	position _ position + (0@1).! !

!MarsRover methodsFor: 'command processing - private' stamp: 'AF 10/5/2021 18:10:00'!
moveForwardFacingSouth

	position _ position - (0@1).! !

!MarsRover methodsFor: 'command processing - private' stamp: 'AF 10/5/2021 18:10:04'!
moveForwardFacingWest

	position _ position - (1@0).! !

!MarsRover methodsFor: 'command processing - private' stamp: 'AF 10/5/2021 18:03:00'!
processCommand: aCommand

	(aCommand = $f) ifTrue: [ ^	cardinalDirection moveRoverForward: self	 ].
	(aCommand = $b) ifTrue: [ ^cardinalDirection moveRoverBackward: self ].
	(aCommand = $r) ifTrue: [ ^cardinalDirection rotateRoverRight: self ].
	(aCommand = $l) ifTrue: [ ^cardinalDirection rotateRoverLeft: self 	].
	
	self error: self class invalidCommandErrorDescription.! !

!MarsRover methodsFor: 'command processing - private' stamp: 'AF 10/5/2021 18:10:11'!
rotateLeftFacingEast

	cardinalDirection _ North new.! !

!MarsRover methodsFor: 'command processing - private' stamp: 'AF 10/5/2021 18:10:14'!
rotateLeftFacingNorth

	cardinalDirection _ West new.! !

!MarsRover methodsFor: 'command processing - private' stamp: 'AF 10/5/2021 18:10:21'!
rotateLeftFacingSouth

	cardinalDirection _ East new.! !

!MarsRover methodsFor: 'command processing - private' stamp: 'AF 10/5/2021 18:10:27'!
rotateLeftFacingWest

	cardinalDirection _	South new.! !

!MarsRover methodsFor: 'command processing - private' stamp: 'AF 10/5/2021 18:10:31'!
rotateRightFacingEast

	cardinalDirection _ South new.! !

!MarsRover methodsFor: 'command processing - private' stamp: 'AF 10/5/2021 18:10:36'!
rotateRightFacingNorth

	cardinalDirection _ East new.! !

!MarsRover methodsFor: 'command processing - private' stamp: 'AF 10/5/2021 18:10:38'!
rotateRightFacingSouth

	cardinalDirection _ West new.! !

!MarsRover methodsFor: 'command processing - private' stamp: 'AF 10/5/2021 18:10:43'!
rotateRightFacingWest

	cardinalDirection _ North new.! !


!MarsRover methodsFor: 'initialization' stamp: 'IAR 10/4/2021 23:23:55'!
initializeAt: aPosition facing: aCardinalDirection 
	
	position := aPosition.
	cardinalDirection := aCardinalDirection.! !


!MarsRover methodsFor: 'testing' stamp: 'IAR 10/5/2021 01:04:22'!
isAt: aPosition facing: aCardinalDirection 
	
	^aPosition = position and: [ aCardinalDirection isKindOf: cardinalDirection class].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'error descriptions' stamp: 'AF 10/5/2021 17:55:50'!
invalidCommandErrorDescription
	
	^'invalid command'.! !


!MarsRover class methodsFor: 'instance creation' stamp: 'IAR 10/4/2021 23:23:03'!
at: aPosition facing: aCardinalDirection

	^self new initializeAt: aPosition facing: aCardinalDirection.! !
