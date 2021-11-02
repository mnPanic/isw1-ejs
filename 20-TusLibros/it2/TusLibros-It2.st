!classDefinition: #CartTest category: 'TusLibros-It1'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-It1'!

!CartTest methodsFor: 'tests' stamp: 'IAR 11/1/2021 19:40:06'!
test01NewCartIsEmpty

	| cart catalog |

	catalog _ OrderedCollection new.
	cart _ Cart acceptingProductsFrom: catalog.
	
	self assert: cart isEmpty.! !

!CartTest methodsFor: 'tests' stamp: 'IAR 11/1/2021 19:48:51'!
test02CartWithABookShouldNotBeEmpty

	| cart book catalog |
	
	book _ self bookGrowingOOSoft.
	catalog _ OrderedCollection with: book.
	cart _ Cart acceptingProductsFrom: catalog.
	cart add: 1 of: book.
	
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'IAR 11/1/2021 19:49:03'!
test03CartIncludesBookAfterAdding

	| cart book catalog |

	book _ self bookGrowingOOSoft.
	catalog _ OrderedCollection with: book.
	cart _ Cart acceptingProductsFrom: catalog.
	cart add: 1 of: book.
	
	self assert: (cart includes: book).! !

!CartTest methodsFor: 'tests' stamp: 'IAR 11/1/2021 19:40:06'!
test04CantAddBookNotIncludedInCatalog

	| cart catalog |
	
	catalog _ OrderedCollection new.
	cart _ Cart acceptingProductsFrom: catalog.
	
	self assertAdding: self bookGrowingOOSoft 
		withQuantity: 1 
		to: cart 
		raises: Cart bookNotInCatalogErrorDescription.! !

!CartTest methodsFor: 'tests' stamp: 'IAR 11/1/2021 19:49:25'!
test05CartIncludesAllOccurrencesOfBookAfterAdding

	| cart book catalog quantity |
	
	book _ self bookGrowingOOSoft.
	catalog _ OrderedCollection with: book.
	quantity _ 5.
	
	cart _ Cart acceptingProductsFrom: catalog.
	cart add: quantity of: book.
	
	self assert: quantity equals: (cart occurrencesOf: book).! !

!CartTest methodsFor: 'tests' stamp: 'IAR 11/1/2021 19:49:43'!
test06CartContainsTotalOccurrencesAfterAddingItMultipleTimes

	"paso de una pero lo dejamos porque no sabiamos como funcioanaba el bag"
	| cart book catalog quantity |
	
	book _ self bookGrowingOOSoft.
	catalog _ OrderedCollection with: book.
	quantity _ 5.
	
	cart _ Cart acceptingProductsFrom: catalog.
	cart add: quantity of: book.
	cart add: quantity of: book.
	
	self assert: (quantity*2) equals: (cart occurrencesOf: book).! !

!CartTest methodsFor: 'tests' stamp: 'IAR 11/1/2021 19:43:01'!
test07CantAddBookWithZeroQuantity

	| cart book catalog |
	book _ self bookGrowingOOSoft.
	catalog _ OrderedCollection with: book.
	cart _ Cart acceptingProductsFrom: catalog.
	
	self assertAdding: book 
		withQuantity: 0 
		to: cart 
		raises: Cart invalidQuantityErrorDescription.! !

!CartTest methodsFor: 'tests' stamp: 'IAR 11/1/2021 19:43:08'!
test08CantAddBookWithNegativeQuantity

	| cart book catalog |
	book _ self bookGrowingOOSoft.
	catalog _ OrderedCollection with: book.
	cart _ Cart acceptingProductsFrom: catalog.
	
	self assertAdding: book 
		withQuantity: -1 
		to: cart 
		raises: Cart invalidQuantityErrorDescription.! !


!CartTest methodsFor: 'assertions' stamp: 'IAR 11/1/2021 19:50:10'!
assertAdding: aBook withQuantity: aQuantity to: aCart raises: anErrorMessage.

	self should: [ aCart add: aQuantity of: aBook ]
		raise: Error -  MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anErrorMessage equals: anError messageText .
			self deny: (aCart includes: aBook) ] ! !


!CartTest methodsFor: 'books' stamp: 'IAR 11/1/2021 19:50:18'!
bookGrowingOOSoft

	^'growing object-oriented software guided by tests'.! !


!classDefinition: #CheckoutTest category: 'TusLibros-It1'!
TestCase subclass: #CheckoutTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-It1'!

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/1/2021 19:40:06'!
createCart
	
	^ Cart acceptingProductsFrom: self defaultCatalog.! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/1/2021 20:24:51'!
createCashier
	
	^ Cashier sourcingPricesFrom: self defaultPriceList.! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/1/2021 20:21:51'!
defaultCatalog
	
	^ Set
		with: self productSoldByTheStore
		with: self otherProductSoldByTheStore.! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/1/2021 20:31:57'!
defaultPriceList
	
	^ Dictionary new add: (self productSoldByTheStore -> self productSoldByTheStorePrice);
		add: (self otherProductSoldByTheStore -> self otherProductSoldByTheStorePrice); yourself! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/1/2021 20:21:24'!
otherProductSoldByTheStore

	^ 'Platero y Yo'.! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/1/2021 20:21:31'!
otherProductSoldByTheStorePrice

	^ 50.! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/1/2021 19:37:08'!
productSoldByTheStore
	
	^ 'validBook'.! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/1/2021 20:00:33'!
productSoldByTheStorePrice
	
	^ 100.! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/1/2021 19:34:53'!
test01

	| cart cashier |
	cart _ self createCart. 
	cashier _ self createCashier.
	
	self should: [ cashier checkout: cart ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | self assert: Cashier emptyCartErrorDescription equals: anError messageText ].! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/1/2021 20:03:33'!
test02

	| cart cashier |
	cart _ self createCart.
	cashier _ self createCashier.
	
	cart add: 1 of: self productSoldByTheStore.
	
	self assert: self productSoldByTheStorePrice equals: (cashier checkout: cart).! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/1/2021 20:05:42'!
test03

	| cart cashier quantity |
	cart _ self createCart.
	cashier _ self createCashier.
	quantity _ 5.
	
	cart add: quantity of: self productSoldByTheStore.
	
	self assert: (quantity * self productSoldByTheStorePrice) equals: (cashier checkout: cart).! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/1/2021 20:21:06'!
test04

	| cart cashier quantity |
	cart _ self createCart.
	cashier _ self createCashier.
	quantity _ 5.
	
	cart add: quantity of: self productSoldByTheStore.
	cart add: 1 of: self otherProductSoldByTheStore.

	
	self assert: 550 equals: (cashier checkout: cart).! !


!classDefinition: #Cart category: 'TusLibros-It1'!
Object subclass: #Cart
	instanceVariableNames: 'contents catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-It1'!

!Cart methodsFor: 'accessing' stamp: 'AF 10/30/2021 12:37:38'!
occurrencesOf: aBook

	^contents occurrencesOf: aBook.! !


!Cart methodsFor: 'adding' stamp: 'IAR 11/1/2021 19:22:53'!
add: aQuantity of: aProduct 
	
	self assertBookIncludedInCatalog: aProduct.
	self assertQuantityIsPositive: aQuantity.
	
	contents add: aProduct withOccurrences: aQuantity .! !


!Cart methodsFor: 'assertions' stamp: 'AF 10/30/2021 13:31:25'!
assertBookIncludedInCatalog: aBook

	^ (catalog includes: aBook) ifFalse: [ self error: self class bookNotInCatalogErrorDescription ]! !

!Cart methodsFor: 'assertions' stamp: 'IAR 11/1/2021 19:50:44'!
assertQuantityIsPositive: aQuantity

	^aQuantity strictlyPositive ifFalse: [ self error: self class invalidQuantityErrorDescription ]! !


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


!Cart methodsFor: 'as yet unclassified' stamp: 'IAR 11/1/2021 20:36:23'!
totalPriceXX: aPriceList

	^ contents sum: [ :aProduct | aPriceList at: aProduct 
		ifAbsent: [ self error: 'Producto no en catalogo' ] ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros-It1'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'IAR 11/1/2021 19:40:06'!
acceptingProductsFrom: aCatalog
	
	^self new initializeWith: aCatalog ! !


!Cart class methodsFor: 'error descriptions' stamp: 'AF 10/28/2021 21:30:29'!
bookNotInCatalogErrorDescription
	
	^'Book not in catalog'! !

!Cart class methodsFor: 'error descriptions' stamp: 'AF 10/30/2021 12:54:55'!
invalidQuantityErrorDescription
	
	^'cant add a book with less than 1 quantity'! !


!classDefinition: #Cashier category: 'TusLibros-It1'!
Object subclass: #Cashier
	instanceVariableNames: 'priceList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-It1'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'IAR 11/1/2021 20:33:29'!
checkout: aCart 
	
	aCart isEmpty ifTrue: [ self error: self class emptyCartErrorDescription ].
	^ aCart totalPriceXX: priceList.! !


!Cashier methodsFor: 'initialization' stamp: 'IAR 11/1/2021 20:33:07'!
initializeSourcingPricesFrom: aPriceList 
	
	priceList := aPriceList.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros-It1'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error descriptions' stamp: 'IAR 11/1/2021 19:39:22'!
emptyCartErrorDescription
	
	^ 'Cannot checkout empty cart'.! !


!Cashier class methodsFor: 'instance creation' stamp: 'IAR 11/1/2021 20:32:46'!
sourcingPricesFrom: aPriceList 

	^self new initializeSourcingPricesFrom: aPriceList ! !
