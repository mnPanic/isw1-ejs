!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MP 10/7/2021 20:59:17'!
test01

	| portfolio |
	portfolio _ Portfolio new.
	
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MP 10/7/2021 21:02:05'!
test02

	| portfolio account transaction |
	portfolio _ Portfolio new.
	account _ ReceptiveAccount new.
	transaction _ Deposit register: 100 on: account. 
	
	self deny: (portfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MP 10/7/2021 21:03:08'!
test03

	| portfolio |
	portfolio _ Portfolio new.

	self assert: portfolio transactions isEmpty.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MP 10/14/2021 21:36:44'!
test04

	| portfolio account |
	account _ ReceptiveAccount new.
	Deposit register: 100 on: account.
	
	portfolio _ Portfolio new.
	portfolio addFinancialService: account.

	self assert: 100 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MP 10/14/2021 21:35:57'!
test05

	| portfolio account expectedTransactions transaction |
	account _ ReceptiveAccount new.
	transaction _ Deposit register: 100 on: account.
	
	portfolio _ Portfolio new.
	portfolio addFinancialService: account.

	expectedTransactions _ OrderedCollection with: transaction.
	self assert: expectedTransactions equals: portfolio transactions.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MP 10/14/2021 21:36:01'!
test06

	| portfolio account transaction |
	account _ ReceptiveAccount new.
	transaction _ Deposit register: 100 on: account.
	
	portfolio _ Portfolio new.
	portfolio addFinancialService: account.

	self assert: (portfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MP 10/14/2021 21:36:08'!
test07

	| portfolio account1 account2 |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	Deposit register: 100 on: account1.
	Deposit register: 50 on: account2.

	portfolio _ Portfolio new.
	portfolio addFinancialService: account1.
	portfolio addFinancialService: account2.

	self assert: 150 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MP 10/14/2021 21:36:12'!
test08

	| portfolio1 portfolio2 account |
	
	account _ ReceptiveAccount new.
	Deposit register: 100 on: account.

	portfolio1 _ Portfolio new.
	portfolio2 _ Portfolio new.
	portfolio1 addFinancialService: account.
	portfolio2 addFinancialService: portfolio1.
	

	self assert: 100 equals: (portfolio2 balance).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MP 10/14/2021 21:36:17'!
test09

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

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MP 10/14/2021 21:36:20'!
test10

	| portfolio account1 account2 transaction |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 100 on: account1.
	transaction _ Deposit register: 50 on: account2.
	
	portfolio _ Portfolio new.
	portfolio addFinancialService: account1.
	portfolio addFinancialService: account2.

	self assert: (portfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MP 10/14/2021 21:36:26'!
test11

	| account transaction portfolio1 portfolio2 |
	
	account _ ReceptiveAccount new.
	
	
	Deposit register: 100 on: account.
	transaction _ Deposit register: 50 on: account.
	
	portfolio1 _ Portfolio new.
	portfolio2 _ Portfolio new.
	
	portfolio1 addFinancialService: account.
	portfolio2 addFinancialService: portfolio1.

	self assert: (portfolio2 hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MP 10/14/2021 21:36:30'!
test12

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

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MP 10/14/2021 21:36:35'!
test13

	| portfolio1 account1 expectedTransactions transaction1 account2 transaction2 portfolio2 |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	transaction1 _ Deposit register: 100 on: account1.
	transaction2 _ Deposit register: 100 on: account2.	
	
	portfolio1 _ Portfolio new.
	portfolio2 _ Portfolio new.
	
	portfolio1 addFinancialService: account1.
	portfolio2 addFinancialService: account2.
	
	portfolio2 addFinancialService: portfolio1.

	expectedTransactions _ OrderedCollection with: transaction2 with: transaction1.
	self assert: expectedTransactions equals: portfolio2 transactions.! !


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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
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

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance - private' stamp: 'MP 10/7/2021 20:48:16'!
applyToBalance: aBalance

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

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance - private' stamp: 'MP 10/7/2021 20:49:19'!
applyToBalance: aBalance

	^ aBalance + value.! !

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

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance - private' stamp: 'MP 10/7/2021 20:48:38'!
applyToBalance: aBalance

	^aBalance - value.! !

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

!FinancialService methodsFor: 'balance' stamp: 'MP 10/14/2021 21:33:26'!
balance

	self subclassResponsibility ! !


!FinancialService methodsFor: 'transactions' stamp: 'MP 10/14/2021 21:34:09'!
transactions

	self subclassResponsibility ! !


!FinancialService methodsFor: 'testing' stamp: 'MP 10/14/2021 21:33:57'!
hasRegistered: aTransaction

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
FinancialService subclass: #Portfolio
	instanceVariableNames: 'financialServices'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'MP 10/14/2021 21:37:43'!
balance
	
	^financialServices sum: [ :financialService | financialService balance ] ifEmpty: [ 0 ].! !


!Portfolio methodsFor: 'transactions' stamp: 'MP 10/14/2021 21:38:20'!
transactions
	
	| allTransactions |
	
	allTransactions _ OrderedCollection new.

	financialServices do: [ :financialService |  allTransactions addAll: financialService transactions ].
	
	^ allTransactions.! !


!Portfolio methodsFor: 'accessing' stamp: 'MP 10/14/2021 21:34:56'!
addFinancialService: aFinancialService 
	
	financialServices add: aFinancialService! !


!Portfolio methodsFor: 'testing' stamp: 'MP 10/14/2021 21:38:03'!
hasRegistered: aTransaction
	
	^financialServices anySatisfy: [ :financialService | financialService hasRegistered: aTransaction ]! !


!Portfolio methodsFor: 'initialization' stamp: 'MP 10/14/2021 21:35:17'!
initialize

	financialServices _ OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
FinancialService subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'MP 10/7/2021 20:47:22'!
balance

	| balance |
	balance _ 0.
	transactions do: [ :aTransaction | balance _ aTransaction applyToBalance: balance ].
	^balance.! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
