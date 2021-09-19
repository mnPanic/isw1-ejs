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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MP 9/19/2021 16:52:42'!
test02FindWithPrefixMatchingASingleSentenceReturnsThatSentence

	|sentences sentenceFinder firstSentence secondSentence expectedSentences prefix |
	
	sentences _ OOStack new.
	firstSentence _ 'Peter Naur'.
	secondSentence _ 'singleton pattern is the best algorthim'.
	
	sentences push: firstSentence.
	sentences push:	 secondSentence.
	
	sentenceFinder _ SentenceFinderByPrefix withSentences: sentences.

	prefix _ secondSentence copyFrom: 1 to: 4. 
	expectedSentences _ OrderedCollection with: secondSentence.
	self assert: (sentenceFinder find: prefix) equals: expectedSentences. 
	
	self assertStack: sentences  isEquivalentTo: {secondSentence. firstSentence}.	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MP 9/19/2021 16:53:24'!
test03FindReturnsAllSentencesMatchingPrefix

	|sentences sentenceFinder firstSentence secondSentence expectedSentences prefix fourthSentence thirdSentence fifthSentence sixthSentence |
	
	sentences _ OOStack new.
	firstSentence _ 'Peter Naur'.
	secondSentence _ 'singleton pattern is the best algorthim'.
	thirdSentence _ firstSentence, ' was the best programer'.
	fourthSentence _ 'smothing diferent'.
	fifthSentence _ firstSentence , ' was wrong'.
	sixthSentence _ firstSentence, ' loved chicken wings'.
	
	sentences push: firstSentence.
	sentences push:	 secondSentence.
	sentences push: thirdSentence.
	sentences push: fourthSentence.
	sentences push: fifthSentence.
	sentences push: sixthSentence.
	
	sentenceFinder _ SentenceFinderByPrefix withSentences: sentences.
	
	prefix _ firstSentence copyFrom: 1 to: 4. 
	expectedSentences _ OrderedCollection with: sixthSentence with: fifthSentence with: thirdSentence with: firstSentence.
	self assert: (sentenceFinder find: prefix) equals: expectedSentences. 
	
	self assertStack: sentences isEquivalentTo: {sixthSentence. fifthSentence. fourthSentence. thirdSentence. secondSentence. firstSentence.}.	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MP 9/19/2021 16:53:39'!
test04FindPrefixIsCaseSensitive

	|sentences sentenceFinder firstSentence secondSentence expectedSentences prefix |
	
	sentences _ OOStack new.
	firstSentence _ 'Peter Naur'.
	secondSentence _ 'peter Naur is great!!'.
	
	sentences push: firstSentence.
	sentences push:	 secondSentence.
	
	sentenceFinder _ SentenceFinderByPrefix withSentences: sentences.

	
	prefix _ secondSentence copyFrom: 1 to: 4. 
	expectedSentences _ OrderedCollection with: secondSentence.
	self assert: (sentenceFinder find: prefix) equals: expectedSentences. 
	
	self assertStack: sentences  isEquivalentTo: {secondSentence. firstSentence}.	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MP 9/19/2021 16:54:03'!
test05StackWithSentencesThatDontMatchThePrefixShouldReturnAnEmptyList

	|sentences sentenceFinder firstSentence secondSentence expectedSentences prefix fourthSentence thirdSentence fifthSentence sixthSentence |
	
	sentences _ OOStack new.
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
	
	sentenceFinder _ SentenceFinderByPrefix withSentences: sentences.

	
	prefix _ 'doble'.
	expectedSentences _ OrderedCollection new.
	self assert: (sentenceFinder find: prefix) equals: expectedSentences. 
	
	self assertStack: sentences  isEquivalentTo: {sixthSentence. fifthSentence. fourthSentence. thirdSentence. secondSentence. firstSentence.}.	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MP 9/19/2021 16:25:30'!
test06EmptyPrefixShouldReturnError

	|sentences sentenceFinder firstSentence secondSentence prefix thirdSentence |
	
	sentences _ OOStack new.
	firstSentence _ 'Peter Naur'.
	secondSentence _ 'singleton pattern is the best algorthim'.
	thirdSentence _ firstSentence, ' was the best programer'.

	sentences push: firstSentence.
	sentences push:	 secondSentence.
	sentences push: thirdSentence.
	
	sentenceFinder _ SentenceFinderByPrefix withSentences: sentences.

	prefix _ ''.
	self should: [sentenceFinder find: prefix]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix errorDescriptionEmptyPrefix].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MP 9/19/2021 16:23:38'!
test07StackWithInvalidElementsReturnsError

	|sentences sentenceFinder prefix|
	
	sentences _ OOStack new.
	sentences push: 1.
	sentences push:	 2.
	sentences push: 3.

	sentenceFinder _ SentenceFinderByPrefix withSentences: sentences.
	
	prefix _ 'doubledispatch'.
	self
		should: [ sentenceFinder find: prefix]
		raise: MessageNotUnderstood.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MP 9/19/2021 16:55:41'!
test08InvalidPrefixReturnsError

	|sentences sentenceFinder prefix|
	
	sentences _ OOStack new.
	sentences push: 'sentence 1'.
	sentences push:	 'sentence 2'.
	sentences push: 'sentence 3'.
	
	sentenceFinder _ SentenceFinderByPrefix withSentences: sentences.

	prefix _ 9.
	self
		should: [ sentenceFinder find: prefix]
		raise:  MessageNotUnderstood.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MP 9/19/2021 16:20:22'!
test09PrefixWithSpacesShouldReturnError

	|sentences sentenceFinder firstSentence secondSentence prefix thirdSentence |
	
	sentences _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix withSentences: sentences.

	firstSentence _ 'Peter Naur'.
	secondSentence _ 'singleton pattern is the best algorthim'.
	thirdSentence _ firstSentence, ' was the best programer'.
	
	sentences push: firstSentence.
	sentences push:	 secondSentence.
	sentences push: thirdSentence.
	
	prefix _ 'this is a prefix with spaces'.
	self should: [sentenceFinder find: prefix]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix errorDescriptionPrefixWithSpaces ].! !


!SentenceFinderByPrefixTest methodsFor: 'assertions' stamp: 'Agustin Frenkel 9/17/2021 21:00:47'!
assertStack: aStack isEquivalentTo: aCollection

	self assert: (aStack size) equals: aCollection size.
	aCollection do: [:aSentence |
		self assert: (aStack pop) equals: aSentence
	].! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'contentManager'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'MP 9/19/2021 17:14:36'!
isEmpty

	^contentManager isEmpty.! !


!OOStack methodsFor: 'accessing' stamp: 'Agustin Frenkel 9/18/2021 18:14:25'!
pop
	
	| top |
	top _ contentManager top.
	contentManager _ contentManager pop.
	 
	^top.
	! !

!OOStack methodsFor: 'accessing' stamp: 'Agustin Frenkel 9/18/2021 18:06:05'!
push: anElement
	
	contentManager _ contentManager push: anElement.
	! !

!OOStack methodsFor: 'accessing' stamp: 'MP 9/19/2021 17:14:52'!
size

	^contentManager size.! !

!OOStack methodsFor: 'accessing' stamp: 'Agustin Frenkel 9/17/2021 19:04:57'!
top

	^contentManager top.! !


!OOStack methodsFor: 'initialization' stamp: 'MP 9/19/2021 17:15:01'!
initialize

	contentManager _ EmptyContentManager new.! !

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

!OOStackContentManager methodsFor: 'accessing' stamp: 'Agustin Frenkel 9/18/2021 18:22:16'!
push: anElement
	
	stackContents addFirst: anElement.
	^NonEmptyContentManager with: stackContents .! !

!OOStackContentManager methodsFor: 'accessing' stamp: 'Agustin Frenkel 9/18/2021 18:28:41'!
size

	^stackContents size.! !

!OOStackContentManager methodsFor: 'accessing' stamp: 'Agustin Frenkel 9/17/2021 18:49:45'!
top

	self subclassResponsibility.! !


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


!OOStackContentManager class methodsFor: 'instance creation' stamp: 'MP 9/19/2021 17:18:12'!
for: content
	
	^(OOStackContentManager subclasses
		detect: [:aSubclass | aSubclass canHandle: content]
		ifNone: [self error: 'cannot initialize content manager for that content']) new initializeWith: content.! !


!classDefinition: #EmptyContentManager category: 'Stack-Exercise'!
OOStackContentManager subclass: #EmptyContentManager
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyContentManager methodsFor: 'testing' stamp: 'Agustin Frenkel 9/18/2021 18:15:44'!
isEmpty
	^true.! !


!EmptyContentManager methodsFor: 'initialization' stamp: 'Agustin Frenkel 9/18/2021 18:31:50'!
initialize
	stackContents _ OrderedCollection new.! !


!EmptyContentManager methodsFor: 'accessing' stamp: 'Agustin Frenkel 9/17/2021 18:46:42'!
pop

	self error: OOStack stackEmptyErrorDescription.! !

!EmptyContentManager methodsFor: 'accessing' stamp: 'Agustin Frenkel 9/17/2021 19:05:11'!
top

	self error: OOStack stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyContentManager class' category: 'Stack-Exercise'!
EmptyContentManager class
	instanceVariableNames: ''!

!EmptyContentManager class methodsFor: 'instance creation - private' stamp: 'Agustin Frenkel 9/17/2021 18:38:37'!
canHandle: content

	^content isEmpty.

	! !


!classDefinition: #NonEmptyContentManager category: 'Stack-Exercise'!
OOStackContentManager subclass: #NonEmptyContentManager
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyContentManager methodsFor: 'accessing' stamp: 'MP 9/19/2021 17:17:14'!
pop

	stackContents removeFirst.
	^self reclassify.! !

!NonEmptyContentManager methodsFor: 'accessing' stamp: 'Agustin Frenkel 9/17/2021 19:05:24'!
top

	^stackContents first.! !


!NonEmptyContentManager methodsFor: 'testing' stamp: 'Agustin Frenkel 9/18/2021 18:23:37'!
isEmpty
	^false.! !


!NonEmptyContentManager methodsFor: 'accessing - private' stamp: 'MP 9/19/2021 17:17:14'!
reclassify

	^self class for: 	stackContents.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyContentManager class' category: 'Stack-Exercise'!
NonEmptyContentManager class
	instanceVariableNames: ''!

!NonEmptyContentManager class methodsFor: 'instance creation - private' stamp: 'Agustin Frenkel 9/17/2021 18:39:17'!
canHandle: content

	^content isEmpty not.

	! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackOfSenteces'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'assertions' stamp: 'MP 9/19/2021 16:27:55'!
assertPrefixDoesntIncludeSpaces: aPrefix

	^ (aPrefix includesSubString: ' ') ifTrue: [self error: self class errorDescriptionPrefixWithSpaces]! !

!SentenceFinderByPrefix methodsFor: 'assertions' stamp: 'MP 9/19/2021 16:26:51'!
assertPrefixIsNotEmpty: aPrefix

	^ (aPrefix isEmpty) ifTrue: [self error: self class errorDescriptionEmptyPrefix]! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'Agustin Frenkel 9/17/2021 19:55:37'!
initializeWithSenteces: aStackOfSenteces

	stackOfSenteces _ aStackOfSenteces.! !


!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'MP 9/19/2021 16:37:38'!
find: aPrefix 	
	self assertPrefixIsNotEmpty: aPrefix.	
	self assertPrefixDoesntIncludeSpaces: aPrefix.

	^self selectSentences: [:aSentence | aSentence beginsWith: aPrefix].! !


!SentenceFinderByPrefix methodsFor: 'stack management - private' stamp: 'MP 9/19/2021 16:50:25'!
restoreSentencesFrom: sourceStack

	[sourceStack isEmpty not] whileTrue: [
		stackOfSenteces push: sourceStack pop.
	]! !

!SentenceFinderByPrefix methodsFor: 'stack management - private' stamp: 'MP 9/19/2021 16:51:47'!
selectSentences: aPredicateOverASentence
	| backupStack selectedSentences |
	backupStack _ OOStack new.	
	selectedSentences _ OrderedCollection new.
	 
	[stackOfSenteces isEmpty not] whileTrue: [ 
		|currentSentence|
		currentSentence _ stackOfSenteces pop.
		backupStack push: currentSentence.
	
		(aPredicateOverASentence value: currentSentence) ifTrue: [selectedSentences add: currentSentence].
	].
	
	self restoreSentencesFrom: backupStack.
	^selectedSentences.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'Agustin Frenkel 9/17/2021 19:59:43'!
withSentences: aStack

	^self basicNew initializeWithSenteces: aStack.! !


!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'MP 9/19/2021 16:17:16'!
errorDescriptionEmptyPrefix
	^'prefix cannot be empty'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'MP 9/19/2021 16:18:27'!
errorDescriptionPrefixWithSpaces
	^'prefix cannot contain spaces'! !
