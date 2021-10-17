!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'assertions' stamp: 'MP 10/17/2021 01:45:07'!
shouldRaiseErrorWhenAdding: financialService to: portfolio

	self should: [ portfolio addFinancialService: financialService ]  
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :error | 
			self assert: Portfolio cantAddFinancialServiceErrorDescription 
				equals: error messageText 
		].! !


!PortfolioTest methodsFor: 'error conditions' stamp: 'MP 10/17/2021 01:45:21'!
test14CantAddDuplicateAccount
	| portfolio account |
	
	account _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	
	portfolio addFinancialService: account.
	
	self shouldRaiseErrorWhenAdding: account to: portfolio.

! !

!PortfolioTest methodsFor: 'error conditions' stamp: 'MP 10/17/2021 01:45:40'!
test15CantAddAccountIncludedInChildPortfolio
	| portfolioA portfolioB account |
	
	account _ ReceptiveAccount new.
	portfolioA _ Portfolio new.
	portfolioB _ Portfolio new.
	
	portfolioB addFinancialService: account.
	portfolioA addFinancialService: portfolioB.
	
	self shouldRaiseErrorWhenAdding: account to: portfolioA

! !

!PortfolioTest methodsFor: 'error conditions' stamp: 'MP 10/17/2021 01:46:04'!
test16CantAddAccountIncludedInTheParentPortfolio

	| portfolioA portfolioB account |
	
	account _ ReceptiveAccount new.
	portfolioA _ Portfolio new.
	portfolioB _ Portfolio new.
	
	portfolioA addFinancialService: account.
	portfolioA addFinancialService: portfolioB.
	
	self shouldRaiseErrorWhenAdding: account to: portfolioB.! !

!PortfolioTest methodsFor: 'error conditions' stamp: 'MP 10/17/2021 01:46:16'!
test17CantAddAccountIncludedInAParent 

	| account portfolioA portfolioB portfolioC |
	
	account _ ReceptiveAccount new.
	portfolioA _ Portfolio new.
	portfolioB _ Portfolio new.
	portfolioC _ Portfolio new.
	
	portfolioA addFinancialService: account.
	portfolioA addFinancialService: portfolioC.
	portfolioB addFinancialService: portfolioC.
	
	self shouldRaiseErrorWhenAdding: account to: portfolioC.! !

!PortfolioTest methodsFor: 'error conditions' stamp: 'MP 10/17/2021 01:46:31'!
test18CantAddAccountIncludedInAnAncestor

	| account portfolioA portfolioB portfolioC |
	
	account _ ReceptiveAccount new.
	portfolioA _ Portfolio new.
	portfolioB _ Portfolio new.
	portfolioC _ Portfolio new.
	
	portfolioA addFinancialService: account.
	portfolioA addFinancialService: portfolioB.
	portfolioB addFinancialService: portfolioC.
	
	self shouldRaiseErrorWhenAdding: account to: portfolioC.! !

!PortfolioTest methodsFor: 'error conditions' stamp: 'MP 10/17/2021 01:46:48'!
test19CantAddDuplicatePortfolio
	| portfolioA portfolioB |
	portfolioA _ Portfolio new.
	portfolioB _ Portfolio new.
	
	portfolioA addFinancialService: portfolioB.
		
	self shouldRaiseErrorWhenAdding: portfolioB to: portfolioA.! !

!PortfolioTest methodsFor: 'error conditions' stamp: 'MP 10/17/2021 01:47:03'!
test20CantAddPortfolioToItself
	| portfolioA |
	portfolioA _ Portfolio new.	
	
	self shouldRaiseErrorWhenAdding: portfolioA to: portfolioA.! !

!PortfolioTest methodsFor: 'error conditions' stamp: 'MP 10/17/2021 01:47:23'!
test21CantAddPortfolioContainedInChildPortfolio
	| portfolioA portfolioB portfolioC |
	portfolioA _ Portfolio new.	
	portfolioB _ Portfolio new.
	portfolioC _ Portfolio new.
	
	portfolioA addFinancialService: portfolioB.
	portfolioB addFinancialService: portfolioC.
	
	self shouldRaiseErrorWhenAdding: portfolioC to: portfolioA.! !

!PortfolioTest methodsFor: 'error conditions' stamp: 'MP 10/17/2021 01:47:37'!
test22CantAddPortfolioWithSelfAsChild
	| portfolioA portfolioB |
	portfolioA _ Portfolio new.	
	portfolioB _ Portfolio new.
	
	portfolioB addFinancialService: portfolioA.
	
	self shouldRaiseErrorWhenAdding: portfolioB to: portfolioA.! !

!PortfolioTest methodsFor: 'error conditions' stamp: 'MP 10/17/2021 01:47:53'!
test23CantAddPortfolioContainingADescendantOfSelf
	| portfolioA portfolioB portfolioC |
	
	"Pasó de una, pero lo hicimos para confirmar que esté completa la implementación y lo dejamos
	para que se vea el proceso completo de TDD."
	
	portfolioA _ Portfolio new.	
	portfolioB _ Portfolio new.
	portfolioC _ Portfolio new.
	
	portfolioA addFinancialService: portfolioC.
	portfolioB addFinancialService: portfolioC.
	
	self shouldRaiseErrorWhenAdding: portfolioB to: portfolioA.! !

!PortfolioTest methodsFor: 'error conditions' stamp: 'MP 10/17/2021 01:48:11'!
test24CantAddPortfolioContainingADescendantOfMyRoots
	| portfolioA portfolioB portfolioC portfolioR |
	portfolioR _ Portfolio new.
	portfolioA _ Portfolio new.	
	portfolioB _ Portfolio new.
	portfolioC _ Portfolio new.
	
	portfolioR addFinancialService: portfolioC.
	portfolioR addFinancialService: portfolioA.
	portfolioB addFinancialService: portfolioC.
	
	
	self shouldRaiseErrorWhenAdding: portfolioB to: portfolioA.! !

!PortfolioTest methodsFor: 'error conditions' stamp: 'MP 10/17/2021 01:48:34'!
test25CantAddAPortfolioContainingAnAccountDescendantOfSelf
	| portfolioA portfolioB account |
	portfolioA _ Portfolio new.	
	portfolioB _ Portfolio new.
	account _ ReceptiveAccount new.
	
	portfolioA addFinancialService: account.
	portfolioB addFinancialService: account.
	
	
	self shouldRaiseErrorWhenAdding: portfolioB to: portfolioA! !

!PortfolioTest methodsFor: 'error conditions' stamp: 'MP 10/17/2021 01:49:01'!
test26CantAddAPortfolioContainingAnAccountDescendantOfMyRoots
	| portfolioA portfolioB account portfolioV portfolioW |
	
	"Pasó de una, pero lo hicimos para confirmar que esté completa la implementación y lo dejamos
	para que se vea el proceso completo de TDD."

	portfolioW _ Portfolio new.
	portfolioV _ Portfolio new.
	portfolioA _ Portfolio new.	
	portfolioB _ Portfolio new.
	
	account _ ReceptiveAccount new.
	
	portfolioW addFinancialService: account.
	portfolioW addFinancialService: portfolioA.
	portfolioV addFinancialService: portfolioA.
	
	portfolioB addFinancialService: account.
	
	self shouldRaiseErrorWhenAdding: portfolioB to: portfolioA
! !

!PortfolioTest methodsFor: 'error conditions' stamp: 'MP 10/17/2021 02:16:03'!
test27CantAddPortfolioFormingRombus
	| portfolioA portfolioC portfolioD portfolioR |

	portfolioA _ Portfolio new.
	portfolioD _ Portfolio new.
	portfolioC _ Portfolio new.	
	portfolioR _ Portfolio new.
	
	portfolioC addFinancialService: portfolioA.
	portfolioD addFinancialService: portfolioA.
	portfolioR addFinancialService: portfolioC.
	
	self shouldRaiseErrorWhenAdding: portfolioD to: portfolioR
! !


!PortfolioTest methodsFor: 'portfolio operations' stamp: 'MP 10/17/2021 01:50:14'!
test01EmptyPortfolioHasZeroBalance

	| portfolio |
	portfolio _ Portfolio new.
	
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'portfolio operations' stamp: 'AF 10/16/2021 17:04:35'!
test02EmptyPortfolioHasNoRegisteredTransactions

	| portfolio account transaction |
	portfolio _ Portfolio new.
	account _ ReceptiveAccount new.
	transaction _ Deposit register: 100 on: account. 
	
	self deny: (portfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'portfolio operations' stamp: 'MP 10/17/2021 01:11:07'!
test03EmptyPortfolioHasNoTransactions

	| portfolio |
	portfolio _ Portfolio new.

	self assert: portfolio transactions isEmpty.! !

!PortfolioTest methodsFor: 'portfolio operations' stamp: 'MP 10/17/2021 01:14:04'!
test04PortfolioWithSingleAccountHasItsValueAsBalance

	| portfolio account |
	account _ ReceptiveAccount new.
	Deposit register: 100 on: account.
	
	portfolio _ Portfolio new.
	portfolio addFinancialService: account.

	self assert: 100 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'portfolio operations' stamp: 'MP 10/17/2021 01:17:47'!
test05PortfolioWithAccountsHasItsTransacitions

	| portfolio account expectedTransactions transaction |
	account _ ReceptiveAccount new.
	transaction _ Deposit register: 100 on: account.
	
	portfolio _ Portfolio new.
	portfolio addFinancialService: account.

	expectedTransactions _ OrderedCollection with: transaction.
	self assert: expectedTransactions equals: portfolio transactions.! !

!PortfolioTest methodsFor: 'portfolio operations' stamp: 'MP 10/17/2021 01:18:01'!
test06PortfolioWithAccountsHasItsTransactionsRegistered

	| portfolio account transaction |
	account _ ReceptiveAccount new.
	transaction _ Deposit register: 100 on: account.
	
	portfolio _ Portfolio new.
	portfolio addFinancialService: account.

	self assert: (portfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'portfolio operations' stamp: 'MP 10/17/2021 01:14:11'!
test07PortfolioWithMultipleAccountsSumsTheirValuesAsBalance

	| portfolio account1 account2 |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	Deposit register: 100 on: account1.
	Deposit register: 50 on: account2.

	portfolio _ Portfolio new.
	portfolio addFinancialService: account1.
	portfolio addFinancialService: account2.

	self assert: 150 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'portfolio operations' stamp: 'MP 10/17/2021 01:13:01'!
test08PortfolioWithSinglePortfolioHasItsBalance

	| portfolio1 portfolio2 account |
	
	account _ ReceptiveAccount new.
	Deposit register: 100 on: account.

	portfolio1 _ Portfolio new.
	portfolio2 _ Portfolio new.
	portfolio1 addFinancialService: account.
	portfolio2 addFinancialService: portfolio1.
	

	self assert: 100 equals: (portfolio2 balance).! !

!PortfolioTest methodsFor: 'portfolio operations' stamp: 'MP 10/17/2021 01:13:31'!
test09PortfolioWithMultiplePortfoliosSumsTheirBalances

	| portfolio1 portfolio2 portfolio3 account1 account2 |
	
	account1 _ ReceptiveAccount new.
	Deposit register: 100 on: account1.

	account2 _ ReceptiveAccount new.
	Deposit register: 50 on: account2.
	
	portfolio1 _ Portfolio new.
	portfolio2 _ Portfolio new.
	portfolio3 _ Portfolio new.
	
	portfolio1 addFinancialService: account1.
	portfolio2 addFinancialService: account2.
	
	portfolio3 addFinancialService: portfolio1.
	portfolio3 addFinancialService: portfolio2.

	self assert: 150 equals: (portfolio3 balance).! !

!PortfolioTest methodsFor: 'portfolio operations' stamp: 'MP 10/17/2021 01:14:33'!
test10PortfolioWithSinglePortfolioHasItsTransactionsRegistered

	| portfolio account1 account2 transaction |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 100 on: account1.
	transaction _ Deposit register: 50 on: account2.
	
	portfolio _ Portfolio new.
	portfolio addFinancialService: account1.
	portfolio addFinancialService: account2.

	self assert: (portfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'portfolio operations' stamp: 'MP 10/17/2021 01:14:58'!
test11PortfolioWithMultiplePortfoliosHasTheirTransactionsRegistered

	| account transaction portfolio1 portfolio2 |
	
	account _ ReceptiveAccount new.
	
	
	Deposit register: 100 on: account.
	transaction _ Deposit register: 50 on: account.
	
	portfolio1 _ Portfolio new.
	portfolio2 _ Portfolio new.
	
	portfolio1 addFinancialService: account.
	portfolio2 addFinancialService: portfolio1.

	self assert: (portfolio2 hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'portfolio operations' stamp: 'MP 10/17/2021 01:49:59'!
test12PortfolioWithSinglePortfolioHasItsTransactions

	| portfolio account1 expectedTransactions transaction1 account2 transaction2 |

	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	transaction1 _ Deposit register: 100 on: account1.
	transaction2 _ Deposit register: 100 on: account2.	
	
	portfolio _ Portfolio new.
	portfolio addFinancialService: account1.
	portfolio addFinancialService: account2.

	expectedTransactions _ OrderedCollection with: transaction1 with: transaction2.
	self assert: expectedTransactions equals: portfolio transactions.! !

!PortfolioTest methodsFor: 'portfolio operations' stamp: 'MP 10/17/2021 01:15:37'!
test13PortfolioWithMultiplePortfoliosHasTheirTransactions

	| portfolioA portfolioB account1 account2 expectedTransactions transaction1 transaction2 |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	transaction1 _ Deposit register: 100 on: account1.
	transaction2 _ Deposit register: 100 on: account2.	
	
	portfolioA _ Portfolio new.
	portfolioB _ Portfolio new.
	
	portfolioA addFinancialService: account1.
	portfolioB addFinancialService: account2.
	
	portfolioB addFinancialService: portfolioA.

	expectedTransactions _ OrderedCollection with: transaction2 with: transaction1.
	self assert: expectedTransactions equals: portfolioB transactions.! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MP 10/17/2021 02:16:43'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MP 10/7/2021 20:55:58'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.

	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'balance - private' stamp: 'MP 10/7/2021 20:48:16'!
applyToBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'balance - private' stamp: 'MP 10/7/2021 20:49:19'!
applyToBalance: aBalance

	^ aBalance + value.! !


!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'balance - private' stamp: 'MP 10/7/2021 20:48:38'!
applyToBalance: aBalance

	^aBalance - value.! !


!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #FinancialService category: 'Portfolio-Ejercicio'!
Object subclass: #FinancialService
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!FinancialService methodsFor: 'accesing' stamp: 'MP 10/14/2021 21:33:26'!
balance

	self subclassResponsibility ! !

!FinancialService methodsFor: 'accesing' stamp: 'MP 10/14/2021 21:34:09'!
transactions

	self subclassResponsibility ! !


!FinancialService methodsFor: 'adding - private' stamp: 'MP 10/17/2021 01:38:39'!
addToPortfolio: aPortfolio

	self subclassResponsibility.! !


!FinancialService methodsFor: 'testing' stamp: 'AF 10/16/2021 15:55:45'!
containsAccount: aReceptiveAccount 
	self subclassResponsibility.! !

!FinancialService methodsFor: 'testing' stamp: 'AF 10/16/2021 18:46:31'!
containsPortfolio: aPortfolio
 
	self subclassResponsibility.! !

!FinancialService methodsFor: 'testing' stamp: 'MP 10/14/2021 21:33:57'!
hasRegistered: aTransaction

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
FinancialService subclass: #Portfolio
	instanceVariableNames: 'financialServices parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'accessing' stamp: 'MP 10/14/2021 21:37:43'!
balance
	
	^financialServices sum: [ :financialService | financialService balance ] ifEmpty: [ 0 ].! !

!Portfolio methodsFor: 'accessing' stamp: 'MP 10/17/2021 01:26:25'!
transactions
	
	| allTransactions |
	
	allTransactions _ OrderedCollection new.

	financialServices do: [ :financialService |  allTransactions addAll: financialService transactions ].
	
	^allTransactions.! !


!Portfolio methodsFor: 'adding' stamp: 'MP 10/17/2021 01:53:53'!
addFinancialService: aFinancialService 

	aFinancialService addToPortfolio: self.! !


!Portfolio methodsFor: 'adding - private' stamp: 'MP 10/17/2021 02:05:27'!
addPortfolio: aPortfolio

	self assertPortfolioCanBeAdded: aPortfolio.

	aPortfolio registerParent: self.
	financialServices add: aPortfolio.! !

!Portfolio methodsFor: 'adding - private' stamp: 'MP 10/17/2021 02:01:25'!
addReceptiveAccount: aReceptiveAccount

	self assertAccountIsntContained: aReceptiveAccount.

	financialServices add: aReceptiveAccount.! !

!Portfolio methodsFor: 'adding - private' stamp: 'MP 10/17/2021 01:52:01'!
addToPortfolio: aPortfolio

	aPortfolio addPortfolio: self.! !

!Portfolio methodsFor: 'adding - private' stamp: 'MP 10/17/2021 02:04:15'!
assertAccountIsntContained: aReceptiveAccount

	(self roots anySatisfy: [ :root | root containsAccount: aReceptiveAccount ])
		ifTrue: [ self error: self class cantAddFinancialServiceErrorDescription ]! !

!Portfolio methodsFor: 'adding - private' stamp: 'MP 10/17/2021 02:05:47'!
assertPortfolioCanBeAdded: aPortfolio

	(self roots anySatisfy: [ :root | aPortfolio cannotBeAddedTo: root])
		ifTrue: [ self error: self class cantAddFinancialServiceErrorDescription ]! !

!Portfolio methodsFor: 'adding - private' stamp: 'MP 10/17/2021 02:10:10'!
cannotBeAddedTo: aPortfolio 

	^(aPortfolio containsPortfolio: self) or: 
		[ financialServices anySatisfy: [ :financialService | financialService cannotBeAddedTo: aPortfolio ] ].! !

!Portfolio methodsFor: 'adding - private' stamp: 'MP 10/17/2021 02:08:33'!
isRoot

	^parents isEmpty.! !

!Portfolio methodsFor: 'adding - private' stamp: 'MP 10/17/2021 01:26:44'!
registerParent: aPortfolio

	parents add: aPortfolio.! !

!Portfolio methodsFor: 'adding - private' stamp: 'MP 10/17/2021 02:08:57'!
roots

	| listOfRoots |
	
	self isRoot ifTrue: [ ^OrderedCollection with: self ].
	
	listOfRoots _ OrderedCollection new.
	parents do: [ :parent | listOfRoots addAll: parent roots].
	^listOfRoots.! !


!Portfolio methodsFor: 'initialization' stamp: 'AF 10/16/2021 16:35:53'!
initialize

	financialServices _ OrderedCollection new.
	parents _ OrderedCollection new. ! !


!Portfolio methodsFor: 'testing' stamp: 'MP 10/17/2021 01:27:46'!
containsAccount: aReceptiveAccount 
	
	^financialServices anySatisfy: [ :financialService | 
		financialService containsAccount: aReceptiveAccount ].! !

!Portfolio methodsFor: 'testing' stamp: 'MP 10/17/2021 01:32:27'!
containsPortfolio: aPortfolio

	^(aPortfolio = self) or: [ self anyChildContainsPortfolio: aPortfolio ].! !

!Portfolio methodsFor: 'testing' stamp: 'MP 10/17/2021 01:33:59'!
hasRegistered: aTransaction

	^financialServices anySatisfy: [
		:financialService | financialService hasRegistered: aTransaction ].
! !


!Portfolio methodsFor: 'testing - private' stamp: 'MP 10/17/2021 01:32:23'!
anyChildContainsPortfolio: aPortfolio

	^ financialServices anySatisfy: [ 
				:aFinancialService | aFinancialService containsPortfolio: aPortfolio ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error descriptions' stamp: 'AF 10/16/2021 15:17:07'!
cantAddFinancialServiceErrorDescription
	^ 'financial service already present'! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
FinancialService subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'accessing' stamp: 'MP 10/7/2021 20:47:22'!
balance

	| balance |
	balance _ 0.
	transactions do: [ :aTransaction | balance _ aTransaction applyToBalance: balance ].
	^balance.! !

!ReceptiveAccount methodsFor: 'accessing' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'accessing' stamp: 'MP 10/17/2021 01:26:19'!
transactions 

	^transactions copy! !


!ReceptiveAccount methodsFor: 'adding - private' stamp: 'MP 10/17/2021 01:51:40'!
addToPortfolio: aPortfolio

	aPortfolio addReceptiveAccount: self.! !

!ReceptiveAccount methodsFor: 'adding - private' stamp: 'AF 10/16/2021 19:34:50'!
cannotBeAddedTo: aPortfolio
	
	^aPortfolio containsAccount: self.! !


!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'AF 10/16/2021 16:02:40'!
containsAccount: aReceptiveAccount

	^aReceptiveAccount = self.! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'AF 10/16/2021 18:51:39'!
containsPortfolio: aPortfolio

	^false.! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'MP 10/17/2021 01:26:10'!
hasRegistered: aTransaction

	^transactions includes: aTransaction 
! !
