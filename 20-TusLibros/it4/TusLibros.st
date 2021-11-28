!classDefinition: #TusLibrosClientMainWindow category: 'TusLibros'!
SystemWindow subclass: #TusLibrosClientMainWindow
	instanceVariableNames: 'cartMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosClientMainWindow methodsFor: 'as yet unclassified' stamp: 'MP 11/27/2021 22:23:52'!
buildCartColumn
	
	| removeFromCartButtonMorph |
	cartMorph := PluggableListMorph 
		model: self model 
		listGetter: #booksInCart
		indexGetter: #cartIndex
		indexSetter: #cartIndex:.
	
	cartMorph
		borderColor: Color skyBlue; 
		borderWidth: 1;
		morphWidth: 500.

	removeFromCartButtonMorph _ PluggableButtonMorph 
		model: self model
		stateGetter: nil 
		action: #removeFromCart
		label: 'Remove from cart'.
	
	^ LayoutMorph newColumn
		addMorph: cartMorph;
		addMorph: removeFromCartButtonMorph;
		axisEdgeWeight: 0.5;
		yourself.
		
! !

!TusLibrosClientMainWindow methodsFor: 'as yet unclassified' stamp: 'MP 11/27/2021 22:24:02'!
buildCatalogColumn
	
	| addToCartButtonMorph catalogMorph |
	catalogMorph := PluggableListMorph 
		model: self model 
		listGetter: #catalog
		indexGetter: #catalogIndex
		indexSetter: #catalogIndex:.

	catalogMorph
		borderColor: Color skyBlue; 
		borderWidth: 1;
		morphWidth: 500.

	addToCartButtonMorph _ PluggableButtonMorph 
		model: self model
		stateGetter: nil 
		action: #addToCart
		label: 'Add to cart'.
	
	^ LayoutMorph newColumn
		addMorph: catalogMorph;
		addMorph: addToCartButtonMorph;
		axisEdgeWeight: 0.5;
		yourself.
		
! !

!TusLibrosClientMainWindow methodsFor: 'as yet unclassified' stamp: 'MP 11/27/2021 22:38:05'!
buildMorphicWindow

	self layoutMorph
		beRow;
		separation: 15;
		axisEdgeWeight: 0;
		addMorph: self buildCatalogColumn;
		addMorph: self buildCartColumn;
		addMorph: self buildPurchasesColumn.! !

!TusLibrosClientMainWindow methodsFor: 'as yet unclassified' stamp: 'MP 11/27/2021 22:49:24'!
buildPurchasesColumn

	| checkoutButtonMorph purchasesButtonMorph |
	purchasesButtonMorph _ PluggableButtonMorph 
		model: self model
		stateGetter: nil 
		action: #listPurchases
		label: 'Purchases'.
	
	checkoutButtonMorph _ PluggableButtonMorph 
		model: self model
		stateGetter: nil 
		action: #checkout
		label: 'Checkout'.
	
	^LayoutMorph newColumn
		addMorph: purchasesButtonMorph;
		addMorph: checkoutButtonMorph;
		axisEdgeWeight: 0.5;
		yourself.! !

!TusLibrosClientMainWindow methodsFor: 'as yet unclassified' stamp: 'AF 11/20/2021 16:05:31'!
initializeWithModel: aTusLibrosClientModel title: aTitle

	self setLabel: aTitle.
	self model: aTusLibrosClientModel.
	self buildMorphicWindow.
	
	self model when: #bookAddedToCart send: #refreshCart to: self.
	
	self openInWorld.! !

!TusLibrosClientMainWindow methodsFor: 'as yet unclassified' stamp: 'MP 11/27/2021 22:35:17'!
refreshCart
	
	cartMorph updateList.
	cartMorph setSelectionIndex: 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientMainWindow class' category: 'TusLibros'!
TusLibrosClientMainWindow class
	instanceVariableNames: ''!

!TusLibrosClientMainWindow class methodsFor: 'as yet unclassified' stamp: 'MP 11/18/2021 23:57:08'!
openWithModel: aTusLibrosClientModel

	^self new initializeWithModel: aTusLibrosClientModel title: 'TusLibros Main Client'.! !


!classDefinition: #TusLibrosLoginWindow category: 'TusLibros'!
SystemWindow subclass: #TusLibrosLoginWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosLoginWindow methodsFor: 'as yet unclassified' stamp: 'MP 11/19/2021 00:04:20'!
buildMorphicWindow

	| loginButtonMorph userRowLayoutMorph passwordRowLayoutMorph usernameTextBoxMorph passwordTextBoxMorph |

	loginButtonMorph _ PluggableButtonMorph 
		model: self model
		stateGetter: nil 
		action: #createCart
		label: 'Create Cart'.
	
	usernameTextBoxMorph := TextModelMorph
		textProvider: self model
		textGetter: #username
		textSetter: #username:.
	
	usernameTextBoxMorph 
		innerTextMorph setProperty: #keyStroke: 
		toValue:  [ :key | 
			usernameTextBoxMorph innerTextMorph acceptContents ].

	usernameTextBoxMorph
		borderWidth: 1; 
		borderColor: Color skyBlue; 
		morphWidth: 300.
		
	passwordTextBoxMorph _ TextModelMorph
		textProvider: self model
		textGetter: #password
		textSetter: #password:.
	
	passwordTextBoxMorph 
		innerTextMorph setProperty: #keyStroke: 
		toValue:  [ :key | 
			passwordTextBoxMorph innerTextMorph acceptContents ].

	passwordTextBoxMorph
		borderWidth: 1; 
		borderColor: Color skyBlue; 
		morphWidth: 300.

	userRowLayoutMorph _ LayoutMorph newRow
		addMorph: (LabelMorph contents: 'Username');
		addMorph: usernameTextBoxMorph;
		axisEdgeWeight: 0.5;
		yourself.
	
	passwordRowLayoutMorph _ LayoutMorph newRow
		addMorph: (LabelMorph contents: 'Password');
		addMorph: passwordTextBoxMorph;
		axisEdgeWeight: 0.5;
		yourself.

	self layoutMorph
		beColumn;
		separation: 15;
		axisEdgeWeight: 0; "TODO: metodo para declaratividad"
		addMorph: userRowLayoutMorph;
		addMorph: passwordRowLayoutMorph;
		addMorph: loginButtonMorph.

	! !

!TusLibrosLoginWindow methodsFor: 'as yet unclassified' stamp: 'MP 11/19/2021 00:04:26'!
initializeWith: aTitle

	self setLabel: aTitle.
	self model: (TusLibrosClientModel new).
	self buildMorphicWindow.
	self openInWorld.
	
	self model when: #cartCreationSuccessful send: #openMainWindow to: self.! !

!TusLibrosLoginWindow methodsFor: 'as yet unclassified' stamp: 'MP 11/19/2021 00:34:06'!
openMainWindow

	TusLibrosClientMainWindow openWithModel: self model.
	self closeBoxHit.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosLoginWindow class' category: 'TusLibros'!
TusLibrosLoginWindow class
	instanceVariableNames: ''!

!TusLibrosLoginWindow class methodsFor: 'instance creation' stamp: 'IAR 11/15/2021 21:39:33'!
open

	^self new initializeWith: 'TusLibros Client Window'.! !


!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'MP 11/2/2021 00:10:17'!
setUp

	testObjectFactory _ TestObjectFactory new.! !

!CartTest methodsFor: 'tests' stamp: 'MP 11/18/2021 23:45:27'!
test01NewCartIsEmpty

	| cart |

	cart _ testObjectFactory createCart.
	
	self assert: cart isEmpty.! !

!CartTest methodsFor: 'tests' stamp: 'MP 11/18/2021 23:45:27'!
test02CartWithABookShouldNotBeEmpty

	| cart |
	
	cart _ testObjectFactory createCart.
	cart add: testObjectFactory firstProductSoldByTheStore.
	
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'MP 11/18/2021 23:45:28'!
test03CartIncludesBookAfterAdding

	| cart |

	cart _ testObjectFactory createCart.
	cart add: testObjectFactory firstProductSoldByTheStore .
	
	self assert: (cart includes: testObjectFactory firstProductSoldByTheStore).! !

!CartTest methodsFor: 'tests' stamp: 'MP 11/18/2021 23:45:28'!
test04CantAddBookNotIncludedInCatalog

	| cart |
	
	cart _ testObjectFactory createCart.
	
	self assertAdding: testObjectFactory productNotSoldByTheStore
		withQuantity: 1 
		to: cart 
		raises: Cart productNotInCatalogErrorDescription.! !

!CartTest methodsFor: 'tests' stamp: 'MP 11/18/2021 23:45:27'!
test05CartIncludesAllOccurrencesOfBookAfterAdding

	| cart quantity |

	cart _ testObjectFactory createCart.
	quantity _ 5.
	cart add: quantity of: testObjectFactory firstProductSoldByTheStore.
	
	self assert: quantity equals: (cart occurrencesOf: testObjectFactory firstProductSoldByTheStore).! !

!CartTest methodsFor: 'tests' stamp: 'MP 11/18/2021 23:45:27'!
test06CantAddBookWithZeroQuantity

	| cart |
	cart _ testObjectFactory createCart.
	
	self assertAdding: testObjectFactory secondProductSoldByTheStore 
		withQuantity: 0
		to: cart
		raises: Cart invalidQuantityErrorDescription.! !

!CartTest methodsFor: 'tests' stamp: 'MP 11/18/2021 23:45:27'!
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

!CheckoutTest methodsFor: 'assertions' stamp: 'MP 11/9/2021 01:34:55'!
assertCheckout: aCart charging: aCard raises: anErrorMessage
	
	| cashier |
	cashier _ testObjectFactory createCashier.
	
	self should: [ cashier 
				checkout: aCart 
				charging: aCard 
				on: testObjectFactory fixedDate 
				]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException | 
			self assert: anErrorMessage equals: anException messageText.
		].! !


!CheckoutTest methodsFor: 'tests' stamp: 'MP 11/1/2021 23:56:29'!
setUp

	testObjectFactory _ TestObjectFactory new.! !

!CheckoutTest methodsFor: 'tests' stamp: 'MP 11/18/2021 23:45:27'!
test01CannotCheckoutWithEmptyCart

	self assertCheckout: testObjectFactory createCart
		charging: testObjectFactory validCard
		raises: Cashier emptyCartErrorDescription.! !

!CheckoutTest methodsFor: 'tests' stamp: 'MP 11/18/2021 23:45:27'!
test02CheckoutOfCartWithSingleItemReturnsReceiptOfItsPrice

	| cart cashier receipt |
	cart _ testObjectFactory createCart.
	cashier _ testObjectFactory createCashier.
	
	cart add: testObjectFactory firstProductSoldByTheStore.
	
	receipt _ cashier 
		checkout: cart 
		charging: testObjectFactory validCard 
		on: testObjectFactory fixedDate.

	self assert: testObjectFactory firstProductSoldByTheStorePrice equals: receipt.! !

!CheckoutTest methodsFor: 'tests' stamp: 'MP 11/18/2021 23:45:27'!
test03CheckoutOfCartWithItemWithMultipleOcurrencesReturnsRecepitOfItsTotalPrice

	| cart cashier quantity receipt |
	cart _ testObjectFactory createCart.
	cashier _ testObjectFactory createCashier.
	quantity _ 5.
	
	cart add: quantity of: testObjectFactory firstProductSoldByTheStore.
	
	receipt _ cashier 
		checkout: cart 
		charging: testObjectFactory validCard 
		on: testObjectFactory fixedDate.

	self 
		assert: (quantity * testObjectFactory firstProductSoldByTheStorePrice)
		equals: receipt.! !

!CheckoutTest methodsFor: 'tests' stamp: 'MP 11/18/2021 23:45:27'!
test04CheckoutOfCartWithMultipleItemsReturnsReceiptWithASumOfTheirPrices

	| cart cashier quantity expectedRecepit receipt |
	cart _ testObjectFactory createCart.
	cashier _ testObjectFactory createCashier.
	quantity _ 5.
	
	cart add: quantity of: testObjectFactory firstProductSoldByTheStore.
	cart add: testObjectFactory secondProductSoldByTheStore.
	
	receipt _ cashier 
		checkout: cart 
		charging: testObjectFactory validCard 
		on: testObjectFactory fixedDate.
	
	expectedRecepit _
		(quantity * testObjectFactory firstProductSoldByTheStorePrice) +
		(testObjectFactory secondProductSoldByTheStorePrice).

	self 
		assert: expectedRecepit
		equals: receipt.! !

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

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'AF 11/4/2021 23:38:43'!
setUp

	testObjectFactory _ TestObjectFactory new.! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MP 11/9/2021 02:23:05'!
test01CannotCreateCartWithInvalidCredentials

	| tusLibros |
	
	tusLibros _ TusLibrosSystemFacade
		authenticatingWith: testObjectFactory authSystemDenyingAll
		sourcingProductsFrom: testObjectFactory defaultCatalog
		chargingThrough: testObjectFactory defaultSimulatedMP
		withClock: ManualClock new.
	
	self should: [ tusLibros createCartFor: testObjectFactory defaultUser authenticatedBy: testObjectFactory defaultPassword ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TusLibrosSystemFacade invalidCredentialsErrorDescription.! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'IAR 11/6/2021 00:01:36'!
test02CartCreatedWithValidCredentialsIsEmpty

	| tusLibros cartId |
	
	tusLibros _ self defaultTusLibrosSystemFacade.
	cartId _ tusLibros createCartFor: testObjectFactory defaultUser authenticatedBy: testObjectFactory defaultPassword.
	
	self assert: (tusLibros listCart: cartId) isEmpty.! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MP 11/9/2021 02:26:20'!
test03AddingMultipleOcurrencesOfAProductListsEachOne

	| tusLibros quantity cartId |
	
	tusLibros _ self defaultTusLibrosSystemFacade.
	cartId _ tusLibros createCartFor: testObjectFactory defaultUser authenticatedBy: testObjectFactory defaultPassword.
	quantity _ 1.
	
	tusLibros add: quantity of: testObjectFactory firstProductSoldByTheStore to: cartId.
	
	self 
		assert: quantity
		equals: ( (tusLibros listCart: cartId) occurrencesOf: testObjectFactory firstProductSoldByTheStore).! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MP 11/9/2021 02:26:31'!
test04AddingToACartDoesntAffectTheOthers

	| tusLibros quantity firstCartId secondCartId |
	
	tusLibros _ self defaultTusLibrosSystemFacade.
	firstCartId _ tusLibros createCartFor: testObjectFactory defaultUser authenticatedBy: testObjectFactory defaultPassword.
	secondCartId _ tusLibros createCartFor: 'nacho' authenticatedBy: 'elRetorico'.
	quantity _ 1.
	
	tusLibros add: quantity of: testObjectFactory firstProductSoldByTheStore to: firstCartId.
	
	self 
		assert: quantity
		equals: ( (tusLibros listCart: firstCartId) occurrencesOf: testObjectFactory firstProductSoldByTheStore).

	self assert: (tusLibros listCart: secondCartId) isEmpty.! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'IAR 11/6/2021 00:10:21'!
test05CannotAddProductToCartWithInvalidId

	| tusLibros invalidId |
	
	tusLibros _ self defaultTusLibrosSystemFacade.
	invalidId _ 0.
	self should: [ tusLibros add: 1 of: testObjectFactory firstProductSoldByTheStore to: invalidId ]
		raise: Error - MessageNotUnderstood
		withMessageText: TusLibrosSystemFacade invalidCartIdErrorDescription.
	
! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'IAR 11/6/2021 00:09:55'!
test06CannotListCartWithInvalidId

	| tusLibros invalidId |
	
	tusLibros _ self defaultTusLibrosSystemFacade.
	invalidId _ 0.
	self should: [ tusLibros listCart: invalidId ]
		raise: Error - MessageNotUnderstood
		withMessageText: TusLibrosSystemFacade invalidCartIdErrorDescription.
	
! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MP 11/9/2021 02:39:43'!
test07CannotCheckoutInvalidCartId

	| tusLibros invalidId |
	
	tusLibros _ self defaultTusLibrosSystemFacade.
	invalidId _ 0.
	self should: [ tusLibros
			checkout: invalidId
			charging: testObjectFactory validCard ]
		raise: Error - MessageNotUnderstood
		withMessageText: TusLibrosSystemFacade invalidCartIdErrorDescription.
	
! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MP 11/9/2021 02:12:10'!
test08CheckoutOfCartRegistersSales

	| tusLibros cartId expectedSale userPurchases |
	
	tusLibros _ self defaultTusLibrosSystemFacade.
	cartId _ tusLibros
		createCartFor: testObjectFactory defaultUser
		authenticatedBy: testObjectFactory defaultPassword.
	
	tusLibros add: 1 of: testObjectFactory firstProductSoldByTheStore to: cartId.

	tusLibros
		checkout: cartId
		charging: testObjectFactory validCard.

	userPurchases _ (tusLibros listPurchasesOf: testObjectFactory defaultUser authenticatedBy: testObjectFactory defaultPassword).
	expectedSale _ Sale
		by: testObjectFactory defaultUser
		of: (Bag with: testObjectFactory firstProductSoldByTheStore)
		totalling: testObjectFactory firstProductSoldByTheStorePrice.

	self assert: userPurchases includes: expectedSale.
	! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MP 11/9/2021 01:52:13'!
test10CannotListExpiredCart

	| tusLibros cartId clock |
	
	clock _ ManualClock new.
	tusLibros _ self tusLibrosSystemFacadeWithClock: clock.
	cartId _ tusLibros
		createCartFor: testObjectFactory defaultUser
		authenticatedBy: testObjectFactory defaultPassword. 

	clock incrementTimeBy: 31.

	self should: [ tusLibros listCart: cartId ]
		raise: Error - MessageNotUnderstood
		withMessageText: TusLibrosSystemFacade expiredCartErrorDescription.

! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MP 11/9/2021 01:52:16'!
test11CartsExpireOnlyAfterThirtyMinutes

	| tusLibros clock expiredCartId nonExpiredCartId |

	clock _ ManualClock new.
	tusLibros _ self tusLibrosSystemFacadeWithClock: clock.
	
	expiredCartId _ tusLibros
		createCartFor: testObjectFactory defaultUser
		authenticatedBy: testObjectFactory defaultPassword. 

	clock incrementTimeBy: 15.

	nonExpiredCartId _ tusLibros
		createCartFor: testObjectFactory defaultUser
		authenticatedBy: testObjectFactory defaultPassword. 

	clock incrementTimeBy: 16.

	self should: [ tusLibros listCart: expiredCartId ]
		raise: Error - MessageNotUnderstood
		withMessageText: TusLibrosSystemFacade expiredCartErrorDescription.

	self assert: (tusLibros listCart: nonExpiredCartId) isEmpty.

! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MP 11/9/2021 01:52:19'!
test12ListingRefreshesCart

	| tusLibros clock cartId |
	
	clock _ ManualClock new.
	tusLibros _ self tusLibrosSystemFacadeWithClock: clock.
	
	cartId _ tusLibros
		createCartFor: testObjectFactory defaultUser
		authenticatedBy: testObjectFactory defaultPassword. 

	clock incrementTimeBy: 15.

	tusLibros listCart: cartId.

	clock incrementTimeBy: 16.

	self shouldnt: [ tusLibros listCart: cartId ] raise: Error.

! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MP 11/9/2021 01:52:22'!
test13CannotAddProductsToExpiredCart

	| tusLibros clock cartId |
	
	clock _ ManualClock new.
	tusLibros _ self tusLibrosSystemFacadeWithClock: clock.
	
	cartId _ tusLibros
		createCartFor: testObjectFactory defaultUser
		authenticatedBy: testObjectFactory defaultPassword. 

	clock incrementTimeBy: 31.

	self should: [ tusLibros add: 1 of: testObjectFactory firstProductSoldByTheStore to: cartId ]
		raise: Error - MessageNotUnderstood
		withMessageText: TusLibrosSystemFacade expiredCartErrorDescription.

! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MP 11/9/2021 02:10:53'!
test14CannotCheckoutExpiredCart

	| tusLibros clock cartId |
	
	clock _ ManualClock new.
	tusLibros _ self tusLibrosSystemFacadeWithClock: clock.
	
	cartId _ tusLibros
		createCartFor: testObjectFactory defaultUser
		authenticatedBy: testObjectFactory defaultPassword. 

	clock incrementTimeBy: 31.

	self should: [ tusLibros checkout: cartId charging: testObjectFactory validCard ]
		raise: Error - MessageNotUnderstood
		withMessageText: TusLibrosSystemFacade expiredCartErrorDescription.

! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MP 11/9/2021 01:52:28'!
test15AddingProductsRefreshesCart

	| tusLibros clock cartId |
	
	clock _ ManualClock new.
	tusLibros _ self tusLibrosSystemFacadeWithClock: clock.
	
	cartId _ tusLibros
		createCartFor: testObjectFactory defaultUser
		authenticatedBy: testObjectFactory defaultPassword. 

	clock incrementTimeBy: 15.

	tusLibros add: 1 of: testObjectFactory firstProductSoldByTheStore to: cartId.

	clock incrementTimeBy: 16.

	self shouldnt: [ tusLibros listCart: cartId ] raise: Error.

! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'AF 11/20/2021 14:44:26'!
test16

	| tusLibros |

	tusLibros _ self defaultTusLibrosSystemFacade.
	
	self assert: tusLibros catalog includes: testObjectFactory firstProductSoldByTheStore.
	self assert: tusLibros catalog includes: testObjectFactory secondProductSoldByTheStore.
	self assert: 2 equals: tusLibros catalog size.

! !


!TusLibrosSystemFacadeTest methodsFor: 'test objects' stamp: 'MP 11/8/2021 23:42:43'!
defaultTusLibrosSystemFacade
	
	^self tusLibrosSystemFacadeWithClock: ManualClock new.! !

!TusLibrosSystemFacadeTest methodsFor: 'test objects' stamp: 'MP 11/9/2021 02:23:00'!
tusLibrosSystemFacadeWithClock: aClock
	
	^TusLibrosSystemFacade
		authenticatingWith: testObjectFactory authSystemAllowingAll
		sourcingProductsFrom: testObjectFactory defaultCatalog
		chargingThrough: testObjectFactory defaultSimulatedMP
		withClock: aClock.! !


!TusLibrosSystemFacadeTest methodsFor: 'assertions' stamp: 'IAR 11/6/2021 00:37:44'!
assert: expected isNotEqualTo: actual 
	
	self deny: expected = actual.! !


!classDefinition: #ActiveCart category: 'TusLibros'!
Object subclass: #ActiveCart
	instanceVariableNames: 'cart lastAccessedAt clock id user'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ActiveCart methodsFor: 'cart protocol' stamp: 'MP 11/9/2021 02:14:39'!
add: aQuantity of: aProduct

	cart add: aQuantity of: aProduct.
	self refreshLastAccessedAt.! !

!ActiveCart methodsFor: 'cart protocol' stamp: 'MP 11/9/2021 02:14:39'!
contents

	self refreshLastAccessedAt.
	^ cart contents! !

!ActiveCart methodsFor: 'cart protocol' stamp: 'MP 11/9/2021 02:15:54'!
isEmpty

	^ cart isEmpty.! !

!ActiveCart methodsFor: 'cart protocol' stamp: 'MP 11/9/2021 02:15:12'!
totalPrice

	^ cart totalPrice.! !


!ActiveCart methodsFor: 'private' stamp: 'MP 11/9/2021 02:18:05'!
refreshLastAccessedAt

	lastAccessedAt _ clock now.! !


!ActiveCart methodsFor: 'testing - private' stamp: 'MP 11/9/2021 02:18:12'!
cartLifetime

	^ lastAccessedAt distanceTo: clock now! !

!ActiveCart methodsFor: 'testing - private' stamp: 'MP 11/9/2021 02:17:45'!
cartMaximumLifetime

	^ 30 * minute! !


!ActiveCart methodsFor: 'testing' stamp: 'MP 11/9/2021 02:18:15'!
isExpired

	^ self cartLifetime > self cartMaximumLifetime! !


!ActiveCart methodsFor: 'initialization' stamp: 'MP 11/9/2021 02:18:05'!
initializeAcceptingProductsFrom: aCatalog
keepingTimeWith: aClock
createdBy: aUser
identifiedBy: anId

	clock _ aClock.
	id _ anId.
	user _ aUser.

	cart _ Cart acceptingProductsFrom: aCatalog.
	lastAccessedAt _ clock now.! !


!ActiveCart methodsFor: 'accessing' stamp: 'MP 11/9/2021 02:35:48'!
id

	^ id.! !

!ActiveCart methodsFor: 'accessing' stamp: 'MP 11/9/2021 01:47:16'!
user

	^ user.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ActiveCart class' category: 'TusLibros'!
ActiveCart class
	instanceVariableNames: ''!

!ActiveCart class methodsFor: 'instance creation' stamp: 'MP 11/9/2021 01:46:49'!
acceptingProductsFrom: aCatalog
keepingTimeWith: aClock
createdBy: aUser
identifiedBy: anId 

	^self new 
		initializeAcceptingProductsFrom: aCatalog
		keepingTimeWith: aClock
		createdBy: aUser
		identifiedBy: anId.! !


!classDefinition: #AuthenticationSystem category: 'TusLibros'!
Object subclass: #AuthenticationSystem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!AuthenticationSystem methodsFor: 'authentication' stamp: 'MP 11/9/2021 02:21:47'!
can: aUser beAuthenticatedBy: aPassword 
	
	self subclassResponsibility.! !


!classDefinition: #ConfigurableAuthenticationSystem category: 'TusLibros'!
AuthenticationSystem subclass: #ConfigurableAuthenticationSystem
	instanceVariableNames: 'result users'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ConfigurableAuthenticationSystem methodsFor: 'as yet unclassified' stamp: 'AF 11/13/2021 01:56:23'!
can: aUser beAuthenticatedBy: aPassword 

	^ users at: aUser 
		ifPresent:[ :password | ^ password = aPassword ] 
		ifAbsent: [ ^false ].! !

!ConfigurableAuthenticationSystem methodsFor: 'as yet unclassified' stamp: 'AF 11/13/2021 02:09:24'!
initialize

	users _ Dictionary new.! !

!ConfigurableAuthenticationSystem methodsFor: 'as yet unclassified' stamp: 'AF 11/13/2021 02:12:17'!
register: aUser authenticatedBy: aPassword

	users at: aUser put: aPassword.! !


!classDefinition: #SimulatedAuthenticationSystem category: 'TusLibros'!
AuthenticationSystem subclass: #SimulatedAuthenticationSystem
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


!SimulatedAuthenticationSystem methodsFor: 'authentication' stamp: 'AF 11/5/2021 00:02:49'!
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


!classDefinition: #Book category: 'TusLibros'!
Object subclass: #Book
	instanceVariableNames: 'title isbn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Book methodsFor: 'initialization' stamp: 'MP 11/19/2021 00:52:05'!
initializeTitled: aTitle isbn: anISBN 

	title _ aTitle.
	isbn _ anISBN.! !


!Book methodsFor: 'comparing' stamp: 'MP 11/19/2021 00:54:44'!
= otherBook

	^ title = otherBook title and: [ isbn = otherBook isbn ].

	! !

!Book methodsFor: 'comparing' stamp: 'MP 11/19/2021 01:03:30'!
hash

	^ self asString hash.! !


!Book methodsFor: 'accessing' stamp: 'MP 11/19/2021 00:55:24'!
isbn

	^ isbn.! !

!Book methodsFor: 'accessing' stamp: 'MP 11/19/2021 00:55:20'!
title

	^ title.! !


!Book methodsFor: 'converting' stamp: 'MP 11/19/2021 01:45:24'!
asString

	^isbn, ' ', title! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Book class' category: 'TusLibros'!
Book class
	instanceVariableNames: ''!

!Book class methodsFor: 'instance creation' stamp: 'MP 11/19/2021 00:52:30'!
titled: aTitle isbn: anISBN 

	^self new initializeTitled: aTitle isbn: anISBN ! !


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


!Card methodsFor: 'testing' stamp: 'MP 11/9/2021 01:44:09'!
isExpiredOn: aDate

	^ aDate monthOfYear > expirationMonthOfYear.! !

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


!Cashier methodsFor: 'checkout' stamp: 'MP 11/9/2021 01:33:47'!
checkout: aCart charging: aCreditCard on: aDate 

	| totalPrice |
	self assertCartIsNotEmpty: aCart.
	self assertCard: aCreditCard isNotExpiredOn: aDate.
	self assertCardNumberIsValid: aCreditCard.

	totalPrice _ aCart totalPrice.
	
	merchantProcessor charge: totalPrice to: aCreditCard.

	^ totalPrice
! !


!Cashier methodsFor: 'initialization' stamp: 'MP 11/9/2021 01:26:54'!
initializeChargingThrough: aMerchantProcessor 

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


!Cashier class methodsFor: 'instance creation' stamp: 'MP 11/9/2021 01:26:54'!
chargingThrough: aMerchantProcessor 

	^self new initializeChargingThrough: aMerchantProcessor.! !


!classDefinition: #Clock category: 'TusLibros'!
Object subclass: #Clock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Clock methodsFor: 'timekeeping' stamp: 'MP 11/8/2021 23:39:53'!
now

	self subclassResponsibility.! !


!classDefinition: #ManualClock category: 'TusLibros'!
Clock subclass: #ManualClock
	instanceVariableNames: 'time'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ManualClock methodsFor: 'time manipulation' stamp: 'MP 11/9/2021 01:51:30'!
incrementTimeBy: aNumberOfMinutes

	time _ time next: aNumberOfMinutes * minute.! !


!ManualClock methodsFor: 'initialization' stamp: 'MP 11/9/2021 01:37:06'!
initialize

	time _ GregorianDateTime now.! !


!ManualClock methodsFor: 'timekeeping' stamp: 'MP 11/8/2021 20:08:01'!
now

	^ time! !


!classDefinition: #SystemClock category: 'TusLibros'!
Clock subclass: #SystemClock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!SystemClock methodsFor: 'timekeeping' stamp: 'AF 11/13/2021 01:37:46'!
now

	^GregorianDateTime now.! !


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


!classDefinition: #Sale category: 'TusLibros'!
Object subclass: #Sale
	instanceVariableNames: 'collectionOfContents totalPrice contents user amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'initialization' stamp: 'MP 11/9/2021 01:48:17'!
initializeBy: aUser of: aCollectionOfContents totalling: anAmount

	contents _ aCollectionOfContents.
	totalPrice _ anAmount.
	user _ aUser.! !


!Sale methodsFor: 'comparing' stamp: 'MP 11/9/2021 00:56:23'!
= otherSale

	^ contents = otherSale contents and: [ totalPrice = otherSale totalPrice ].

	! !


!Sale methodsFor: 'accessing' stamp: 'MP 11/9/2021 00:56:30'!
contents

	^ contents! !

!Sale methodsFor: 'accessing' stamp: 'MP 11/9/2021 00:56:34'!
totalPrice

	^ totalPrice.! !

!Sale methodsFor: 'accessing' stamp: 'MP 11/9/2021 01:49:14'!
user

	^user! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: 'TusLibros'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'MP 11/9/2021 01:36:13'!
by: aUser of: aCollectionOfContents totalling: anAmount 

	^self new initializeBy: aUser of: aCollectionOfContents totalling: anAmount ! !


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

!TestObjectFactory methodsFor: 'products' stamp: 'MP 11/19/2021 00:52:30'!
firstProductSoldByTheStore

	^ Book titled: '123' isbn: '1'.
! !

!TestObjectFactory methodsFor: 'products' stamp: 'MP 11/1/2021 23:46:12'!
firstProductSoldByTheStorePrice

	^ 100.! !

!TestObjectFactory methodsFor: 'products' stamp: 'MP 11/19/2021 00:52:30'!
productNotSoldByTheStore

	^ Book titled: 'El Cormen.' isbn: '2'.
! !

!TestObjectFactory methodsFor: 'products' stamp: 'MP 11/19/2021 00:52:30'!
secondProductSoldByTheStore

	^ Book titled: 'The Bible' isbn: '3'.
! !

!TestObjectFactory methodsFor: 'products' stamp: 'MP 11/1/2021 23:46:37'!
secondProductSoldByTheStorePrice

	^ 50.
! !


!TestObjectFactory methodsFor: 'store creation' stamp: 'MP 11/18/2021 23:45:27'!
createCart

	^ Cart acceptingProductsFrom: self defaultCatalog.! !

!TestObjectFactory methodsFor: 'store creation' stamp: 'MP 11/18/2021 23:45:27'!
createCartWithSingleProduct

	^ self createCart
		add: self firstProductSoldByTheStore;
		yourself.! !

!TestObjectFactory methodsFor: 'store creation' stamp: 'MP 11/9/2021 01:26:12'!
createCashier

	^ Cashier chargingThrough: self defaultSimulatedMP.! !

!TestObjectFactory methodsFor: 'store creation' stamp: 'MP 11/2/2021 02:30:11'!
defaultSimulatedMP

	^ SimulatedMP
		withNoFundsCard: self cardWithoutFundsNumber
		stolenCard: self stolenCardNumber.
! !


!TestObjectFactory methodsFor: 'authentication' stamp: 'MP 11/9/2021 02:23:00'!
authSystemAllowingAll
	
	^ SimulatedAuthenticationSystem newSuccesful.! !

!TestObjectFactory methodsFor: 'authentication' stamp: 'MP 11/9/2021 02:23:05'!
authSystemDenyingAll
	
	^ SimulatedAuthenticationSystem newUnsuccesful.! !

!TestObjectFactory methodsFor: 'authentication' stamp: 'AF 11/4/2021 23:58:01'!
defaultPassword
	
	^'hunter2'! !

!TestObjectFactory methodsFor: 'authentication' stamp: 'AF 11/4/2021 23:57:41'!
defaultUser
	
	^'HAW'! !


!classDefinition: #TusLibrosClientModel category: 'TusLibros'!
Object subclass: #TusLibrosClientModel
	instanceVariableNames: 'username password cartId catalogIndex catalog cartIndex sale'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosClientModel methodsFor: 'actions' stamp: 'AF 11/20/2021 16:24:26'!
addToCart
	
	| selectedBookIsbn |
	
	selectedBookIsbn _ (catalog at: catalogIndex) isbn.
	self addToCartRequest: selectedBookIsbn.
	self triggerEvent: #bookAddedToCart.! !

!TusLibrosClientModel methodsFor: 'actions' stamp: 'IAR 11/26/2021 20:28:28'!
booksInCart

	| booksInCart |
	
	booksInCart _ self listCartRequest.
	^self renderCartContents: booksInCart.! !

!TusLibrosClientModel methodsFor: 'actions' stamp: 'AF 11/20/2021 16:21:46'!
cartIndex

 	^cartIndex.! !

!TusLibrosClientModel methodsFor: 'actions' stamp: 'AF 11/20/2021 16:22:04'!
cartIndex: aCartIndex

 	cartIndex _ aCartIndex.! !

!TusLibrosClientModel methodsFor: 'actions' stamp: 'IAR 11/26/2021 20:17:42'!
catalog
	
	catalog ifNotNil:[ ^ self renderCatalog ].
	
	catalog _ self catalogRequest.
	^ self renderCatalog.! !

!TusLibrosClientModel methodsFor: 'actions' stamp: 'MP 11/19/2021 00:30:40'!
catalogIndex
	
	^ catalogIndex! !

!TusLibrosClientModel methodsFor: 'actions' stamp: 'MP 11/19/2021 00:31:35'!
catalogIndex: aCatalogIndex
	
	catalogIndex _ aCatalogIndex.! !

!TusLibrosClientModel methodsFor: 'actions' stamp: 'MP 11/27/2021 23:50:16'!
checkout

	sale _ self checkoutRequest.
	self triggerEvent: #checkoutSuccessful! !

!TusLibrosClientModel methodsFor: 'actions' stamp: 'MP 11/27/2021 23:35:39'!
checkoutRequest

	| resp |
	resp _ WebClient 
		htmlSubmit: self url, '/checkout' 
		fields: { 'cartId' -> cartId }
		method: 'GET'.

	resp isSuccess 
		ifTrue: [^ TusLibrosEncoder decodeSale: resp content readStream ]
		ifFalse:[ ^ self error: resp content ]! !

!TusLibrosClientModel methodsFor: 'actions' stamp: 'MP 11/19/2021 00:04:05'!
createCart

	cartId _ self createCartRequest.
	
	self triggerEvent: #cartCreationSuccessful! !

!TusLibrosClientModel methodsFor: 'actions' stamp: 'MP 11/18/2021 18:08:36'!
password

	^ password! !

!TusLibrosClientModel methodsFor: 'actions' stamp: 'MP 11/18/2021 18:08:40'!
password: aPassword

	password _ aPassword.
	^true.! !

!TusLibrosClientModel methodsFor: 'actions' stamp: 'MP 11/27/2021 23:49:42'!
sale

	^ sale.! !

!TusLibrosClientModel methodsFor: 'actions' stamp: 'MP 11/18/2021 18:08:43'!
username

	^ username! !

!TusLibrosClientModel methodsFor: 'actions' stamp: 'MP 11/18/2021 18:08:46'!
username: aUsername

	username _ aUsername.
	^true.! !


!TusLibrosClientModel methodsFor: 'initialization' stamp: 'AF 11/20/2021 16:23:14'!
initialize

	username _ 'haw'.
	password _ 'hunter2'.
	catalogIndex _ 1.
	cartIndex _ 1.! !


!TusLibrosClientModel methodsFor: 'rendering' stamp: 'IAR 11/26/2021 20:17:18'!
renderBook: book

	^ '(ISBN #', book isbn, ') ', book title.! !

!TusLibrosClientModel methodsFor: 'rendering' stamp: 'IAR 11/26/2021 20:19:08'!
renderBook: book withQuantity: quantity

	^ (self renderBook: book), ' (', quantity asString, ')'! !

!TusLibrosClientModel methodsFor: 'rendering' stamp: 'IAR 11/26/2021 20:30:07'!
renderCartContents: cartContents

	| renderedCartContents |
	
	renderedCartContents _ OrderedCollection new.
	cartContents contents keysAndValuesDo: [ :book :quantity |
			renderedCartContents add: (	self renderBook: book withQuantity: quantity)].
	
	^renderedCartContents.! !

!TusLibrosClientModel methodsFor: 'rendering' stamp: 'IAR 11/26/2021 20:17:42'!
renderCatalog

	^ catalog collect: [ :book | self renderBook: book ]! !


!TusLibrosClientModel methodsFor: 'requests' stamp: 'AF 11/20/2021 16:20:49'!
addToCartRequest: aIsbn
	
	| resp |
	
	resp _ WebClient 
		htmlSubmit: self url, '/addProductToCart' 
		fields: {
			'cartId' -> cartId.
			'isbn' -> aIsbn.
			'quantity' -> '1'.
		} method: 'POST'.
	
	resp isSuccess 
		ifTrue: [^ self ] 
		ifFalse:[ ^ self handleErrorResponse: resp ].! !

!TusLibrosClientModel methodsFor: 'requests' stamp: 'AF 11/20/2021 16:18:33'!
catalogRequest

	| resp |

	resp _ WebClient httpGet: self url, '/catalog'.

	resp isSuccess 
		ifTrue: [^ (TusLibrosEncoder decodeBookCollection: resp content readStream) asOrderedCollection ] 
		ifFalse:[ ^ self error: resp content ].! !

!TusLibrosClientModel methodsFor: 'requests' stamp: 'MP 11/19/2021 00:29:28'!
createCartRequest

	| fields resp |

	fields _ Dictionary new
		at: 'user' put: username;
		at: 'password' put: password;
		yourself.

	resp _ WebClient htmlSubmit: (self url, '/createCart') fields: fields.

	resp isSuccess 
		ifTrue: [^ resp content asNumber ] 
		ifFalse:[ ^ self error: resp content ].! !

!TusLibrosClientModel methodsFor: 'requests' stamp: 'MP 11/27/2021 23:47:48'!
listCartRequest

	| resp |

	resp _ WebClient 
		htmlSubmit: self url, '/listCart' 
		fields: { 'cartId' -> cartId }
		method: 'GET'.

	resp isSuccess 
		ifTrue: [^ TusLibrosEncoder decodeCartContents: resp content readStream ]
		ifFalse:[ ^ self error: resp content ].! !

!TusLibrosClientModel methodsFor: 'requests' stamp: 'MP 11/18/2021 23:44:29'!
port

	^ 8080! !

!TusLibrosClientModel methodsFor: 'requests' stamp: 'MP 11/18/2021 23:44:24'!
url

	^ 'http://localhost:', self port asString! !


!TusLibrosClientModel methodsFor: 'errors' stamp: 'AF 11/20/2021 14:36:01'!
handleErrorResponse: aResponse

	TranscriptWindow openTranscript.
	Transcript clear. 
	Transcript show: aResponse content.! !


!classDefinition: #TusLibrosEncoder category: 'TusLibros'!
Object subclass: #TusLibrosEncoder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosEncoder class' category: 'TusLibros'!
TusLibrosEncoder class
	instanceVariableNames: ''!

!TusLibrosEncoder class methodsFor: 'as yet unclassified' stamp: 'MP 11/27/2021 23:43:39'!
decodeBookCollection: anEncodedBookCollection

	| decodedCatalog |
	decodedCatalog _ WebUtils jsonDecode: anEncodedBookCollection.
	^ decodedCatalog collect: [ :anEncodedBook | self unmarshalBook: anEncodedBook ].
	

	! !

!TusLibrosEncoder class methodsFor: 'as yet unclassified' stamp: 'MP 11/27/2021 23:47:58'!
decodeCartContents: encodedBooksInCart

	^self unmarshalCartContents: (WebUtils jsonDecode: encodedBooksInCart).! !

!TusLibrosEncoder class methodsFor: 'as yet unclassified' stamp: 'MP 11/27/2021 23:47:58'!
decodeSale: encodedSale

	| decodedSale |

	decodedSale _ 	WebUtils jsonDecode: encodedSale.
	
	^Sale
		by: (decodedSale at: 'user')
		of: (decodedSale at: 'totalPrice')
		totalling: (self unmarshalCartContents: (decodedSale at: 'contents')).
! !

!TusLibrosEncoder class methodsFor: 'as yet unclassified' stamp: 'MP 11/27/2021 23:43:31'!
encodeBook: aBook withQuantity: aQuantity

	^ Dictionary new
		at: 'book' put: (self marshalBook: aBook)	;
		at: 'quantity' put: aQuantity;
		yourself.! !

!TusLibrosEncoder class methodsFor: 'as yet unclassified' stamp: 'MP 11/27/2021 23:47:38'!
encodeCartContents: booksInCart

	^ WebUtils jsonEncode: (self marshalCartContents: booksInCart).! !

!TusLibrosEncoder class methodsFor: 'as yet unclassified' stamp: 'MP 11/27/2021 23:43:31'!
encodeCatalog: aBookCollection

	| catalogWithEncodedBooks |
	catalogWithEncodedBooks _ 
		aBookCollection collect: [ :aBook | self marshalBook: aBook ].
	
	^ WebUtils jsonEncode: catalogWithEncodedBooks asArray.

	! !

!TusLibrosEncoder class methodsFor: 'as yet unclassified' stamp: 'MP 11/27/2021 23:47:28'!
encodeSale: aSale

	| encodedSale |
	encodedSale _ Dictionary new
		at: 'user' put: aSale user;
		at: 'totalPrice' put: aSale totalPrice;
		at: 'contents' put: (self marshalCartContents: aSale contents);
		yourself.

	^ WebUtils jsonEncode: encodedSale! !

!TusLibrosEncoder class methodsFor: 'as yet unclassified' stamp: 'MP 11/27/2021 23:43:31'!
marshalBook: aBook

	^ Dictionary new
		at: 'isbn' put: aBook isbn;
		at: 'title' put: aBook title;
		yourself.
	! !

!TusLibrosEncoder class methodsFor: 'as yet unclassified' stamp: 'MP 11/27/2021 23:47:28'!
marshalCartContents: booksInCart

	| encodedBooksInCart |
	
	encodedBooksInCart _ OrderedCollection new.
	
	booksInCart contents keysAndValuesDo: [ :book :quantity |
		encodedBooksInCart add: (self encodeBook: book withQuantity: quantity) ].
	
	^ encodedBooksInCart asArray.! !

!TusLibrosEncoder class methodsFor: 'as yet unclassified' stamp: 'MP 11/27/2021 23:43:39'!
unmarshalBook: anEncodedBook

	^ Book
		titled: (anEncodedBook at: 'title')
		isbn: (anEncodedBook at: 'isbn').! !

!TusLibrosEncoder class methodsFor: 'as yet unclassified' stamp: 'MP 11/27/2021 23:47:58'!
unmarshalCartContents: decodedBooksInCart

	| booksInCart |

	booksInCart _ Bag new.
	
	decodedBooksInCart do: [ :encodedBookWithQuantity | | book quantity |
		book _ self unmarshalBook: (encodedBookWithQuantity at: 'book').
		quantity _ encodedBookWithQuantity at: 'quantity'.
		
		booksInCart add: book withOccurrences: quantity. ].
	
	^ booksInCart! !


!classDefinition: #TusLibrosRestServer category: 'TusLibros'!
Object subclass: #TusLibrosRestServer
	instanceVariableNames: 'port webServer tusLibrosSystem booksByISBN'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosRestServer methodsFor: 'books' stamp: 'MP 11/27/2021 22:24:51'!
catalog

	^ Dictionary new
		at: self firstBook put: self firstBookPrice;
		at: self secondBook put: self secondBookPrice;
		yourself.! !

!TusLibrosRestServer methodsFor: 'books' stamp: 'MP 11/27/2021 22:25:48'!
firstBook

	^ Book titled: 'Introduction to Algorithms' isbn: self firstBookISBN.! !

!TusLibrosRestServer methodsFor: 'books' stamp: 'MP 11/27/2021 22:25:14'!
firstBookISBN

	^'9780'! !

!TusLibrosRestServer methodsFor: 'books' stamp: 'MP 11/27/2021 22:24:47'!
firstBookPrice

	^ 119! !

!TusLibrosRestServer methodsFor: 'books' stamp: 'AF 11/20/2021 15:13:41'!
secondBook

	^ Book titled: 'Don Quijote de la Mancha' isbn: self secondBookISBN.! !

!TusLibrosRestServer methodsFor: 'books' stamp: 'MP 11/27/2021 22:25:22'!
secondBookISBN

	^ '8420'.! !

!TusLibrosRestServer methodsFor: 'books' stamp: 'MP 11/27/2021 22:24:51'!
secondBookPrice

	^ 999! !


!TusLibrosRestServer methodsFor: 'cards' stamp: 'AF 11/20/2021 15:28:30'!
cardWithoutFundsNumber
	
	^ '4509790000006789'! !

!TusLibrosRestServer methodsFor: 'cards' stamp: 'AF 11/20/2021 15:29:22'!
stolenCardNumber
	
	^ '4509790000000000'! !


!TusLibrosRestServer methodsFor: 'handlers' stamp: 'MP 11/17/2021 22:51:29'!
addService: serviceName withErrorSafeAction: action

	webServer
		addService: serviceName 
		action: [	 :request |
			[ action value: request ] 
			on: Error
			do: [ :error | request  send500Response: error messageText ].
		].
! !

!TusLibrosRestServer methodsFor: 'handlers' stamp: 'AF 11/13/2021 01:26:47'!
destroy
	
	webServer ifNotNil:[webServer destroy].! !

!TusLibrosRestServer methodsFor: 'handlers' stamp: 'AF 11/20/2021 15:00:03'!
findBookBy: anISBN
	
	
	^ booksByISBN at: anISBN ifAbsent: [self error: self class bookNotFoundErrorDescription ].! !

!TusLibrosRestServer methodsFor: 'handlers' stamp: 'AF 11/20/2021 14:51:17'!
handleAddProductToCart: request

	| cartId isbn quantity book |
	
	cartId _ (request fields at: 'cartId') asNumber.
	isbn _ request fields at: 'isbn'.
	quantity _ (request fields at: 'quantity') asNumber.
	
	book _ self findBookBy: isbn.	

	tusLibrosSystem add: quantity of: book to: cartId.

	request send200Response: 'OK'! !

!TusLibrosRestServer methodsFor: 'handlers' stamp: 'MP 11/27/2021 23:48:59'!
handleCatalog: request

	| catalog |
	catalog _ tusLibrosSystem catalog.

	request send200Response: (TusLibrosEncoder encodeCatalog: catalog)! !

!TusLibrosRestServer methodsFor: 'handlers' stamp: 'MP 11/27/2021 23:36:59'!
handleCheckout: request

	| cartId hardcodedCard sale |

	cartId _ (request fields at: 'cartId') asNumber.
	
	 "TODO: pedir la tarjeta"	
	hardcodedCard _ (Card
		withNumber: '4509790000001234'
		expiringAt: (September of: 2022)).

	sale _ tusLibrosSystem checkout: cartId charging: hardcodedCard.

	request send200Response: (TusLibrosEncoder encodeSale: sale)! !

!TusLibrosRestServer methodsFor: 'handlers' stamp: 'MP 11/17/2021 22:44:51'!
handleCreateCart: request

	 | password user |
	user _ request fields at: 'user'.
	password _ request fields at: 'password'.
	
	request send200Response: (WebUtils jsonEncode: (tusLibrosSystem createCartFor: user authenticatedBy: password))! !

!TusLibrosRestServer methodsFor: 'handlers' stamp: 'MP 11/27/2021 23:47:38'!
handleListCart: request

	| cartId |
				
	cartId _ (request fields at: 'cartId') asNumber.
	
	request send200Response: (TusLibrosEncoder encodeCartContents: (tusLibrosSystem listCart: cartId)). ! !

!TusLibrosRestServer methodsFor: 'handlers' stamp: 'MP 11/17/2021 22:47:07'!
handleListPurchases: request

	| user password userPurchases |
	user _ request fields at: 'user'.
	password _ request fields at: 'password'.

	userPurchases _ tusLibrosSystem listPurchasesOf: user authenticatedBy: password.

	"TODO: self encondePurchasesAsJson: userPurchases"
	request send200Response: (WebUtils jsonEncode: userPurchases asArray)! !

!TusLibrosRestServer methodsFor: 'handlers' stamp: 'MP 11/17/2021 22:43:07'!
handlePing: request

	request send200Response: 'pumba'! !

!TusLibrosRestServer methodsFor: 'handlers' stamp: 'AF 11/20/2021 15:32:12'!
initializeOn: aPortNumber
	| authenticationSystem |
	
	webServer _ WebServer new listenOn: aPortNumber.
	authenticationSystem _ ConfigurableAuthenticationSystem new 
		register: 'haw' authenticatedBy: 'hunter2'.
	
	tusLibrosSystem _ TusLibrosSystemFacade 
		authenticatingWith: authenticationSystem
		sourcingProductsFrom: self catalog
		chargingThrough: self simulatedMP 
		withClock: SystemClock new. 
	
	booksByISBN _ Dictionary new 
		at: self firstBookISBN put: self firstBook;
		at: self secondBookISBN put: self secondBook;
		yourself.
	
	webServer addService: '/ping'
		action: [ :request |	 self handlePing: request ].
	
	self addService: '/catalog' 
		withErrorSafeAction: [ :request | self handleCatalog: request ].
	
	self addService: '/createCart' 
		withErrorSafeAction: [ :request | self handleCreateCart: request ].
	
	self addService: '/addProductToCart'
		withErrorSafeAction: [ :request | self handleAddProductToCart: request ].
		
	self addService: '/listCart'
		withErrorSafeAction: [ :request | self handleListCart: request ].

	self addService: '/listPurchases'
		withErrorSafeAction: [ :request | self handleListPurchases: request ].

	self addService: '/checkout'
		withErrorSafeAction: [ :request | self handleCheckout: request. ].
		
	! !

!TusLibrosRestServer methodsFor: 'handlers' stamp: 'AF 11/20/2021 15:32:12'!
simulatedMP

	^ SimulatedMP
		withNoFundsCard: self cardWithoutFundsNumber
		stolenCard: self stolenCardNumber.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosRestServer class' category: 'TusLibros'!
TusLibrosRestServer class
	instanceVariableNames: ''!

!TusLibrosRestServer class methodsFor: 'as yet unclassified' stamp: 'AF 11/20/2021 15:02:38'!
bookNotFoundErrorDescription
 
	^ 'book with that ISBN not found'! !

!TusLibrosRestServer class methodsFor: 'as yet unclassified' stamp: 'IAR 11/15/2021 20:29:51'!
cleanUpAndListenOn: aPortNumber

	self destroyAllInstances.
	^ self listeningOn: aPortNumber.! !

!TusLibrosRestServer class methodsFor: 'as yet unclassified' stamp: 'AF 11/13/2021 01:39:26'!
destroyAllInstances

	self allInstancesDo: [ :anInstance | anInstance destroy ].! !

!TusLibrosRestServer class methodsFor: 'as yet unclassified' stamp: 'AF 11/11/2021 21:26:55'!
listeningOn: aPortNumber

	^self new initializeOn: aPortNumber.! !


!classDefinition: #TusLibrosSystemFacade category: 'TusLibros'!
Object subclass: #TusLibrosSystemFacade
	instanceVariableNames: 'authenticationSystem catalog activeCarts lastCartId clock cartLastAccessedTimes salesBook cashier'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosSystemFacade methodsFor: 'initialization' stamp: 'MP 11/27/2021 23:28:46'!
initializeAuthenticatingWith: anAuthenticationSystem
sourcingProductsFrom: aCatalog
chargingThrough: aMerchantProcessor
withClock: aClock
	
	authenticationSystem _ anAuthenticationSystem.
	catalog _ aCatalog.
	cashier _ Cashier chargingThrough: aMerchantProcessor.
	clock _ aClock.
	
	activeCarts _ Dictionary new.
	cartLastAccessedTimes _ Dictionary new.
	salesBook _ OrderedCollection new.

	lastCartId _ 0.
! !


!TusLibrosSystemFacade methodsFor: 'assertions' stamp: 'MP 11/9/2021 01:10:50'!
assert: aUser canBeAuthenticatedBy: aPassword

	^ (authenticationSystem can: aUser beAuthenticatedBy: aPassword)
		ifFalse: [ self error: TusLibrosSystemFacade invalidCredentialsErrorDescription ]! !

!TusLibrosSystemFacade methodsFor: 'assertions' stamp: 'MP 11/9/2021 02:30:01'!
assertCartIsNotExpired: anActiveCart

	anActiveCart isExpired ifTrue: [ self error: self class expiredCartErrorDescription ].! !


!TusLibrosSystemFacade methodsFor: 'rest interface - private' stamp: 'MP 11/9/2021 02:36:51'!
createCartFor: aUser

	| activeCart |
	activeCart _ ActiveCart
		acceptingProductsFrom: catalog
		keepingTimeWith: clock
		createdBy: aUser
		identifiedBy: self nextCartId.

	activeCarts at: activeCart id put: activeCart.
	
	^ activeCart id.! !

!TusLibrosSystemFacade methodsFor: 'rest interface - private' stamp: 'MP 11/9/2021 02:31:08'!
findActiveCart: aCartId

	activeCarts at: aCartId 
		ifPresent: [ :anActiveCart |
			self assertCartIsNotExpired: anActiveCart.
			^ anActiveCart.
		]
		ifAbsent: [ self error: self class invalidCartIdErrorDescription ].! !

!TusLibrosSystemFacade methodsFor: 'rest interface - private' stamp: 'AF 11/5/2021 00:46:19'!
nextCartId
	
	lastCartId _ lastCartId + 1.
	^lastCartId! !

!TusLibrosSystemFacade methodsFor: 'rest interface - private' stamp: 'MP 11/9/2021 02:31:01'!
selectPurchasesOf: aUser

	^ salesBook select: [ :aUserSale | aUserSale user = aUser ]! !


!TusLibrosSystemFacade methodsFor: 'rest interface' stamp: 'MP 11/9/2021 02:07:49'!
add: aQuantity of: aProduct to: aCartId 
	
	(self findActiveCart: aCartId) add: aQuantity of: aProduct.! !

!TusLibrosSystemFacade methodsFor: 'rest interface' stamp: 'MP 11/19/2021 00:44:34'!
catalog

	^ catalog keys asOrderedCollection.! !

!TusLibrosSystemFacade methodsFor: 'rest interface' stamp: 'MP 11/27/2021 23:21:39'!
checkout: aCartId charging: aCard 
	
	| anActiveCart receipt sale |

	anActiveCart _ self findActiveCart: aCartId.
	receipt _ cashier checkout: anActiveCart charging: aCard on: clock now.

	sale _ Sale
		by: anActiveCart user
		of: anActiveCart contents
		totalling: receipt.

	salesBook add: sale.

	^ sale.! !

!TusLibrosSystemFacade methodsFor: 'rest interface' stamp: 'MP 11/9/2021 02:34:52'!
createCartFor: aUser authenticatedBy: aPassword 
	
	self assert: aUser canBeAuthenticatedBy: aPassword.

	^ self createCartFor: aUser.! !

!TusLibrosSystemFacade methodsFor: 'rest interface' stamp: 'MP 11/9/2021 02:30:17'!
listCart: aCartId

	^ (self findActiveCart: aCartId) contents.
! !

!TusLibrosSystemFacade methodsFor: 'rest interface' stamp: 'MP 11/27/2021 23:25:59'!
listPurchasesOf: aUser authenticatedBy: aPassword

	self assert: aUser canBeAuthenticatedBy: aPassword.
	
	^ self selectPurchasesOf: aUser
	"TODO: falta el total".! !

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
