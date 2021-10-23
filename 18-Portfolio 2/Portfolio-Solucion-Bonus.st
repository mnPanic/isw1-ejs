!classDefinition: #PortfolioTest category: 'Portfolio-Solucion-Bonus'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion-Bonus'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 5/27/2021 17:36:04'!
test02BalanceOfPortfolioWithAccountsIsSumOfAccountsBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Solucion-Bonus'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion-Bonus'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!ReceptiveAccountTest methodsFor: 'transfer' stamp: 'MP 10/19/2021 17:53:48'!
assertCantRegisterTransferFor: aValue from: aSourceAccount to: aDestinationAccount

	^ self should: [ Transfer register: aValue from: aSourceAccount to: aDestinationAccount. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: Transfer cannotRegisterTransferErrorDescription equals: anException messageText ]! !

!ReceptiveAccountTest methodsFor: 'transfer' stamp: 'MP 10/19/2021 17:50:34'!
test08TransferMovesValueFromSourceToDestinationAccount

	| destinationAccount sourceAccount aValue |
	
	sourceAccount _ ReceptiveAccount new.
	destinationAccount _ ReceptiveAccount new.
	
	aValue _ 100.
	
	Transfer register: aValue from: sourceAccount to: destinationAccount.
	
	self assert: aValue negated equals: sourceAccount balance.
	self assert: aValue equals: destinationAccount balance.
	
	! !

!ReceptiveAccountTest methodsFor: 'transfer' stamp: 'MP 10/19/2021 17:48:17'!
test09TransferEndsAreTraversable

	| transfer |
		
	transfer _ Transfer register: 100 from: ReceptiveAccount new to: ReceptiveAccount new.
	
	self assert: transfer source equals: transfer destination otherEnd.	
	self assert: transfer destination equals: transfer source otherEnd.	

	! !

!ReceptiveAccountTest methodsFor: 'transfer' stamp: 'MP 10/19/2021 17:55:40'!
test10CannotRegisterTransferWithValueZero
		
	self assertCantRegisterTransferFor: 0 from: ReceptiveAccount new to: ReceptiveAccount new.! !

!ReceptiveAccountTest methodsFor: 'transfer' stamp: 'MP 10/19/2021 17:55:44'!
test11CannotRegisterTransferWithNegativeValue
		
	self assertCantRegisterTransferFor: -1 from: ReceptiveAccount new to: ReceptiveAccount new.! !

!ReceptiveAccountTest methodsFor: 'transfer' stamp: 'MP 10/19/2021 17:55:48'!
test12CannotTransferToYourself
	
	| anAccount |

	anAccount _ ReceptiveAccount new.
	self assertCantRegisterTransferFor: 10 from: anAccount to: anAccount.! !


!classDefinition: #ReportTest category: 'Portfolio-Solucion-Bonus'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion-Bonus'!

!ReportTest methodsFor: 'transfer net report' stamp: 'IAR 10/23/2021 15:41:00'!
test07TransferNetOfEmptyAccountIsZero

	| account |
	account _ ReceptiveAccount new.
	
	self assert: 0 equals: (TransferNetReport for: account) compute.! !

!ReportTest methodsFor: 'transfer net report' stamp: 'IAR 10/23/2021 15:41:00'!
test08TransferNetOfAccountWithTransferSourceSubstractsItsValue

	| account |
	account _ ReceptiveAccount new.
	Transfer register: 10 from: account to: ReceptiveAccount new.
	
	self assert: -10 equals: (TransferNetReport for: account) compute.! !

!ReportTest methodsFor: 'transfer net report' stamp: 'IAR 10/23/2021 15:41:00'!
test09TransferNetConsidersJustTransfers

	| firstAccount secondAccount |
	firstAccount _ ReceptiveAccount new.
	secondAccount _ ReceptiveAccount new.

	Transfer register: 10 from: firstAccount to: secondAccount.
	Withdraw register: 10 on: firstAccount.
	
	self assert: -10 equals: (TransferNetReport for: firstAccount) compute.! !

!ReportTest methodsFor: 'transfer net report' stamp: 'IAR 10/23/2021 15:41:00'!
test10TransferNetOfAccountWithMultipleTransfersConsidersEachOne

	| firstAccount secondAccount |
	firstAccount _ ReceptiveAccount new.
	secondAccount _ ReceptiveAccount new.

	Transfer register: 10 from: firstAccount to: secondAccount.
	Transfer register: 10 from: firstAccount to: secondAccount.
	
	self assert: -20 equals: (TransferNetReport for: firstAccount) compute.! !

!ReportTest methodsFor: 'transfer net report' stamp: 'IAR 10/23/2021 15:41:00'!
test11TransferNetOfAccountWithTransferDestinationAddsItsValue

	| firstAccount secondAccount |
	firstAccount _ ReceptiveAccount new.
	secondAccount _ ReceptiveAccount new.

	Transfer register: 10 from: firstAccount to: secondAccount.
	Withdraw register: 10 on: firstAccount.
	Transfer register: 20 from: secondAccount to: firstAccount.
	
	self assert: 10 equals: (TransferNetReport for: firstAccount) compute.! !

!ReportTest methodsFor: 'transfer net report' stamp: 'IAR 10/23/2021 16:32:07'!
test14TransferNetOfPortfolioConsidersAllSubAccounts
	
	"Test pasó de una, pero lo dejamos por completitud"
	
	| portfolio account |
		
	portfolio _ Portfolio new.
	account _ ReceptiveAccount new.
	
	Transfer register: 100 from: account to: ReceptiveAccount new.
	Deposit register: 30 on: account.

	portfolio add: account.
	
	self assert: -100 equals: (TransferNetReport for: portfolio) compute.! !


!ReportTest methodsFor: 'summary report' stamp: 'IAR 10/23/2021 15:42:18'!
test01SummaryOfEmptyAccountListsTheBalance

	| account |
	account _ ReceptiveAccount new.
	self assert: (OrderedCollection with: 'Balance = 0') equals: (SummaryReport for: account) generate.! !

!ReportTest methodsFor: 'summary report' stamp: 'IAR 10/23/2021 15:42:18'!
test02SummaryOfAccountWithDepositListsItAndTheBalance

	| account expectedReport |
	account _ ReceptiveAccount new.
	Deposit register: 10 on: account.

	expectedReport _ OrderedCollection 
		with: 'Depósito por 10.'
		with: 'Balance = 10'.
	
	self assert: expectedReport equals: (SummaryReport for: account) generate.! !

!ReportTest methodsFor: 'summary report' stamp: 'IAR 10/23/2021 15:42:18'!
test03SummaryOfAccountWithWithdrawListsItAndTheBalance

	| account expectedReport |
	account _ ReceptiveAccount new.
	Withdraw register: 10 on: account.

	expectedReport _ OrderedCollection 
		with: 'Extracción por 10.'
		with: 'Balance = -10'.
	
	self assert: expectedReport equals: (SummaryReport for: account) generate.! !

!ReportTest methodsFor: 'summary report' stamp: 'IAR 10/23/2021 15:42:18'!
test04SummaryOfAccountWithTransferSourceListsItAndTheBalance

	| expectedReport destinationAccount sourceAccount |
	sourceAccount _ ReceptiveAccount new.
	destinationAccount _ ReceptiveAccount new.
	Transfer register: 10 from: sourceAccount to: destinationAccount.

	expectedReport _ OrderedCollection 
		with: 'Salida por transferencia de 10.'
		with: 'Balance = -10'.
	
	self assert: expectedReport equals: (SummaryReport for: sourceAccount ) generate.! !

!ReportTest methodsFor: 'summary report' stamp: 'IAR 10/23/2021 15:42:18'!
test05SummaryOfAccountWithTransferDestinationListsItAndTheBalance

	| expectedReport destinationAccount sourceAccount |
	sourceAccount _ ReceptiveAccount new.
	destinationAccount _ ReceptiveAccount new.
	Transfer register: 10 from: sourceAccount to: destinationAccount.

	expectedReport _ OrderedCollection 
		with: 'Entrada por transferencia de 10.'
		with: 'Balance = 10'.
	
	self assert: expectedReport equals: (SummaryReport for: destinationAccount ) generate.! !

!ReportTest methodsFor: 'summary report' stamp: 'IAR 10/23/2021 15:42:18'!
test06SummaryOfAccountWithMultipleTransactionsListsEachOne

	| expectedReport secondAccount firstAccount |
	firstAccount _ ReceptiveAccount new.
	secondAccount _ ReceptiveAccount new.
	Transfer register: 20 from: firstAccount to: secondAccount.
	Withdraw register: 30 on: firstAccount.
	Deposit register: 40 on: firstAccount.
	Transfer register: 15 from: secondAccount to: firstAccount.

	expectedReport _ OrderedCollection 
		with: 'Salida por transferencia de 20.'
		with: 'Extracción por 30.'
		with: 'Depósito por 40.'
		with: 'Entrada por transferencia de 15.'
		with: 'Balance = 5'.
	
	self assert: expectedReport equals: (SummaryReport for: firstAccount ) generate.! !

!ReportTest methodsFor: 'summary report' stamp: 'IAR 10/23/2021 16:29:46'!
test12SummaryOfEmptyPortfolioListsTheBalance
	
	| expectedReport |
	expectedReport _ OrderedCollection with: 'Balance = 0'.
	
	self assert: expectedReport equals: (SummaryReport for: Portfolio new) generate.! !

!ReportTest methodsFor: 'summary report' stamp: 'IAR 10/23/2021 16:31:16'!
test13SummaryOfPortfolioListsAllSubAccounts
	
	| expectedReport portfolio account |
		
	portfolio _ Portfolio new.
	account _ ReceptiveAccount new.
	Deposit register: 10 on: account.
	Deposit register: 30 on: account.

	portfolio add: account.

	expectedReport _ OrderedCollection 
		with: 'Depósito por 10.'
		with: 'Depósito por 30.'
		with: 'Balance = 40'.
	
	self assert: expectedReport equals: (SummaryReport for: portfolio) generate.! !


!ReportTest methodsFor: 'debugging-haltOnce' stamp: 'IAR 10/23/2021 18:51:48'!
test20

	| portfolio name expectedReport |
	
	name _ 'Portfolio A'.
	portfolio _ Portfolio named: name.
	
	expectedReport _ OrderedCollection with: name with: '\tBalance = 0'.
	
	self assert: expectedReport equals: portfolio treeSummaryReport.! !

!ReportTest methodsFor: 'debugging-haltOnce' stamp: 'IAR 10/23/2021 18:51:09'!
test21

	| portfolio portfolioName accountName expectedReport |
	
	portfolioName _ 'Portfolio A'.
	accountName _ 'Account 1'.
	
	portfolio _ Portfolio named: portfolioName with: (ReceptiveAccount named: accountName).
	
	expectedReport _ OrderedCollection
		with: portfolioName
		with: '\t', accountName
		with: '\t\t', 'Balance = 0'
		with: '\t', 'Balance = 0'.
	
	self assert: expectedReport equals: portfolio treeSummaryReport.
	! !

!ReportTest methodsFor: 'debugging-haltOnce' stamp: 'IAR 10/23/2021 19:13:06'!
test22

	| portfolio portfolioName accountName expectedReport account |
	
	portfolioName _ 'Portfolio A'.
	accountName _ 'Account 1'.
	
	account _ ReceptiveAccount named: accountName.
	Deposit register: 100 on: account. 
	
	portfolio _ Portfolio named: portfolioName with: account.
	
	expectedReport _ OrderedCollection
		with: portfolioName
		with: '\t', accountName
		with: '\t\t', 'Depósito por 100.'
		with: '\t\t', 'Balance = 100'
		with: '\t', 'Balance = 100'.
	
	self assert: expectedReport equals: portfolio treeSummaryReport.
	! !


!ReportTest methodsFor: 'category-name' stamp: 'IAR 10/23/2021 17:06:45'!
test15BONUSTRACK

	| portfolio name |
	
	name _ 'Portfolio A'.
	portfolio _ Portfolio named: name.
	
	self assert: (OrderedCollection with: name) equals: portfolio treeReport.
	! !

!ReportTest methodsFor: 'category-name' stamp: 'IAR 10/23/2021 17:26:25'!
test16

	| portfolio portfolioName accountName expectedReport |
	
	portfolioName _ 'Portfolio A'.
	accountName _ 'Account 1'.
	
	portfolio _ Portfolio named: portfolioName with: (ReceptiveAccount named: accountName).
	expectedReport _ OrderedCollection with: portfolioName with: '\t', accountName.
	
	self assert: expectedReport equals: portfolio treeReport.
	! !

!ReportTest methodsFor: 'category-name' stamp: 'IAR 10/23/2021 17:41:16'!
test17

	| portfolio portfolioName accountName expectedReport childPortfolioName |
	
	portfolioName _ 'Portfolio A'.
	childPortfolioName _ 'Portfolio B'.
	accountName _ 'Account 1'.
	
	portfolio _ Portfolio named: portfolioName
		with: (Portfolio named: childPortfolioName)
		with: (ReceptiveAccount named: accountName).
		
	expectedReport _ OrderedCollection
		with: portfolioName
		with: '\t', childPortfolioName
		with: '\t', accountName.
	
	self assert: expectedReport equals: portfolio treeReport.
	! !

!ReportTest methodsFor: 'category-name' stamp: 'IAR 10/23/2021 17:49:52'!
test18

	| portfolio portfolioName accountName expectedReport childPortfolioName |
	
	portfolioName _ 'Portfolio A'.
	childPortfolioName _ 'Portfolio B'.
	accountName _ 'Account 1'.
	
	portfolio _ Portfolio named: portfolioName
		with: (Portfolio named: childPortfolioName
			with: (ReceptiveAccount named: accountName)).
			
	expectedReport _ OrderedCollection
		with: portfolioName
		with: '\t', childPortfolioName
		with: '\t\t', accountName.
	
	self assert: expectedReport equals: portfolio treeReport.
	! !

!ReportTest methodsFor: 'category-name' stamp: 'IAR 10/23/2021 18:22:39'!
test19

	| angiesAccount childrenPortfolio expectedReport familyPortfolio johnsAccount myAccount familyPortfolioName myAccountName childrenPortfolioName juanAccountName angelesAccountName |
	
	" El test pasa de una, lo agregamos por completitud."
	
	familyPortfolioName _ 'Portfolio de la familia'.
	myAccountName _ 'Cuenta mia'.
	childrenPortfolioName _ 'Portfolio de hijos'.
	juanAccountName _ 'Cuenta de Juan'.
	angelesAccountName _ 'Cuenta de Angeles'.

	
	johnsAccount _ ReceptiveAccount named: juanAccountName.
	angiesAccount _ ReceptiveAccount named: angelesAccountName.
	childrenPortfolio _ Portfolio named: childrenPortfolioName with: johnsAccount with: angiesAccount.
	myAccount _ ReceptiveAccount named: myAccountName.
	familyPortfolio _ Portfolio named: familyPortfolioName with: myAccount with: childrenPortfolio.
			
	expectedReport _ OrderedCollection new
		add: familyPortfolioName;
		add: '\t', myAccountName;
		add: '\t', childrenPortfolioName;
		add: '\t\t', juanAccountName;
		add: '\t\t', angelesAccountName;
		yourself.
	
	self assert: expectedReport equals: familyPortfolio treeReport.
	! !


!classDefinition: #Account category: 'Portfolio-Solucion-Bonus'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion-Bonus'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'reporting' stamp: 'IAR 10/23/2021 16:25:36'!
includeTransactionsInReport: aReport 

	self subclassResponsibility.! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'Portfolio-Solucion-Bonus'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion-Bonus'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'IAR 10/23/2021 17:19:59'!
initializeNamed: aName

	name := aName.
	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'reporting' stamp: 'IAR 10/23/2021 16:25:00'!
includeTransactionsInReport: aReport 
	
	accounts do: [ :anAccount | anAccount includeTransactionsInReport: aReport ].! !

!Portfolio methodsFor: 'reporting' stamp: 'IAR 10/23/2021 17:59:19'!
treeReport
	
	| report |
	
	report _ OrderedCollection with: name.

	accounts do: [ :anAccount |
		| subtree |
		subtree _ anAccount treeReport.
		subtree do: [ :aReportEntry |		report add: '\t' , aReportEntry ]].
	
	^report
	! !

!Portfolio methodsFor: 'reporting' stamp: 'IAR 10/23/2021 19:14:56'!
treeSummaryReport
	
	 | report |
	
	report _ OrderedCollection with: self name.
	
	accounts do: [ :anAccount |
		| accountSummary |
		accountSummary _ (SummaryReport for: anAccount) generate.
		
		report add: '\t', anAccount name.
		accountSummary do: [ :aReportEntry | report add: '\t\t', aReportEntry ].
	].
		
	report add: 	'\t', 'Balance = ', self balance asString.
	^ report! !


!Portfolio methodsFor: 'accessing' stamp: 'IAR 10/23/2021 17:48:09'!
name

	^ name.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Solucion-Bonus'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!Portfolio class methodsFor: 'instance creation' stamp: 'IAR 10/23/2021 17:11:11'!
named: aName 
	
	^self new initializeNamed: aName ! !

!Portfolio class methodsFor: 'instance creation' stamp: 'IAR 10/23/2021 17:47:01'!
named: aName with: anAccount 

	^ (self named: aName)	
		add: anAccount;
		yourself.! !

!Portfolio class methodsFor: 'instance creation' stamp: 'IAR 10/23/2021 17:47:39'!
named: aName with: anAccount with: anotherAccount
	
	^ (self named: aName with: anAccount)
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Solucion-Bonus'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion-Bonus'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'IAR 10/23/2021 17:29:46'!
initializeNamed: aName 

	name := aName.
	transactions := OrderedCollection new.
	! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!ReceptiveAccount methodsFor: 'reporting' stamp: 'IAR 10/23/2021 15:24:32'!
includeTransactionsInReport: aReport 
	
	transactions do: [ :aTransaction | aTransaction includeInReport: aReport ].! !

!ReceptiveAccount methodsFor: 'reporting' stamp: 'IAR 10/23/2021 18:01:57'!
treeReport

	^ OrderedCollection with: self name.! !


!ReceptiveAccount methodsFor: 'accessing' stamp: 'IAR 10/23/2021 17:36:50'!
name

	^ name! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'Portfolio-Solucion-Bonus'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'IAR 10/23/2021 17:26:54'!
named: aName

	^self new initializeNamed: aName ! !


!classDefinition: #AccountTransaction category: 'Portfolio-Solucion-Bonus'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion-Bonus'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'reporting' stamp: 'IAR 10/23/2021 15:12:41'!
includeInReport: aNetReport

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Solucion-Bonus'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Solucion-Bonus'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion-Bonus'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'reporting' stamp: 'IAR 10/23/2021 15:38:11'!
includeInReport: aReport

	aReport includeDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Solucion-Bonus'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDestination category: 'Portfolio-Solucion-Bonus'!
AccountTransaction subclass: #TransferDestination
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion-Bonus'!

!TransferDestination methodsFor: 'accessing' stamp: 'MP 10/19/2021 17:34:38'!
otherEnd
	
	^ transfer source! !


!TransferDestination methodsFor: 'balance' stamp: 'IAR 10/18/2021 20:38:43'!
affectBalance: aBalance

	^ aBalance + transfer value.! !


!TransferDestination methodsFor: 'reporting' stamp: 'IAR 10/23/2021 15:39:15'!
includeInReport: aNetReport

	aNetReport includeTransferDestination: self.! !


!TransferDestination methodsFor: 'initialization' stamp: 'IAR 10/18/2021 20:35:47'!
initializeFor: aTransfer

	transfer _ aTransfer.! !


!TransferDestination methodsFor: 'value' stamp: 'MP 10/19/2021 18:36:11'!
value

	^ transfer value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDestination class' category: 'Portfolio-Solucion-Bonus'!
TransferDestination class
	instanceVariableNames: ''!

!TransferDestination class methodsFor: 'as yet unclassified' stamp: 'IAR 10/18/2021 20:35:31'!
for: aTransfer

	^ self new initializeFor: aTransfer.! !


!classDefinition: #TransferSource category: 'Portfolio-Solucion-Bonus'!
AccountTransaction subclass: #TransferSource
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion-Bonus'!

!TransferSource methodsFor: 'accessing' stamp: 'MP 10/19/2021 17:34:38'!
otherEnd

	^ transfer destination! !


!TransferSource methodsFor: 'initialization' stamp: 'IAR 10/18/2021 20:36:38'!
initializeFor: aTransfer

	transfer _ aTransfer.! !


!TransferSource methodsFor: 'balance' stamp: 'IAR 10/18/2021 20:37:40'!
affectBalance: aBalance
	
	^ aBalance - transfer value.! !


!TransferSource methodsFor: 'reporting' stamp: 'IAR 10/23/2021 15:39:33'!
includeInReport: aNetReport

	aNetReport includeTransferSource: self.! !


!TransferSource methodsFor: 'value' stamp: 'MP 10/19/2021 18:36:14'!
value

	^ transfer value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferSource class' category: 'Portfolio-Solucion-Bonus'!
TransferSource class
	instanceVariableNames: ''!

!TransferSource class methodsFor: 'as yet unclassified' stamp: 'IAR 10/18/2021 20:35:22'!
for: aTransfer

	^ self new initializeFor: aTransfer.! !


!classDefinition: #Withdraw category: 'Portfolio-Solucion-Bonus'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion-Bonus'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'reporting' stamp: 'IAR 10/23/2021 15:39:52'!
includeInReport: aNetReport

	aNetReport includeWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Solucion-Bonus'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Report category: 'Portfolio-Solucion-Bonus'!
Object subclass: #Report
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion-Bonus'!

!Report methodsFor: 'private' stamp: 'IAR 10/23/2021 15:30:26'!
includeDeposit: aDeposit

	self subclassResponsibility.! !

!Report methodsFor: 'private' stamp: 'IAR 10/23/2021 15:31:35'!
includeTransferDestination: aTransferDestination

	self subclassResponsibility.! !

!Report methodsFor: 'private' stamp: 'IAR 10/23/2021 15:31:50'!
includeTransferSource: aTransferSource

	self subclassResponsibility.! !

!Report methodsFor: 'private' stamp: 'IAR 10/23/2021 15:30:58'!
includeWithdraw: aWithdraw

	self subclassResponsibility.! !


!Report methodsFor: 'initialization' stamp: 'IAR 10/23/2021 15:36:34'!
initializeFor: aReceptiveAccount

	account _ aReceptiveAccount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'Portfolio-Solucion-Bonus'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'instance creation' stamp: 'IAR 10/23/2021 15:33:34'!
for: aReceptiveAccount

	^ self new initializeFor: aReceptiveAccount.! !


!classDefinition: #SummaryReport category: 'Portfolio-Solucion-Bonus'!
Report subclass: #SummaryReport
	instanceVariableNames: 'summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion-Bonus'!

!SummaryReport methodsFor: 'reporting' stamp: 'IAR 10/23/2021 15:42:18'!
generate

	summary _  OrderedCollection new.
	
	account includeTransactionsInReport: self.
	summary add: 'Balance = ', account balance asString.
	^summary.! !


!SummaryReport methodsFor: 'private' stamp: 'IAR 10/23/2021 15:38:11'!
includeDeposit: aDeposit

	| transactionValue |
	transactionValue _ aDeposit value asString.
	summary add: 'Depósito por ', transactionValue, '.'.! !

!SummaryReport methodsFor: 'private' stamp: 'IAR 10/23/2021 15:39:15'!
includeTransferDestination: aTrasferDestination

	| transactionValue |
	transactionValue _ aTrasferDestination value asString.
	summary add: 'Entrada por transferencia de ', transactionValue, '.'.! !

!SummaryReport methodsFor: 'private' stamp: 'IAR 10/23/2021 16:05:36'!
includeTransferSource: aTrasferSource

	| transactionValue |
	transactionValue _ aTrasferSource value asString.
	summary add: 'Salida por transferencia de ', transactionValue, '.'.! !

!SummaryReport methodsFor: 'private' stamp: 'IAR 10/23/2021 15:39:52'!
includeWithdraw: aWithdraw

	| transactionValue |
	transactionValue _ aWithdraw value asString.
	summary add: 'Extracción por ', transactionValue, '.'.! !


!classDefinition: #TransferNetReport category: 'Portfolio-Solucion-Bonus'!
Report subclass: #TransferNetReport
	instanceVariableNames: 'net'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion-Bonus'!

!TransferNetReport methodsFor: 'reporting' stamp: 'IAR 10/23/2021 15:41:00'!
compute

	net _ 0.
	account includeTransactionsInReport: self.
	
	^ net.! !


!TransferNetReport methodsFor: 'private' stamp: 'IAR 10/23/2021 15:38:11'!
includeDeposit: aDeposit

	! !

!TransferNetReport methodsFor: 'private' stamp: 'IAR 10/23/2021 15:39:15'!
includeTransferDestination: aTransferDestination

	net _ net + aTransferDestination value.

	! !

!TransferNetReport methodsFor: 'private' stamp: 'IAR 10/23/2021 15:39:33'!
includeTransferSource: aTransferSource

	net _ net - aTransferSource value.

	! !

!TransferNetReport methodsFor: 'private' stamp: 'IAR 10/23/2021 15:39:52'!
includeWithdraw: aWithdraw

	! !


!classDefinition: #Transfer category: 'Portfolio-Solucion-Bonus'!
Object subclass: #Transfer
	instanceVariableNames: 'value sourceAccount destinationAccount source destination'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion-Bonus'!

!Transfer methodsFor: 'accessing' stamp: 'MP 10/19/2021 17:34:26'!
destination
	
	^ destination! !

!Transfer methodsFor: 'accessing' stamp: 'MP 10/19/2021 17:34:14'!
source
	
	^ source! !

!Transfer methodsFor: 'accessing' stamp: 'IAR 10/18/2021 20:38:02'!
value

	^value! !


!Transfer methodsFor: 'initialization' stamp: 'MP 10/19/2021 17:34:26'!
initializeFor: aValue

	value _ aValue.
	source _ TransferSource for: self.
	destination _ TransferDestination for: self.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'Portfolio-Solucion-Bonus'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'MP 10/19/2021 17:47:32'!
assert: aSourceAccount isDifferentFrom: aDestinationAccount

	(aSourceAccount = aDestinationAccount ) ifTrue: [ self error: self cannotRegisterTransferErrorDescription ]! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'MP 10/19/2021 17:46:10'!
assertValueIsPositive: aValue

	(aValue <= 0) ifTrue: [ self error: self cannotRegisterTransferErrorDescription ]! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'MP 10/19/2021 17:47:32'!
register: aValue from: aSourceAccount to: aDestinationAccount

	| transfer |
	
	self assertValueIsPositive: aValue.
	self assert: aSourceAccount isDifferentFrom: aDestinationAccount.
	
	transfer := self new initializeFor: aValue.

	aSourceAccount register: transfer source.
	aDestinationAccount register: transfer destination.
		
	^ transfer

	! !


!Transfer class methodsFor: 'error descriptions' stamp: 'MP 10/19/2021 17:39:29'!
cannotRegisterTransferErrorDescription
	
	^ 'cannot register transaction'.! !
