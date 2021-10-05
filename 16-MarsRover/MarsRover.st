!classDefinition: #TestMarsRover category: 'MarsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestMarsRover methodsFor: 'asdfasfsdafdsa' stamp: 'IAR 10/5/2021 00:56:30'!
east

	^ East new! !

!TestMarsRover methodsFor: 'asdfasfsdafdsa' stamp: 'IAR 10/5/2021 00:56:25'!
north

	^ North new! !

!TestMarsRover methodsFor: 'asdfasfsdafdsa' stamp: 'IAR 10/5/2021 00:56:45'!
south

	^ South new! !

!TestMarsRover methodsFor: 'asdfasfsdafdsa' stamp: 'IAR 10/5/2021 00:56:37'!
west

	^ West new! !


!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:53:25'!
test01
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self north.
	rover process: ''.
	self assert: (rover isAt: 0@0 facing: self north).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:52:39'!
test02
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self north.
	rover process: 'f'.
	self deny: (rover isAt: 0@0 facing: self north).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:53:35'!
test03
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self north.
	rover process: 'f'.
	self assert: (rover isAt: 0@1 facing: self north).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:53:42'!
test04
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self north.
	rover process: 'b'.
	self assert: (rover isAt: 0@-1 facing: self north).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:53:53'!
test05
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self north.
	rover process: 'r'.
	self assert: (rover isAt: 0@0 facing: self east).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:54:06'!
test06
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self north.
	rover process: 'l'.
	self assert: (rover isAt: 0@0 facing: self west).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:54:20'!
test07
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self east.
	rover process: 'f'.
	self assert: (rover isAt: 1@0 facing: self east).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:54:27'!
test08
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self east.
	rover process: 'b'.
	self assert: (rover isAt: -1@0 facing: self east).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:54:39'!
test09
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self east.
	rover process: 'r'.
	self assert: (rover isAt: 0@0 facing: self south).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:54:54'!
test10
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self east.
	rover process: 'l'.
	self assert: (rover isAt: 0@0 facing: self north).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:55:09'!
test11
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self south.
	rover process: 'f'.
	self assert: (rover isAt: 0@-1 facing: self south).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:55:17'!
test12
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self south.
	rover process: 'b'.
	self assert: (rover isAt: 0@1 facing: self south).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:55:26'!
test13
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self south.
	rover process: 'r'.
	self assert: (rover isAt: 0@0 facing: self west).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:55:34'!
test14
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self south.
	rover process: 'l'.
	self assert: (rover isAt: 0@0 facing: self east).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:55:45'!
test15
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self west.
	rover process: 'b'.
	self assert: (rover isAt: 1@0 facing: self west).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:55:54'!
test16
	
	| rover |
	rover _ MarsRover at: 0@0 facing: self west.
	rover process: 'r'.
	self assert: (rover isAt: 0@0 facing: self north).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:56:03'!
test17
	
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

!CardinalDirection methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:48:28'!
moveBackward: aMarsRover

	self subclassResponsibility! !

!CardinalDirection methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:44:23'!
moveForward: aMarsRover

	self subclassResponsibility! !

!CardinalDirection methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:49:43'!
rotateLeft: aMarsRover

	self subclassResponsibility! !

!CardinalDirection methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:49:47'!
rotateRight: aMarsRover

	self subclassResponsibility! !


!classDefinition: #East category: 'MarsRover'!
CardinalDirection subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 16:55:07'!
moveBackward: aMarsRover

	aMarsRover moveBackwardFacingEast.! !

!East methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:44:50'!
moveForward: aMarsRover

	aMarsRover moveForwardFacingEast.! !

!East methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:07:25'!
rotateLeft: aMarsRover

	aMarsRover rotateLeftFacingEast.! !

!East methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:07:48'!
rotateRight: aMarsRover

	aMarsRover rotateRightFacingEast! !


!classDefinition: #North category: 'MarsRover'!
CardinalDirection subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 16:53:42'!
moveBackward: aMarsRover

	aMarsRover moveBackwardFacingNorth.! !

!North methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:45:15'!
moveForward: aMarsRover

	aMarsRover moveForwardFacingNorth.! !

!North methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:07:00'!
rotateLeft: aMarsRover

	aMarsRover rotateLeftFacingNorth.! !

!North methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:05:33'!
rotateRight: aMarsRover

	aMarsRover rotateRightFacingNorth.! !


!classDefinition: #South category: 'MarsRover'!
CardinalDirection subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 16:57:14'!
moveBackward: aMarsRover

	aMarsRover moveBackwardFacingSouth! !

!South methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:45:39'!
moveForward: aMarsRover

	aMarsRover moveForwardFacingSouth.! !

!South methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:08:26'!
rotateLeft: aMarsRover

	aMarsRover rotateLeftFacingSouth.! !

!South methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:08:35'!
rotateRight: aMarsRover

	aMarsRover rotateRightFacingSouth.! !


!classDefinition: #West category: 'MarsRover'!
CardinalDirection subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 16:57:31'!
moveBackward: aMarsRover

	aMarsRover moveBackwardFacingWest! !

!West methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:45:53'!
moveForward: aMarsRover

	aMarsRover moveForwardFacingWest.! !

!West methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:08:53'!
rotateLeft: aMarsRover

	aMarsRover rotateLeftFacingWest.! !

!West methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:09:10'!
rotateRight: aMarsRover

	aMarsRover rotateRightFacingWest.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'IAR 10/4/2021 23:23:55'!
initializeAt: aPosition facing: aCardinalDirection 
	
	position := aPosition.
	cardinalDirection := aCardinalDirection.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 01:04:22'!
isAt: aPosition facing: aCardinalDirection 
	
	^aPosition = position and: [ aCardinalDirection isKindOf: cardinalDirection class].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 16:56:12'!
moveBackwardFacingEast
	position _ position - (1@0)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 16:54:26'!
moveBackwardFacingNorth
	position _ position - (0@1)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 16:58:17'!
moveBackwardFacingSouth
	position _ position + (0@1)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 16:58:57'!
moveBackwardFacingWest
	position _ position + (1@0).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 01:00:18'!
moveForwardFacingEast
	
	position _ position + (1@0).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 00:59:15'!
moveForwardFacingNorth
	position _ position + (0@1).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 01:02:15'!
moveForwardFacingSouth
	position _ position - (0@1).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IAR 10/5/2021 01:02:21'!
moveForwardFacingWest
	position _ position - (1@0).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:16:34'!
process: aSequenceOfCommands

	(aSequenceOfCommands = '') ifTrue: [ ^self ].
	(aSequenceOfCommands = 'f') ifTrue: [		cardinalDirection moveForward: self	 ].
	(aSequenceOfCommands = 'b') ifTrue: [ cardinalDirection moveBackward: self ].
	(aSequenceOfCommands = 'r') ifTrue: [ cardinalDirection rotateRight: self ].
	(aSequenceOfCommands = 'l') ifTrue: [ cardinalDirection rotateLeft: self 	]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:11:32'!
rotateLeftFacingEast
	cardinalDirection _ North new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:09:45'!
rotateLeftFacingNorth
	cardinalDirection _ West new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:13:48'!
rotateLeftFacingSouth
	cardinalDirection _ East new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:15:00'!
rotateLeftFacingWest
	cardinalDirection _	South new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:10:45'!
rotateRightFacingEast
	cardinalDirection _ South new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:06:06'!
rotateRightFacingNorth
	cardinalDirection _ East new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:13:06'!
rotateRightFacingSouth
	cardinalDirection _ West new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AF 10/5/2021 17:14:25'!
rotateRightFacingWest
	cardinalDirection _ North new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'IAR 10/4/2021 23:23:03'!
at: aPosition facing: aCardinalDirection

	^self new initializeAt: aPosition facing: aCardinalDirection.! !
