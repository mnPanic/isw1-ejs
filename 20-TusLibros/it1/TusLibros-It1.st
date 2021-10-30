!classDefinition: #CartTest category: 'TusLibros-It1'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-It1'!

!CartTest methodsFor: 'tests' stamp: 'AF 10/30/2021 13:05:54'!
test01NewCartIsEmpty

	| cart catalog |

	catalog _ OrderedCollection new.
	cart _ Cart with: catalog.
	
	self assert: cart isEmpty.! !

!CartTest methodsFor: 'tests' stamp: 'AF 10/30/2021 13:38:42'!
test02CartWithABookShouldNotBeEmpty

	| cart book catalog |
	
	book _ self bookGrowingOOSoft.
	catalog _ OrderedCollection with:  book.
	cart _ Cart with: catalog.
	cart addBook: book quantity: 1.
	
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'AF 10/30/2021 13:39:26'!
test03CartIncludesBookAfterAdding

	| cart book catalog |

	book _ self bookGrowingOOSoft.
	catalog _ OrderedCollection with:  book.
	cart _ Cart with: catalog.
	cart addBook: book quantity: 1.
	
	self assert: (cart includes: book).! !

!CartTest methodsFor: 'tests' stamp: 'AF 10/30/2021 13:41:39'!
test04CantAddBookNotIncludedInCatalog

	| cart catalog |
	
	catalog _ OrderedCollection new.
	cart _ Cart with: catalog.
	
	self assertAdding: self bookGrowingOOSoft 
		withQuantity: 1 
		to: cart 
		raises: Cart bookNotInCatalogErrorDescription.! !

!CartTest methodsFor: 'tests' stamp: 'AF 10/30/2021 13:41:53'!
test05CartIncludesAllOccurrencesOfBookAfterAdding

	| cart book catalog quantity |
	
	book _ self bookGrowingOOSoft.
	catalog _ OrderedCollection with:  book.
	quantity _ 5.
	
	cart _ Cart with: catalog.
	cart addBook: book quantity: quantity.
	
	self assert: quantity equals: (cart occurrencesOf: book).! !

!CartTest methodsFor: 'tests' stamp: 'AF 10/30/2021 13:42:05'!
test06CartContainsTotalOccurrencesAfterAddingItMultipleTimes

	"paso de una pero lo dejamos porque no sabiamos como funcioanaba el bag"
	| cart book catalog quantity |
	
	book _ self bookGrowingOOSoft.
	catalog _ OrderedCollection with:  book.
	quantity _ 5.
	
	cart _ Cart with: catalog.
	cart addBook: book quantity: quantity.
	cart addBook: book quantity: quantity.
	
	self assert: (quantity*2) equals: (cart occurrencesOf: book).! !

!CartTest methodsFor: 'tests' stamp: 'AF 10/30/2021 13:43:13'!
test07CantAddBookWithZeroQuantity

	| cart book catalog |
	book _ self bookGrowingOOSoft.
	catalog _ OrderedCollection with: book.
	cart _ Cart with: catalog.
	
	self assertAdding: book 
		withQuantity: 0 
		to: cart 
		raises: Cart invalidQuantityErrorDescription.! !

!CartTest methodsFor: 'tests' stamp: 'AF 10/30/2021 13:43:40'!
test08CantAddBookWithNegativeQuantity

	| cart book catalog |
	book _ self bookGrowingOOSoft.
	catalog _ OrderedCollection with: book.
	cart _ Cart with: catalog.
	
	self assertAdding: book 
		withQuantity: -1 
		to: cart 
		raises: Cart invalidQuantityErrorDescription.! !


!CartTest methodsFor: 'assertions' stamp: 'AF 10/30/2021 13:30:06'!
assertAdding: aBook withQuantity: aQuantity to: aCart raises: anErrorMessage.

	self should: [ aCart addBook: aBook quantity: aQuantity ]
		raise: Error -  MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anErrorMessage equals: anError messageText .
			self deny: (aCart includes: aBook) ] ! !


!CartTest methodsFor: 'books' stamp: 'AF 10/30/2021 13:39:01'!
bookGrowingOOSoft
	^'growing object-oriented software guided by tests'.! !


!classDefinition: #Cart category: 'TusLibros-It1'!
Object subclass: #Cart
	instanceVariableNames: 'contents catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-It1'!

!Cart methodsFor: 'accessing' stamp: 'AF 10/30/2021 12:37:38'!
occurrencesOf: aBook

	^contents occurrencesOf: aBook.! !


!Cart methodsFor: 'adding' stamp: 'AF 10/30/2021 13:32:24'!
addBook: aBook quantity: aQuantity 
	
	self assertBookIncludedInCatalog: aBook.
	self assertQuantityIsPositive: aQuantity.
	
	contents add: aBook withOccurrences: aQuantity .! !


!Cart methodsFor: 'assertions' stamp: 'AF 10/30/2021 13:31:25'!
assertBookIncludedInCatalog: aBook

	^ (catalog includes: aBook) ifFalse: [ self error: self class bookNotInCatalogErrorDescription ]! !

!Cart methodsFor: 'assertions' stamp: 'AF 10/30/2021 13:34:59'!
assertQuantityIsPositive: aQuantity

	^aQuantity <= 0 ifTrue: [ self error: self class invalidQuantityErrorDescription ]! !


!Cart methodsFor: 'initialization' stamp: 'AF 10/30/2021 13:35:46'!
initializeWith: aCatalog 
	
	catalog _ aCatalog.
	contents _ Bag new.! !


!Cart methodsFor: 'testing' stamp: 'AF 10/28/2021 21:13:47'!
includes: aBook 
	
	^contents includes: aBook.! !

!Cart methodsFor: 'testing' stamp: 'AF 10/28/2021 21:09:53'!
isEmpty
	
	^contents isEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros-It1'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'AF 10/28/2021 21:25:46'!
with: aCatalog
	
	^self new initializeWith: aCatalog ! !


!Cart class methodsFor: 'error descriptions' stamp: 'AF 10/28/2021 21:30:29'!
bookNotInCatalogErrorDescription
	
	^'Book not in catalog'! !

!Cart class methodsFor: 'error descriptions' stamp: 'AF 10/30/2021 12:54:55'!
invalidQuantityErrorDescription
	
	^'cant add a book with less than 1 quantity'! !
