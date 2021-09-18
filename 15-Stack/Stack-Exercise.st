!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !




!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Agustin Frenkel 9/18/2021 16:37:45'!
test01FindWithNoSentecesReturnsAnEmptyList

	|sentences sentenceFinder |
	
	sentences _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix withSentences: sentences.
	
	self assert: (sentenceFinder find: 'pepe') isEmpty. 
	self assert: (sentences isEmpty). 
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Agustin Frenkel 9/17/2021 21:00:47'!
test02FindWithPrefixReturnOneSentence

	|sentences sentenceFinder firstSentence secondSentence expectedSentences prefix |
	
	sentences _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix withSentences: sentences.

	firstSentence _ 'Peter Naur'.
	secondSentence _ 'singleton pattern is the best algorthim'.
	
	sentences push: firstSentence.
	sentences push:	 secondSentence.
	
	prefix _ secondSentence copyFrom: 1 to: 4. 
	expectedSentences _ OrderedCollection with: secondSentence.
	self assert: (sentenceFinder find: prefix) equals: expectedSentences. 
	
	self assertStack: sentences  isEquivalentTo: {secondSentence. firstSentence}.	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Agustin Frenkel 9/18/2021 16:53:07'!
test03FindWithPrefixReturnsAllSentencesMatchingPrefix

	|sentences sentenceFinder firstSentence secondSentence expectedSentences prefix fourthSentence thirdSentence fifthSentence sixthSentence |
	
	sentences _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix withSentences: sentences.

	firstSentence _ 'Peter Naur'.
	secondSentence _ 'singleton pattern is the best algorthim'.
	thirdSentence _ firstSentence, ' was the best programer'.
	fourthSentence _ 'smothing diferent'.
	fifthSentence _ firstSentence , ' was wrong'.
	sixthSentence _ firstSentence, ' loves chicken wings'.
	
	sentences push: firstSentence.
	sentences push:	 secondSentence.
	sentences push: thirdSentence.
	sentences push: fourthSentence.
	sentences push: fifthSentence.
	sentences push: sixthSentence.
	
	prefix _ firstSentence copyFrom: 1 to: 4. 
	expectedSentences _ OrderedCollection with: sixthSentence with: fifthSentence with: thirdSentence with: firstSentence.
	self assert: (sentenceFinder find: prefix) equals: expectedSentences. 
	
	self assertStack: sentences  isEquivalentTo: {sixthSentence. fifthSentence. fourthSentence. thirdSentence. secondSentence. firstSentence.}.	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Agustin Frenkel 9/18/2021 16:54:50'!
test04FindIsCaseSensitive

	|sentences sentenceFinder firstSentence secondSentence expectedSentences prefix |
	
	sentences _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix withSentences: sentences.

	firstSentence _ 'Peter Naur'.
	secondSentence _ 'peter Naur is great!!'.
	
	sentences push: firstSentence.
	sentences push:	 secondSentence.
	
	prefix _ secondSentence copyFrom: 1 to: 4. 
	expectedSentences _ OrderedCollection with: secondSentence.
	self assert: (sentenceFinder find: prefix) equals: expectedSentences. 
	
	self assertStack: sentences  isEquivalentTo: {secondSentence. firstSentence}.	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Agustin Frenkel 9/18/2021 17:25:05'!
test05StackWithSentencesThatDontMatchThePrefixShouldReturnEmptyList

	|sentences sentenceFinder firstSentence secondSentence expectedSentences prefix fourthSentence thirdSentence fifthSentence sixthSentence |
	
	sentences _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix withSentences: sentences.

	firstSentence _ 'Peter Naur'.
	secondSentence _ 'singleton pattern is the best algorthim'.
	thirdSentence _ firstSentence, ' was the best programer'.
	fourthSentence _ 'smothing diferent'.
	fifthSentence _ firstSentence , ' was wrong'.
	sixthSentence _ firstSentence, ' loves chicken wings'.
	
	sentences push: firstSentence.
	sentences push:	 secondSentence.
	sentences push: thirdSentence.
	sentences push: fourthSentence.
	sentences push: fifthSentence.
	sentences push: sixthSentence.
	
	prefix _ 'doble dispatch'.
	expectedSentences _ OrderedCollection new.
	self assert: (sentenceFinder find: prefix) equals: expectedSentences. 
	
	self assertStack: sentences  isEquivalentTo: {sixthSentence. fifthSentence. fourthSentence. thirdSentence. secondSentence. firstSentence.}.	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Agustin Frenkel 9/18/2021 17:39:51'!
test06EmptyPrefixShouldReturnAllSentences

	|sentences sentenceFinder firstSentence secondSentence expectedSentences prefix fourthSentence thirdSentence fifthSentence sixthSentence |
	
	sentences _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix withSentences: sentences.

	firstSentence _ 'Peter Naur'.
	secondSentence _ 'singleton pattern is the best algorthim'.
	thirdSentence _ firstSentence, ' was the best programer'.
	fourthSentence _ 'smothing diferent'.
	fifthSentence _ firstSentence , ' was wrong'.
	sixthSentence _ firstSentence, ' loves chicken wings'.
	
	sentences push: firstSentence.
	sentences push:	 secondSentence.
	sentences push: thirdSentence.
	sentences push: fourthSentence.
	sentences push: fifthSentence.
	sentences push: sixthSentence.
	
	prefix _ ''.
	expectedSentences _ OrderedCollection with:sixthSentence with:fifthSentence with:fourthSentence with:thirdSentence with:secondSentence with:firstSentence.
	self assert: (sentenceFinder find: prefix) equals: expectedSentences. 
	
	self assertStack: sentences  isEquivalentTo: {sixthSentence. fifthSentence. fourthSentence. thirdSentence. secondSentence. firstSentence.}.	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Agustin Frenkel 9/18/2021 17:38:12'!
test07StackWithInvalidElementsReturnsError

	|sentences sentenceFinder prefix|
	
	sentences _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix withSentences: sentences.

	sentences push: 1.
	sentences push:	 2.
	sentences push: 3.
	
	prefix _ 'doble dispatch'.
	self
		should: [ sentenceFinder find: prefix]
		raise: MessageNotUnderstood.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Agustin Frenkel 9/18/2021 17:50:35'!
test08InvalidPrefixReturnsError

	|sentences sentenceFinder prefix|
	
	sentences _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix withSentences: sentences.

	sentences push: 'haha joke funny'.
	sentences push:	 'Wilkinson AYUDA'.
	sentences push: 'makumbero'.
	
	prefix _ 9.
	self
		should: [ sentenceFinder find: prefix]
		raise:  Error - MessageNotUnderstood.! !


!SentenceFinderByPrefixTest methodsFor: 'assertions' stamp: 'Agustin Frenkel 9/17/2021 21:00:47'!
assertStack: aStack isEquivalentTo: aCollection

	self assert: (aStack size) equals: aCollection size.
	aCollection do: [:aSentence |
		self assert: (aStack pop) equals: aSentence
	].! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'contentManager content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'Agustin Frenkel 9/17/2021 18:42:43'!
isEmpty
	^ content isEmpty.! !


!OOStack methodsFor: 'accessing' stamp: 'Agustin Frenkel 9/17/2021 19:02:39'!
pop
	
	| top |
	top _ contentManager pop.
	contentManager _ contentManager update.
	^top.
	! !

!OOStack methodsFor: 'accessing' stamp: 'Agustin Frenkel 9/17/2021 19:16:11'!
push: anElement
	
	content addFirst: anElement.
	contentManager _ NonEmptyContentManager with: content.
	! !

!OOStack methodsFor: 'accessing' stamp: 'Agustin Frenkel 9/17/2021 18:42:43'!
size
	^content size.! !

!OOStack methodsFor: 'accessing' stamp: 'Agustin Frenkel 9/17/2021 19:04:57'!
top

	^contentManager top.! !


!OOStack methodsFor: 'initialization' stamp: 'Agustin Frenkel 9/17/2021 19:15:43'!
initialize
	
	content _ OrderedCollection new.
	contentManager _ EmptyContentManager with: content.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/16/2021 17:39:43'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !



!classDefinition: #OOStackContentManager category: 'Stack-Exercise'!
Object subclass: #OOStackContentManager
	instanceVariableNames: 'stackContents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackContentManager methodsFor: 'accessing' stamp: 'Agustin Frenkel 9/17/2021 18:40:41'!
pop

	self subclassResponsibility.! !

!OOStackContentManager methodsFor: 'accessing' stamp: 'Agustin Frenkel 9/17/2021 18:49:45'!
top

	self subclassResponsibility.! !

!OOStackContentManager methodsFor: 'accessing' stamp: 'Agustin Frenkel 9/17/2021 18:59:36'!
update

	^self class for: 	stackContents.! !


!OOStackContentManager methodsFor: 'initialization' stamp: 'Agustin Frenkel 9/17/2021 19:13:49'!
initializeWith: aStackContents

	stackContents _ aStackContents.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackContentManager class' category: 'Stack-Exercise'!
OOStackContentManager class
	instanceVariableNames: ''!

!OOStackContentManager class methodsFor: 'instance creation - private' stamp: 'Agustin Frenkel 9/17/2021 18:38:09'!
canHandle: content

	self subclassResponsibility.! !

!OOStackContentManager class methodsFor: 'instance creation - private' stamp: 'Agustin Frenkel 9/17/2021 19:12:04'!
with: aStackContents

	^self new initializeWith: aStackContents.! !


!OOStackContentManager class methodsFor: 'instance creation' stamp: 'Agustin Frenkel 9/17/2021 19:28:58'!
for: content
	
	^(OOStackContentManager subclasses
		detect: [:aSubclass | aSubclass canHandle: content]
		ifNone: [self error: 'no se puede inicializar un estado con esos contenidos']) new initializeWith: content.! !


!classDefinition: #EmptyContentManager category: 'Stack-Exercise'!
OOStackContentManager subclass: #EmptyContentManager
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyContentManager methodsFor: 'as yet unclassified' stamp: 'Agustin Frenkel 9/17/2021 18:46:42'!
pop

	self error: OOStack stackEmptyErrorDescription.! !

!EmptyContentManager methodsFor: 'as yet unclassified' stamp: 'Agustin Frenkel 9/17/2021 19:05:11'!
top

	self error: OOStack stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyContentManager class' category: 'Stack-Exercise'!
EmptyContentManager class
	instanceVariableNames: ''!

!EmptyContentManager class methodsFor: 'as yet unclassified' stamp: 'Agustin Frenkel 9/17/2021 18:38:37'!
canHandle: content

	^content isEmpty.

	! !


!classDefinition: #NonEmptyContentManager category: 'Stack-Exercise'!
OOStackContentManager subclass: #NonEmptyContentManager
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyContentManager methodsFor: 'as yet unclassified' stamp: 'Agustin Frenkel 9/17/2021 18:48:40'!
pop

	^stackContents removeFirst.! !

!NonEmptyContentManager methodsFor: 'as yet unclassified' stamp: 'Agustin Frenkel 9/17/2021 19:05:24'!
top

	^stackContents first.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyContentManager class' category: 'Stack-Exercise'!
NonEmptyContentManager class
	instanceVariableNames: ''!

!NonEmptyContentManager class methodsFor: 'as yet unclassified' stamp: 'Agustin Frenkel 9/17/2021 18:39:17'!
canHandle: content

	^content isEmpty not.

	! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackOfSenteces'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'Agustin Frenkel 9/17/2021 21:32:38'!
do: aClosureWithASentence

	
	| backupStack |
	backupStack _ OOStack new.	
	 
	[stackOfSenteces isEmpty not] whileTrue: [ 
		|currentSentence |
		currentSentence _ stackOfSenteces pop.
		backupStack push: currentSentence.
		aClosureWithASentence value: currentSentence.
		].
	
	self transferFrom: backupStack to: stackOfSenteces.
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'Agustin Frenkel 9/17/2021 21:33:26'!
find: aPrefix 

	
	|matchingSentences|
	matchingSentences _ OrderedCollection new.
	
	self do: [:aSentence | (aSentence beginsWith: aPrefix) 
			ifTrue: [matchingSentences add: aSentence].
		].
	
	 ^matchingSentences.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'Agustin Frenkel 9/17/2021 19:55:37'!
initializeWithSenteces: aStackOfSenteces

	stackOfSenteces _ aStackOfSenteces.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'Agustin Frenkel 9/17/2021 21:15:03'!
transferFrom: sourceStack to: destinationStack

	^ [sourceStack isEmpty not] whileTrue: [ 
		| currentSentence |
		currentSentence _ sourceStack pop.
		destinationStack push: currentSentence.
		]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'Agustin Frenkel 9/17/2021 19:59:43'!
withSentences: aStack

	^self basicNew initializeWithSenteces: aStack.! !
