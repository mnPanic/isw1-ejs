!classDefinition: #CartTest category: 'TusLibros-It2'!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-It2'!

!CartTest methodsFor: 'tests' stamp: 'MP 11/2/2021 00:10:17'!
setUp

	testObjectFactory _ TestObjectFactory new.! !

!CartTest methodsFor: 'tests' stamp: 'MP 11/2/2021 00:11:04'!
test01NewCartIsEmpty

	| cart |

	cart _ testObjectFactory createCart.
	
	self assert: cart isEmpty.! !

!CartTest methodsFor: 'tests' stamp: 'MP 11/2/2021 00:11:59'!
test02CartWithABookShouldNotBeEmpty

	| cart |
	
	cart _ testObjectFactory createCart.
	cart add: testObjectFactory firstProductSoldByTheStore.
	
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'MP 11/2/2021 00:13:01'!
test03CartIncludesBookAfterAdding

	| cart |

	cart _ testObjectFactory createCart.
	cart add: testObjectFactory firstProductSoldByTheStore .
	
	self assert: (cart includes: testObjectFactory firstProductSoldByTheStore).! !

!CartTest methodsFor: 'tests' stamp: 'MP 11/2/2021 00:25:10'!
test04CantAddBookNotIncludedInCatalog

	| cart |
	
	cart _ testObjectFactory createCart.
	
	self assertAdding: testObjectFactory productNotSoldByTheStore
		withQuantity: 1 
		to: cart 
		raises: Cart productNotInCatalogErrorDescription.! !

!CartTest methodsFor: 'tests' stamp: 'MP 11/2/2021 00:15:34'!
test05CartIncludesAllOccurrencesOfBookAfterAdding

	| cart quantity |

	cart _ testObjectFactory createCart.
	quantity _ 5.
	cart add: quantity of: testObjectFactory firstProductSoldByTheStore.
	
	self assert: quantity equals: (cart occurrencesOf: testObjectFactory firstProductSoldByTheStore).! !

!CartTest methodsFor: 'tests' stamp: 'MP 11/2/2021 00:19:27'!
test06CantAddBookWithZeroQuantity

	| cart |
	cart _ testObjectFactory createCart.
	
	self assertAdding: testObjectFactory secondProductSoldByTheStore 
		withQuantity: 0
		to: cart
		raises: Cart invalidQuantityErrorDescription.! !

!CartTest methodsFor: 'tests' stamp: 'MP 11/2/2021 00:17:33'!
test07CantAddBookWithNegativeQuantity

	| cart |
	cart _ testObjectFactory createCart.

	self assertAdding: testObjectFactory firstProductSoldByTheStore
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


!classDefinition: #CheckoutTest category: 'TusLibros-It2'!
TestCase subclass: #CheckoutTest
	instanceVariableNames: 'testObjectFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-It2'!

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'MP 11/1/2021 23:56:29'!
setUp

	testObjectFactory _ TestObjectFactory new.! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'MP 11/2/2021 01:18:30'!
test01

	| cart cashier |
	cart _ testObjectFactory createCart. 
	cashier _ testObjectFactory createCashier.
	
	self should: [ cashier 
				checkout: cart 
				charging: testObjectFactory validCard 
				on: testObjectFactory fixedDate ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | self assert: Cashier emptyCartErrorDescription equals: anError messageText ].! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'MP 11/2/2021 01:40:45'!
test02

	| cart cashier |
	cart _ testObjectFactory createCart.
	cashier _ testObjectFactory createCashier.
	
	cart add: testObjectFactory firstProductSoldByTheStore.
	
	self
		assert: testObjectFactory firstProductSoldByTheStorePrice
		equals: (cashier 
			checkout: cart 
			charging: testObjectFactory validCard 
			on: testObjectFactory fixedDate).! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'MP 11/2/2021 01:18:52'!
test03

	| cart cashier quantity |
	cart _ testObjectFactory createCart.
	cashier _ testObjectFactory createCashier.
	quantity _ 5.
	
	cart add: quantity of: testObjectFactory firstProductSoldByTheStore.
	
	self 
		assert: (quantity * testObjectFactory firstProductSoldByTheStorePrice)
		equals: (cashier 
			checkout: cart 
			charging: testObjectFactory validCard 
			on: testObjectFactory fixedDate).! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'MP 11/2/2021 01:18:55'!
test04

	| cart cashier quantity expectedRecepit |
	cart _ testObjectFactory createCart.
	cashier _ testObjectFactory createCashier.
	quantity _ 5.
	
	cart add: quantity of: testObjectFactory firstProductSoldByTheStore.
	cart add: testObjectFactory secondProductSoldByTheStore.
	
	expectedRecepit _
		(quantity * testObjectFactory firstProductSoldByTheStorePrice) +
		(testObjectFactory secondProductSoldByTheStorePrice).
	
	self 
		assert: expectedRecepit
		equals: (cashier 
			checkout: cart 
			charging: testObjectFactory validCard 
			on: testObjectFactory fixedDate).! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'MP 11/2/2021 01:13:32'!
test05

	| cart cashier |
	cart _ testObjectFactory createCart.
	cashier _ testObjectFactory createCashier.
	cart add: testObjectFactory firstProductSoldByTheStore.
	
	"TODO: assert de cosas que no tienen que pasar"
	self should: [ cashier 
				checkout: cart 
				charging: testObjectFactory expiredCard 
				on: testObjectFactory fixedDate ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException | self assert: Cashier expiredCardErrorDescription equals: anException messageText ].! !

!CheckoutTest methodsFor: 'as yet unclassified' stamp: 'MP 11/2/2021 01:25:51'!
test06

	| cart cashier |
	cart _ testObjectFactory createCart.
	cashier _ testObjectFactory createCashier.
	cart add: testObjectFactory firstProductSoldByTheStore.
	
	"TODO: assert de cosas que no tienen que pasar"
	self should: [ cashier 
				checkout: cart 
				charging: testObjectFactory invalidNumberCard 
				on: testObjectFactory fixedDate ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException | self assert: Cashier invalidCardNumberErrorDescription equals: anException messageText ].! !


!classDefinition: #Card category: 'TusLibros-It2'!
Object subclass: #Card
	instanceVariableNames: 'expirationMonthOfYear number'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-It2'!

!Card methodsFor: 'as yet unclassified' stamp: 'MP 11/2/2021 01:36:22'!
initializeWithNumber: aCardNumber expiringAt: anExpirationDate

	expirationMonthOfYear _ anExpirationDate.
	number _ aCardNumber.! !

!Card methodsFor: 'as yet unclassified' stamp: 'MP 11/2/2021 01:10:53'!
isExpiredOn: aDate

	^ aDate > expirationMonthOfYear.! !

!Card methodsFor: 'as yet unclassified' stamp: 'MP 11/2/2021 01:40:36'!
number

	^ number.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Card class' category: 'TusLibros-It2'!
Card class
	instanceVariableNames: ''!

!Card class methodsFor: 'instance creation' stamp: 'MP 11/2/2021 01:32:16'!
withNumber: aCardNumber expiringAt: anExpiryDate 

	^self new initializeWithNumber: aCardNumber expiringAt: anExpiryDate ! !


!classDefinition: #Cart category: 'TusLibros-It2'!
Object subclass: #Cart
	instanceVariableNames: 'contents catalog totalPrice'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-It2'!

!Cart methodsFor: 'accessing' stamp: 'MP 11/2/2021 00:30:46'!
occurrencesOf: aBook

	^ contents occurrencesOf: aBook.! !

!Cart methodsFor: 'accessing' stamp: 'MP 11/2/2021 00:30:36'!
totalPrice

	^ totalPrice.! !


!Cart methodsFor: 'adding' stamp: 'MP 11/2/2021 00:39:55'!
add: product 
	
	self add: 1 of: product.! !

!Cart methodsFor: 'adding' stamp: 'MP 11/2/2021 00:39:35'!
add: quantity of: product 
	
	self assertProductIncludedInCatalog: product.
	self assertQuantityIsPositive: quantity.

	contents add: product withOccurrences: quantity .

	totalPrice _ totalPrice + (self priceOf: product) * quantity.! !


!Cart methodsFor: 'assertions' stamp: 'MP 11/2/2021 00:39:46'!
assertProductIncludedInCatalog: aProduct

	^ (catalog includesKey: aProduct) ifFalse: [ self error: self class productNotInCatalogErrorDescription ].! !

!Cart methodsFor: 'assertions' stamp: 'MP 11/2/2021 00:39:00'!
assertQuantityIsPositive: aQuantity

	^ aQuantity strictlyPositive ifFalse: [ self error: self class invalidQuantityErrorDescription ]! !


!Cart methodsFor: 'initialization' stamp: 'MP 11/2/2021 00:31:11'!
initializeWith: aCatalog 
	
	catalog _ aCatalog.
	contents _ Bag new.
	totalPrice _ 0.! !


!Cart methodsFor: 'adding - private' stamp: 'MP 11/2/2021 00:40:53'!
priceOf: product

	^ catalog at: product.! !


!Cart methodsFor: 'testing' stamp: 'MP 11/2/2021 00:40:05'!
includes: product 
	
	^contents includes: product.! !

!Cart methodsFor: 'testing' stamp: 'AF 10/28/2021 21:09:53'!
isEmpty
	
	^contents isEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros-It2'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'IAR 11/1/2021 19:40:06'!
acceptingProductsFrom: aCatalog
	
	^self new initializeWith: aCatalog ! !


!Cart class methodsFor: 'error descriptions' stamp: 'MP 11/2/2021 00:24:48'!
invalidQuantityErrorDescription
	
	^ 'cant add a book with less than 1 quantity'! !

!Cart class methodsFor: 'error descriptions' stamp: 'MP 11/2/2021 00:24:45'!
productNotInCatalogErrorDescription
	
	^ 'product not in catalog'! !


!classDefinition: #Cashier category: 'TusLibros-It2'!
Object subclass: #Cashier
	instanceVariableNames: 'priceList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-It2'!

!Cashier methodsFor: 'error descriptions' stamp: 'MP 11/2/2021 01:43:21'!
assertCard: aCreditCard isNotExpiredOn: aDate

	^ (aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self class expiredCardErrorDescription ]! !

!Cashier methodsFor: 'error descriptions' stamp: 'MP 11/2/2021 01:43:57'!
assertCardNumberIsValid: aCreditCard

	^ (aCreditCard number size < 16) ifTrue: [ self error: self class invalidCardNumberErrorDescription ]! !

!Cashier methodsFor: 'error descriptions' stamp: 'MP 11/2/2021 00:21:24'!
assertCartIsNotEmpty: aCart

	^ aCart isEmpty ifTrue: [ self error: self class emptyCartErrorDescription ]! !


!Cashier methodsFor: 'checkout' stamp: 'MP 11/2/2021 01:44:13'!
checkout: aCart charging: aCreditCard on: aDate
	
	self assertCartIsNotEmpty: aCart.
	self assertCard: aCreditCard isNotExpiredOn: aDate.
	self assertCardNumberIsValid: aCreditCard.

	^ aCart totalPrice.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros-It2'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error descriptions' stamp: 'IAR 11/1/2021 19:39:22'!
emptyCartErrorDescription
	
	^ 'Cannot checkout empty cart'.! !

!Cashier class methodsFor: 'error descriptions' stamp: 'MP 11/2/2021 00:44:36'!
expiredCardErrorDescription
	
	^ 'Cannot charge expired card'.! !

!Cashier class methodsFor: 'error descriptions' stamp: 'MP 11/2/2021 01:39:55'!
invalidCardNumberErrorDescription
	
	^ 'cannot charge a card with an invalid card number'.! !


!classDefinition: #TestObjectFactory category: 'TusLibros-It2'!
Object subclass: #TestObjectFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-It2'!

!TestObjectFactory methodsFor: 'products' stamp: 'MP 11/2/2021 00:09:21'!
defaultCatalog

	^ Dictionary new
		at: self firstProductSoldByTheStore put: self firstProductSoldByTheStorePrice;
		at: self secondProductSoldByTheStore put: self secondProductSoldByTheStorePrice;
		yourself.
! !

!TestObjectFactory methodsFor: 'products' stamp: 'MP 11/1/2021 23:48:37'!
firstProductSoldByTheStore

	"The one true way of designing systems."
	^ 'growing object-oriented software guided by tests'
! !

!TestObjectFactory methodsFor: 'products' stamp: 'MP 11/1/2021 23:46:12'!
firstProductSoldByTheStorePrice

	^ 100.! !

!TestObjectFactory methodsFor: 'products' stamp: 'MP 11/2/2021 00:14:46'!
productNotSoldByTheStore

	^ 'El Cormen.'
! !

!TestObjectFactory methodsFor: 'products' stamp: 'MP 11/1/2021 23:47:10'!
secondProductSoldByTheStore

	^ 'The Bible'.
! !

!TestObjectFactory methodsFor: 'products' stamp: 'MP 11/1/2021 23:46:37'!
secondProductSoldByTheStorePrice

	^ 50.
! !


!TestObjectFactory methodsFor: 'cards' stamp: 'MP 11/2/2021 01:31:31'!
expiredCard
	
	^ Card withNumber: '4509790000001234' expiringAt: (September of: 2021).! !

!TestObjectFactory methodsFor: 'cards' stamp: 'MP 11/2/2021 01:31:19'!
invalidNumberCard
	
	^ Card withNumber: '450979000000' expiringAt: (December of: 2021).! !

!TestObjectFactory methodsFor: 'cards' stamp: 'MP 11/2/2021 01:31:25'!
validCard
	
	^ Card withNumber: '4509790000001234' expiringAt: (December of: 2021).! !


!TestObjectFactory methodsFor: 'as yet unclassified' stamp: 'MP 11/1/2021 23:45:48'!
createCart

	^ Cart acceptingProductsFrom: self defaultCatalog.! !

!TestObjectFactory methodsFor: 'as yet unclassified' stamp: 'MP 11/1/2021 23:53:01'!
createCashier

	^ Cashier new.! !

!TestObjectFactory methodsFor: 'as yet unclassified' stamp: 'MP 11/2/2021 01:13:32'!
fixedDate

	^ November / 2 / 2021.! !
