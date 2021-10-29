!classDefinition: #CartTest category: 'TusLibros-It1'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-It1'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'AF 10/28/2021 21:02:51'!
test01

	| cart |
	cart _ Cart new.
	self assert: cart isEmpty.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'AF 10/28/2021 21:29:11'!
test02

	| cart aBook aCatalog |
	aBook _ 'growing object-oriented software guided by tests'.
	aCatalog _ OrderedCollection with:  aBook.
	cart _ Cart with: aCatalog.
	cart addBook: 'growing object-oriented software guided by tests'.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'AF 10/28/2021 21:29:23'!
test03

	| cart aBook aCatalog |
	aBook _ 'growing object-oriented software guided by tests'.
	aCatalog _ OrderedCollection with:  aBook.
	cart _ Cart with: aCatalog.
	cart addBook: aBook.
	self assert: (cart includes: aBook).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'AF 10/28/2021 21:24:39'!
test04

	| cart aBook aCatalog |
	
	aCatalog _ OrderedCollection new.
	cart _ Cart with: aCatalog.
	aBook _ 'growing object-oriented software guided by tests'.
	
	self should: [ cart addBook: aBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cart bookNotInCatalogErrorDescription equals: anError messageText.
			self deny: (cart includes: aBook) ].! !


!classDefinition: #Cart category: 'TusLibros-It1'!
Object subclass: #Cart
	instanceVariableNames: 'contents catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-It1'!

!Cart methodsFor: 'as yet unclassified' stamp: 'AF 10/28/2021 21:27:56'!
addBook: aBook
	
	(catalog includes: aBook) ifFalse: [ self error: self class bookNotInCatalogErrorDescription ].
	contents add: aBook.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'AF 10/28/2021 21:13:47'!
includes: aBook 
	
	^contents includes: aBook.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'AF 10/28/2021 21:09:33'!
initialize

	contents _ OrderedCollection new.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'AF 10/28/2021 21:09:53'!
isEmpty
	
	^contents isEmpty.! !


!Cart methodsFor: 'initialization' stamp: 'AF 10/28/2021 21:26:03'!
initializeWith: aCatalog 
	
	catalog _ aCatalog.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros-It1'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'AF 10/28/2021 21:25:46'!
with: aCatalog
	
	^self new initializeWith: aCatalog ! !


!Cart class methodsFor: 'as yet unclassified' stamp: 'AF 10/28/2021 21:30:29'!
bookNotInCatalogErrorDescription
	
	^'Book not in catalog'! !
