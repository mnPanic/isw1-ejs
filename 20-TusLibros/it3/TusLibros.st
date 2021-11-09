!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

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


!classDefinition: #CheckoutTest category: 'TusLibros'!
TestCase subclass: #CheckoutTest
	instanceVariableNames: 'testObjectFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CheckoutTest methodsFor: 'assertions' stamp: 'IAR 11/3/2021 23:26:02'!
assertCheckout: aCart charging: aCard raises: anErrorMessage
	
	| cashier |
	cashier _ testObjectFactory createCashier.
	
	self should: [ cashier 
				checkout: aCart 
				charging: aCard 
				on: testObjectFactory fixedDate ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException | self assert: anErrorMessage equals: anException messageText ].! !


!CheckoutTest methodsFor: 'tests' stamp: 'MP 11/1/2021 23:56:29'!
setUp

	testObjectFactory _ TestObjectFactory new.! !

!CheckoutTest methodsFor: 'tests' stamp: 'MP 11/2/2021 02:49:58'!
test01CannotCheckoutWithEmptyCart

	self assertCheckout: testObjectFactory createCart
		charging: testObjectFactory validCard
		raises: Cashier emptyCartErrorDescription.! !

!CheckoutTest methodsFor: 'tests' stamp: 'MP 11/2/2021 01:58:14'!
test02CheckoutOfCartWithSingleItemReturnsReceiptOfItsPrice

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

!CheckoutTest methodsFor: 'tests' stamp: 'MP 11/2/2021 01:59:20'!
test03CheckoutOfCartWithItemWithMultipleOcurrencesReturnsRecepitOfItsTotalPrice

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

!CheckoutTest methodsFor: 'tests' stamp: 'MP 11/2/2021 01:59:35'!
test04CheckoutOfCartWithMultipleItemsReturnsReceiptWithASumOfTheirPrices

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

!CheckoutTest methodsFor: 'tests' stamp: 'MP 11/2/2021 02:52:02'!
test05CannotCheckoutWithExpiredCard

	self assertCheckout: testObjectFactory createCartWithSingleProduct 
		charging: testObjectFactory expiredCard
		raises: Cashier expiredCardErrorDescription.! !

!CheckoutTest methodsFor: 'tests' stamp: 'MP 11/2/2021 02:52:16'!
test06CannotCheckoutWithInvalidNumberCard

	self assertCheckout: testObjectFactory createCartWithSingleProduct 
		charging: testObjectFactory invalidNumberCard
		raises: Cashier invalidCardNumberErrorDescription.! !

!CheckoutTest methodsFor: 'tests' stamp: 'AF 11/4/2021 23:24:31'!
test07CannotCheckoutWithCardWithoutFunds

	self assertCheckout: testObjectFactory createCartWithSingleProduct
		charging: testObjectFactory cardWithoutFunds
		raises: MerchantProcessor cardWithoutFundsErrorDescription.
! !

!CheckoutTest methodsFor: 'tests' stamp: 'AF 11/4/2021 23:24:38'!
test08CannotCheckoutWithStolenCard

	self assertCheckout: testObjectFactory createCartWithSingleProduct
		charging: testObjectFactory stolenCard
		raises: MerchantProcessor stolenCardErrorDescription.! !


!classDefinition: #TusLibrosSystemFacadeTest category: 'TusLibros'!
TestCase subclass: #TusLibrosSystemFacadeTest
	instanceVariableNames: 'testObjectFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'MP 11/8/2021 20:04:40'!
defaultTusLibrosSystemFacade
	
	^self tusLibrosSystemFacadeWithClock: ManualClockXX new.! !

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'AF 11/4/2021 23:38:43'!
setUp

	testObjectFactory _ TestObjectFactory new.! !

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'MP 11/8/2021 20:20:35'!
test01CannotCreateCartWithInvalidCredentials

	| tusLibros |
	
	tusLibros _ TusLibrosSystemFacade
		authenticatingWith: testObjectFactory authSystemDenyingAllxxx
		sourcingProductsFrom: testObjectFactory defaultCatalog
		chargingThrough: testObjectFactory defaultSimulatedMP
		withClock: ManualClockXX new.
	
	self should: [ tusLibros createCartFor: testObjectFactory defaultUser authenticatedBy: testObjectFactory defaultPassword ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TusLibrosSystemFacade invalidCredentialsErrorDescription.! !

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/6/2021 00:01:36'!
test02CartCreatedWithValidCredentialsIsEmpty

	| tusLibros cartId |
	
	tusLibros _ self defaultTusLibrosSystemFacade.
	cartId _ tusLibros createCartFor: testObjectFactory defaultUser authenticatedBy: testObjectFactory defaultPassword.
	
	self assert: (tusLibros listCart: cartId) isEmpty.! !

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/6/2021 00:10:29'!
test03CanAddMultipleItemsToACartXXXXXx

	| tusLibros expectedCartContents quantity firstCartId |
	
	tusLibros _ self defaultTusLibrosSystemFacade.
	firstCartId _ tusLibros createCartFor: testObjectFactory defaultUser authenticatedBy: testObjectFactory defaultPassword.
	quantity _ 1.
	
	tusLibros add: quantity of: testObjectFactory firstProductSoldByTheStore to: firstCartId.
	
	expectedCartContents _ Bag new
		add: testObjectFactory firstProductSoldByTheStore
		withOccurrences: quantity;
		yourself.
	
	self assert: expectedCartContents equals: (tusLibros listCart: firstCartId).! !

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/6/2021 00:10:36'!
test04CanListMultipleCartsXXXXx

	| tusLibros expectedCartContents quantity firstCartId secondCartId |
	
	tusLibros _ self defaultTusLibrosSystemFacade.
	firstCartId _ tusLibros createCartFor: testObjectFactory defaultUser authenticatedBy: testObjectFactory defaultPassword.
	secondCartId _ tusLibros createCartFor: 'nacho' authenticatedBy: 'elRetorico'.
	quantity _ 1.
	
	tusLibros add: quantity of: testObjectFactory firstProductSoldByTheStore to: firstCartId.
	
	expectedCartContents _ Bag new
		add: testObjectFactory firstProductSoldByTheStore
		withOccurrences: quantity;
		yourself.
	
	self assert: expectedCartContents equals: (tusLibros listCart: firstCartId).
	self assert: (tusLibros listCart: secondCartId) isEmpty.! !

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/6/2021 00:10:21'!
test05CannotAddProductToCartWithInvalidId

	| tusLibros invalidId |
	
	tusLibros _ self defaultTusLibrosSystemFacade.
	invalidId _ 0.
	self should: [ tusLibros add: 1 of: testObjectFactory firstProductSoldByTheStore to: invalidId ]
		raise: Error - MessageNotUnderstood
		withMessageText: TusLibrosSystemFacade invalidCartIdErrorDescription.
	
! !

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/6/2021 00:09:55'!
test06CannotListCartWithInvalidId

	| tusLibros invalidId |
	
	tusLibros _ self defaultTusLibrosSystemFacade.
	invalidId _ 0.
	self should: [ tusLibros listCart: invalidId ]
		raise: Error - MessageNotUnderstood
		withMessageText: TusLibrosSystemFacade invalidCartIdErrorDescription.
	
! !

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/6/2021 00:28:09'!
test07CannotCheckoutInvalidCartId

	| tusLibros invalidId |
	
	tusLibros _ self defaultTusLibrosSystemFacade.
	invalidId _ 0.
	self should: [ tusLibros
			checkout: invalidId
			charging: testObjectFactory validCard
			on: testObjectFactory fixedDate ]
		raise: Error - MessageNotUnderstood
		withMessageText: TusLibrosSystemFacade invalidCartIdErrorDescription.
	
! !

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/6/2021 00:40:52'!
test08

	| tusLibros cartId transactionId |
	
	"TODO: Assertar observando mediante listPurchases y no mediante isNotNil."
	
	tusLibros _ self defaultTusLibrosSystemFacade.
	cartId _ tusLibros
		createCartFor: testObjectFactory defaultUser
		authenticatedBy: testObjectFactory defaultPassword. 

	transactionId _ tusLibros
		checkout: cartId
		charging: testObjectFactory validCard
		on: testObjectFactory fixedDate.

	self deny: transactionId isNil. 

! !

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'IAR 11/6/2021 00:41:37'!
test09

	| tusLibros cartId firstTransactionId secondTransactionId |
	
	"TODO: Cambiar la generacion de las transactionIds."
	
	tusLibros _ self defaultTusLibrosSystemFacade.
	cartId _ tusLibros
		createCartFor: testObjectFactory defaultUser
		authenticatedBy: testObjectFactory defaultPassword. 

	firstTransactionId _ tusLibros
		checkout: cartId
		charging: testObjectFactory validCard
		on: testObjectFactory fixedDate.
	
	secondTransactionId _ tusLibros
		checkout: cartId
		charging: testObjectFactory validCard
		on: testObjectFactory fixedDate.
		
	self assert: firstTransactionId isNotEqualTo: secondTransactionId.

! !

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'MP 11/8/2021 20:10:18'!
test10

	| tusLibros cartId clock |
	
	clock _ ManualClockXX new.
	tusLibros _ self tusLibrosSystemFacadeWithClock: clock.
	cartId _ tusLibros
		createCartFor: testObjectFactory defaultUser
		authenticatedBy: testObjectFactory defaultPassword. 

	clock incrementTimeBy: 30.

	self should: [ tusLibros listCart: cartId ]
		raise: Error - MessageNotUnderstood
		withMessageText: TusLibrosSystemFacade expiredCartErrorDescription.

! !

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'MP 11/8/2021 20:17:28'!
test11

	| tusLibros clock expiredCartId nonExpiredCartId |
	
	clock _ ManualClockXX new.
	tusLibros _ self tusLibrosSystemFacadeWithClock: clock.
	
	expiredCartId _ tusLibros
		createCartFor: testObjectFactory defaultUser
		authenticatedBy: testObjectFactory defaultPassword. 

	clock incrementTimeBy: 15.

	nonExpiredCartId _ tusLibros
		createCartFor: testObjectFactory defaultUser
		authenticatedBy: testObjectFactory defaultPassword. 

	clock incrementTimeBy: 15.

	self should: [ tusLibros listCart: expiredCartId ]
		raise: Error - MessageNotUnderstood
		withMessageText: TusLibrosSystemFacade expiredCartErrorDescription.

	self assert: (tusLibros listCart: nonExpiredCartId) isEmpty.

! !

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'MP 11/8/2021 20:26:49'!
test12

	| tusLibros clock cartId |
	
	clock _ ManualClockXX new.
	tusLibros _ self tusLibrosSystemFacadeWithClock: clock.
	
	cartId _ tusLibros
		createCartFor: testObjectFactory defaultUser
		authenticatedBy: testObjectFactory defaultPassword. 

	clock incrementTimeBy: 15.

	tusLibros listCart: cartId.

	clock incrementTimeBy: 15.

	self shouldnt: [ tusLibros listCart: cartId ] raise: Error.

! !

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'MP 11/8/2021 20:27:32'!
test13

	| tusLibros clock cartId |
	
	clock _ ManualClockXX new.
	tusLibros _ self tusLibrosSystemFacadeWithClock: clock.
	
	cartId _ tusLibros
		createCartFor: testObjectFactory defaultUser
		authenticatedBy: testObjectFactory defaultPassword. 

	clock incrementTimeBy: 30.

	self should: [ tusLibros add: 1 of: testObjectFactory firstProductSoldByTheStore to: cartId ]
		raise: Error - MessageNotUnderstood
		withMessageText: TusLibrosSystemFacade expiredCartErrorDescription.

! !

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'MP 11/8/2021 20:30:28'!
test14

	| tusLibros clock cartId |
	
	clock _ ManualClockXX new.
	tusLibros _ self tusLibrosSystemFacadeWithClock: clock.
	
	cartId _ tusLibros
		createCartFor: testObjectFactory defaultUser
		authenticatedBy: testObjectFactory defaultPassword. 

	clock incrementTimeBy: 30.

	self should: [ tusLibros checkout: cartId charging: testObjectFactory validCard on: testObjectFactory fixedDate ]
		raise: Error - MessageNotUnderstood
		withMessageText: TusLibrosSystemFacade expiredCartErrorDescription.

! !

!TusLibrosSystemFacadeTest methodsFor: 'as yet unclassified' stamp: 'MP 11/8/2021 20:05:22'!
tusLibrosSystemFacadeWithClock: aClock
	
	^TusLibrosSystemFacade
		authenticatingWith: testObjectFactory authSystemAllowingAllxxx
		sourcingProductsFrom: testObjectFactory defaultCatalog
		chargingThrough: testObjectFactory defaultSimulatedMP
		withClock: aClock.! !


!TusLibrosSystemFacadeTest methodsFor: 'assertions' stamp: 'IAR 11/6/2021 00:37:44'!
assert: expected isNotEqualTo: actual 
	
	self deny: expected = actual.! !


!classDefinition: #Card category: 'TusLibros'!
Object subclass: #Card
	instanceVariableNames: 'expirationMonthOfYear number'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Card methodsFor: 'accessing' stamp: 'MP 11/2/2021 01:40:36'!
number

	^ number.! !


!Card methodsFor: 'initialization' stamp: 'MP 11/2/2021 01:36:22'!
initializeWithNumber: aCardNumber expiringAt: anExpirationDate

	expirationMonthOfYear _ anExpirationDate.
	number _ aCardNumber.! !


!Card methodsFor: 'testing' stamp: 'MP 11/2/2021 01:10:53'!
isExpiredOn: aDate

	^ aDate > expirationMonthOfYear.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Card class' category: 'TusLibros'!
Card class
	instanceVariableNames: ''!

!Card class methodsFor: 'instance creation' stamp: 'MP 11/2/2021 02:55:39'!
withNumber: aCardNumber expiringAt: anExpirationDate 

	^ self new initializeWithNumber: aCardNumber expiringAt: anExpirationDate.! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'contents catalog totalPrice'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'accessing' stamp: 'AF 11/5/2021 00:29:58'!
contents

	^contents copy.! !

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

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'MP 11/2/2021 02:55:49'!
acceptingProductsFrom: aCatalog
	
	^ self new initializeWith: aCatalog.! !


!Cart class methodsFor: 'error descriptions' stamp: 'MP 11/2/2021 00:24:48'!
invalidQuantityErrorDescription
	
	^ 'cant add a book with less than 1 quantity'! !

!Cart class methodsFor: 'error descriptions' stamp: 'MP 11/2/2021 00:24:45'!
productNotInCatalogErrorDescription
	
	^ 'product not in catalog'! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'assertions' stamp: 'MP 11/2/2021 01:43:21'!
assertCard: aCreditCard isNotExpiredOn: aDate

	^ (aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self class expiredCardErrorDescription ]! !

!Cashier methodsFor: 'assertions' stamp: 'MP 11/2/2021 02:57:21'!
assertCardNumberIsValid: aCreditCard

	^ (aCreditCard number size ~= self validCardNumberSize) ifTrue: [ self error: self class invalidCardNumberErrorDescription ]! !

!Cashier methodsFor: 'assertions' stamp: 'MP 11/2/2021 00:21:24'!
assertCartIsNotEmpty: aCart

	^ aCart isEmpty ifTrue: [ self error: self class emptyCartErrorDescription ]! !

!Cashier methodsFor: 'assertions' stamp: 'MP 11/2/2021 02:56:54'!
validCardNumberSize

	^ 16! !


!Cashier methodsFor: 'checkout' stamp: 'MP 11/2/2021 02:26:00'!
checkout: aCart charging: aCreditCard on: aDate

	| totalPrice |
	self assertCartIsNotEmpty: aCart.
	self assertCard: aCreditCard isNotExpiredOn: aDate.
	self assertCardNumberIsValid: aCreditCard.

	totalPrice _ aCart totalPrice.
	
	merchantProcessor charge: totalPrice to: aCreditCard.
	
	^ totalPrice
! !


!Cashier methodsFor: 'initialization' stamp: 'MP 11/2/2021 02:53:45'!
initializeWithMerchantProcessor: aMerchantProcessor 

	merchantProcessor _ aMerchantProcessor.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
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


!Cashier class methodsFor: 'instance creation' stamp: 'IAR 11/5/2021 23:48:20'!
withMerchantProcessor: aMerchantProcessor 

	^self new initializeWithMerchantProcessor: aMerchantProcessor.! !


!classDefinition: #ManualClockXX category: 'TusLibros'!
Object subclass: #ManualClockXX
	instanceVariableNames: 'time'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ManualClockXX methodsFor: 'as yet unclassified' stamp: 'MP 11/8/2021 20:10:02'!
incrementTimeBy: aNumber

	time _ time + aNumber.! !

!ManualClockXX methodsFor: 'as yet unclassified' stamp: 'MP 11/8/2021 20:10:36'!
initialize

	time _ 0.! !

!ManualClockXX methodsFor: 'as yet unclassified' stamp: 'MP 11/8/2021 20:08:01'!
now

	^ time! !


!classDefinition: #MerchantProcessor category: 'TusLibros'!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessor methodsFor: 'payment processing' stamp: 'AF 11/4/2021 23:23:33'!
charge: anAmount to: aCreditCard

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessor class' category: 'TusLibros'!
MerchantProcessor class
	instanceVariableNames: ''!

!MerchantProcessor class methodsFor: 'error descriptions' stamp: 'AF 11/4/2021 23:23:08'!
cardWithoutFundsErrorDescription

	^ 'card has no funds'! !

!MerchantProcessor class methodsFor: 'error descriptions' stamp: 'AF 11/4/2021 23:23:13'!
stolenCardErrorDescription
	
	^ 'stolen card'.! !


!classDefinition: #SimulatedMP category: 'TusLibros'!
MerchantProcessor subclass: #SimulatedMP
	instanceVariableNames: 'noFundsCardNumber stolenCardNumber'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!SimulatedMP methodsFor: 'assertions' stamp: 'MP 11/2/2021 02:58:50'!
assertCardHasFunds: aCreditCard

	^ (self hasNoFunds: aCreditCard) ifTrue: [ self error: self class cardWithoutFundsErrorDescription ]! !

!SimulatedMP methodsFor: 'assertions' stamp: 'MP 11/2/2021 02:59:09'!
assertCardIsntStolen: aCreditCard

	^ (self isStolen: aCreditCard) ifTrue: [ self error: self class stolenCardErrorDescription ]! !

!SimulatedMP methodsFor: 'assertions' stamp: 'MP 11/2/2021 02:58:50'!
hasNoFunds: aCreditCard

	^ aCreditCard number = noFundsCardNumber! !

!SimulatedMP methodsFor: 'assertions' stamp: 'MP 11/2/2021 02:59:09'!
isStolen: aCreditCard

	^ aCreditCard number = stolenCardNumber! !


!SimulatedMP methodsFor: 'payment processing' stamp: 'MP 11/2/2021 02:33:15'!
charge: anAmount to: aCreditCard

	self assertCardHasFunds: aCreditCard.
	self assertCardIsntStolen: aCreditCard.! !


!SimulatedMP methodsFor: 'initialization' stamp: 'MP 11/2/2021 02:29:44'!
initializeWithNoFundsCard: aNoFundsCardNumber stolenCard: aStolenCardNumber

	noFundsCardNumber _ aNoFundsCardNumber.
	stolenCardNumber _ aStolenCardNumber.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SimulatedMP class' category: 'TusLibros'!
SimulatedMP class
	instanceVariableNames: 'noFundsCardNumber'!

!SimulatedMP class methodsFor: 'instance creation' stamp: 'MP 11/2/2021 03:00:18'!
withNoFundsCard: aNoFundsCardNumber stolenCard: aStolenCardNumber

	^ self new initializeWithNoFundsCard: aNoFundsCardNumber stolenCard: aStolenCardNumber.! !


!classDefinition: #SimulatedAuthenticationSystem category: 'TusLibros'!
Object subclass: #SimulatedAuthenticationSystem
	instanceVariableNames: 'result'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!SimulatedAuthenticationSystem methodsFor: 'initialization' stamp: 'AF 11/5/2021 00:06:41'!
initializeNewSuccesful
	
	result _ true.! !

!SimulatedAuthenticationSystem methodsFor: 'initialization' stamp: 'AF 11/4/2021 23:54:38'!
initializeNewUnsuccesful
	
	result _ false.! !


!SimulatedAuthenticationSystem methodsFor: 'as yet unclassified' stamp: 'AF 11/5/2021 00:02:49'!
can: aUser beAuthenticatedBy: aPassword 
	
	^result.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SimulatedAuthenticationSystem class' category: 'TusLibros'!
SimulatedAuthenticationSystem class
	instanceVariableNames: ''!

!SimulatedAuthenticationSystem class methodsFor: 'instance creation' stamp: 'AF 11/5/2021 00:06:21'!
newSuccesful
	
	^self new initializeNewSuccesful! !

!SimulatedAuthenticationSystem class methodsFor: 'instance creation' stamp: 'AF 11/4/2021 23:54:14'!
newUnsuccesful

	^self new initializeNewUnsuccesful! !


!classDefinition: #TestObjectFactory category: 'TusLibros'!
Object subclass: #TestObjectFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TestObjectFactory methodsFor: 'cards' stamp: 'MP 11/2/2021 02:36:21'!
cardWithoutFunds
	
	^ Card withNumber: self cardWithoutFundsNumber expiringAt: self notExpiredMonthOfYear.! !

!TestObjectFactory methodsFor: 'cards' stamp: 'MP 11/2/2021 02:15:51'!
cardWithoutFundsNumber
	
	^ '4509790000006789'! !

!TestObjectFactory methodsFor: 'cards' stamp: 'MP 11/2/2021 02:36:15'!
expiredCard
	
	^ Card withNumber: '4509790000001234' expiringAt: self expiredMonthOfYear.! !

!TestObjectFactory methodsFor: 'cards' stamp: 'MP 11/2/2021 02:36:26'!
invalidNumberCard
	
	^ Card withNumber: '450979000000' expiringAt: self notExpiredMonthOfYear.! !

!TestObjectFactory methodsFor: 'cards' stamp: 'MP 11/2/2021 02:36:31'!
stolenCard
	
	^ Card withNumber: self stolenCardNumber expiringAt: self notExpiredMonthOfYear.! !

!TestObjectFactory methodsFor: 'cards' stamp: 'MP 11/2/2021 02:32:02'!
stolenCardNumber
	
	^ '4509790000000000'! !

!TestObjectFactory methodsFor: 'cards' stamp: 'MP 11/2/2021 02:36:36'!
validCard
	
	^ Card withNumber: '4509790000001234' expiringAt: self notExpiredMonthOfYear.! !


!TestObjectFactory methodsFor: 'dates' stamp: 'MP 11/2/2021 02:36:10'!
expiredMonthOfYear

	^ September of: 2021! !

!TestObjectFactory methodsFor: 'dates' stamp: 'MP 11/2/2021 01:13:32'!
fixedDate

	^ November / 2 / 2021.! !

!TestObjectFactory methodsFor: 'dates' stamp: 'MP 11/2/2021 02:36:03'!
notExpiredMonthOfYear

	^ December of: 2021! !


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


!TestObjectFactory methodsFor: 'store creation' stamp: 'MP 11/1/2021 23:45:48'!
createCart

	^ Cart acceptingProductsFrom: self defaultCatalog.! !

!TestObjectFactory methodsFor: 'store creation' stamp: 'MP 11/2/2021 02:51:39'!
createCartWithSingleProduct

	^ self createCart
		add: self firstProductSoldByTheStore;
		yourself.! !

!TestObjectFactory methodsFor: 'store creation' stamp: 'MP 11/2/2021 02:54:11'!
createCashier

	^ Cashier withMerchantProcessor: self defaultSimulatedMP.! !

!TestObjectFactory methodsFor: 'store creation' stamp: 'MP 11/2/2021 02:30:11'!
defaultSimulatedMP

	^ SimulatedMP
		withNoFundsCard: self cardWithoutFundsNumber
		stolenCard: self stolenCardNumber.
! !


!TestObjectFactory methodsFor: 'as yet unclassified' stamp: 'AF 11/4/2021 23:53:58'!
authSystemAllowingAllxxx
	
	^ SimulatedAuthenticationSystem newSuccesful.! !

!TestObjectFactory methodsFor: 'as yet unclassified' stamp: 'AF 11/4/2021 23:53:22'!
authSystemDenyingAllxxx
	
	^ SimulatedAuthenticationSystem newUnsuccesful.! !

!TestObjectFactory methodsFor: 'as yet unclassified' stamp: 'AF 11/4/2021 23:58:01'!
defaultPassword
	
	^'hunter2'! !

!TestObjectFactory methodsFor: 'as yet unclassified' stamp: 'AF 11/4/2021 23:57:41'!
defaultUser
	
	^'HAW'! !


!classDefinition: #TusLibrosSystemFacade category: 'TusLibros'!
Object subclass: #TusLibrosSystemFacade
	instanceVariableNames: 'authenticationSystem catalog carts lastCartId merchantProcessor lastTransactionId clock cartLastAccessedTimes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosSystemFacade methodsFor: 'initialization' stamp: 'MP 11/8/2021 20:24:12'!
initializeAuthenticatingWith: anAuthenticationSystem
sourcingProductsFrom: aCatalog
chargingThrough: aMerchantProcessor
withClock: aClock
	
	authenticationSystem _ anAuthenticationSystem.
	catalog _ aCatalog.
	merchantProcessor _ aMerchantProcessor.
	clock _ aClock.
	
	carts _ Dictionary new.
	cartLastAccessedTimes _ Dictionary new.
	lastCartId _ 0.
	lastTransactionId _ 0.
! !


!TusLibrosSystemFacade methodsFor: 'as yet unclassified' stamp: 'MP 11/8/2021 20:29:11'!
add: aQuantity of: aProduct to: aCartId 
	
	"(self findCart: aCartId) add: aQuantity of: aProduct."
	
	carts at: aCartId
		ifPresent: [ :aCart |
			clock now - (cartLastAccessedTimes at: aCartId) >= 30 ifTrue: [ self error: self class expiredCartErrorDescription ].
			aCart add: aQuantity of: aProduct.
		]
		ifAbsent: [ self error: self class invalidCartIdErrorDescription ].
! !

!TusLibrosSystemFacade methodsFor: 'as yet unclassified' stamp: 'MP 11/8/2021 20:31:25'!
checkout: aCartId charging: aCard on: aDate 
	
	"(carts includesKey: aCartId) ifFalse: [ self error: self class invalidCartIdErrorDescription ].
	^ self nextTransactionId."
	
	carts at: aCartId
		ifPresent: [ :aCart |
			clock now - (cartLastAccessedTimes at: aCartId) >= 30 ifTrue: [ self error: self class expiredCartErrorDescription ].
			^ self nextTransactionId.
		]
		ifAbsent: [ self error: self class invalidCartIdErrorDescription ].! !

!TusLibrosSystemFacade methodsFor: 'as yet unclassified' stamp: 'MP 11/8/2021 20:24:12'!
createCartFor: aUser authenticatedBy: aPassword 
	
	| cartId |
	
	(authenticationSystem can: aUser beAuthenticatedBy: aPassword)
		ifFalse: [ self error: TusLibrosSystemFacade invalidCredentialsErrorDescription ].
	
	cartId _ self nextCartId.
	carts at: cartId put: (Cart acceptingProductsFrom: catalog).
	cartLastAccessedTimes at: cartId put: clock now.
	
	^cartId! !

!TusLibrosSystemFacade methodsFor: 'as yet unclassified' stamp: 'IAR 11/5/2021 23:43:09'!
findCart: aCartId

	^ carts at: aCartId ifAbsent: [ self error: self class invalidCartIdErrorDescription ].! !

!TusLibrosSystemFacade methodsFor: 'as yet unclassified' stamp: 'MP 11/8/2021 20:24:12'!
listCart: aCartId


	"^(self findCart: aCartId) contents."
	
	carts at: aCartId
		ifPresent: [ :aCart |
			clock now - (cartLastAccessedTimes at: aCartId) >= 30 ifTrue: [ self error: self class expiredCartErrorDescription ].
			cartLastAccessedTimes at: aCartId put: clock now.
			^ aCart contents.
		]
		ifAbsent: [ self error: self class invalidCartIdErrorDescription ].
! !

!TusLibrosSystemFacade methodsFor: 'as yet unclassified' stamp: 'AF 11/5/2021 00:46:19'!
nextCartId
	
	lastCartId _ lastCartId + 1.
	^lastCartId! !

!TusLibrosSystemFacade methodsFor: 'as yet unclassified' stamp: 'IAR 11/6/2021 00:39:59'!
nextTransactionId

	lastTransactionId _ lastTransactionId + 1.
	^lastTransactionId.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosSystemFacade class' category: 'TusLibros'!
TusLibrosSystemFacade class
	instanceVariableNames: ''!

!TusLibrosSystemFacade class methodsFor: 'instance creation' stamp: 'MP 11/8/2021 20:05:33'!
authenticatingWith: anAuthenticationSystem
sourcingProductsFrom: aCatalog
chargingThrough: aMerchantProcessor
withClock: aClock

	^self new 
		initializeAuthenticatingWith: anAuthenticationSystem
		sourcingProductsFrom: aCatalog
		chargingThrough: aMerchantProcessor
		withClock: aClock.! !


!TusLibrosSystemFacade class methodsFor: 'error descriptions' stamp: 'MP 11/8/2021 20:12:39'!
expiredCartErrorDescription
	
	^ 'expired cart'! !

!TusLibrosSystemFacade class methodsFor: 'error descriptions' stamp: 'AF 11/5/2021 01:00:54'!
invalidCartIdErrorDescription
	
	^ 'invalid cart id'.! !

!TusLibrosSystemFacade class methodsFor: 'error descriptions' stamp: 'AF 11/4/2021 23:57:17'!
invalidCredentialsErrorDescription
	
	^'invalid credentials'! !
