!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'AM 7/7/2021 21:26:02'!
test01NewPortfolioIncludesAddedAccounts

	| account1 account2 portfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio := Portfolio new.
	
	portfolio add: account1.
	portfolio add: account2.
	
	self assert: portfolio includes: account1.	
	self assert: portfolio includes: account2.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'AM 7/7/2021 21:25:20'!
test02PortfolioKnowsItsBalance

	| account1 account2 portfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio := Portfolio new.
	
	portfolio add: account1.
	portfolio add: account2.
	
	Deposit register: 100 * peso on: account1.
	Deposit register: 50 * peso on: account2.
	
	self assert: portfolio balance equals: 150 * peso.	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'AM 7/7/2021 21:26:11'!
test03PortfolioKnowsIfItsAccountsHaveTransactions

	| account1 account2 portfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio := Portfolio new.
	
	portfolio add: account1.
	portfolio add: account2.
	
	Deposit register: 50 * peso on: account2.
	
	self assert: portfolio hasTransactions.	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'AM 7/7/2021 21:26:22'!
test04PortfolioKnowsIfItsAccountsDoNotHaveTransactions

	| account1 account2 portfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio := Portfolio new.
	
	portfolio add: account1.
	portfolio add: account2.
	
	
	self deny: portfolio hasTransactions.	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'AM 7/7/2021 21:26:28'!
test05PortfolioKnowsEveryAccountTransactions


	| account1 account2 allTransactions portfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio := Portfolio new.
	
	portfolio add: account1.
	portfolio add: account2.
	
	allTransactions := OrderedCollection new.
	
	allTransactions add: (Deposit register: 100 * peso on: account1).
	allTransactions add: (Deposit register: 30 * peso on: account1).
	allTransactions add: (Deposit register: 20 * peso on: account1).
	allTransactions add: (Deposit register: 40 * peso on: account2).
	

	self assert: (portfolio transactions) = allTransactions.	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'AM 7/7/2021 23:13:20'!
test06NewPortfolioIncludesAddedPortfolios

	| portfolio1 portfolio2 |
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio2 add: portfolio1.
	
	self assert: portfolio2 includes: portfolio1.! !

!PortfolioTest methodsFor: 'tests' stamp: 'AM 7/7/2021 21:33:54'!
test07PortfolioKnowsItsPortfoliosBalances

	| account1 account2 portfolio1 portfolio2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	portfolio1 := Portfolio new.
	portfolio1 add: account1.
	portfolio2 := Portfolio new.
	portfolio2 add: account2.
	portfolio2 add: portfolio1.
	
	
	
	Deposit register: 100 * peso on: account1.
	Deposit register: 30 * peso on: account2.
	
	self assert: portfolio2 balance equals: 130 * peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'AM 7/7/2021 23:23:04'!
test08PorfolioCanNotAddAnAlredyAddedItem

	| account portfolio |
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	portfolio add: account.
	

	self should: [ (	portfolio add: account)  ]
 	 raise: Error - MessageNotUnderstood 
 		withExceptionDo: [ :anError |
	 	self assert: anError messageText = Portfolio itemAlreadyRegisteredErrorDescription].! !

!PortfolioTest methodsFor: 'tests' stamp: 'AM 7/7/2021 23:44:51'!
test09PortfolioCanNotAddAnAccountIncludedInAnAddedPortfolio

	| account portfolio1 portfolio2 |
	account := ReceptiveAccount new.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio1 add: account.
	portfolio2 add: portfolio1.
	

	self should: [ (	portfolio2 add: account)  ]
 	 raise: Error - MessageNotUnderstood 
 		withExceptionDo: [ :anError |
	 	self assert: anError messageText = Portfolio itemAlreadyRegisteredErrorDescription ].! !

!PortfolioTest methodsFor: 'tests' stamp: 'AM 7/7/2021 23:45:12'!
test10PortfolioCanNotAddItself

	| portfolio |
	portfolio := Portfolio new.
	

	self should: [ (	portfolio add: portfolio)  ]
 	 raise: Error - MessageNotUnderstood 
 		withExceptionDo: [ :anError |
	 	self assert: anError messageText = Portfolio portfolioCanNotAddItselfErrorDescription ].! !

!PortfolioTest methodsFor: 'tests' stamp: 'AM 7/8/2021 17:00:59'!
test11PortfolioCanNotAddAccountAlreadyAddedInPrecedingPortfolio

	| account currentPortfolio precedingPortfolio |
	account := ReceptiveAccount new.
	currentPortfolio := Portfolio new.
	precedingPortfolio := Portfolio new.
	precedingPortfolio add: account.
	precedingPortfolio add: currentPortfolio.
	

	self should: [ (	currentPortfolio add: account)  ]
 	 raise: Error - MessageNotUnderstood 
 		withExceptionDo: [ :anError |
	 	self assert: anError messageText = Portfolio itemAlreadyRegisteredErrorDescription].! !

!PortfolioTest methodsFor: 'tests' stamp: 'AM 7/7/2021 23:46:47'!
test12PortfolioCanNotAddAPortfolioWhenOneItemIsAlreadyInPortfolio

	| account portfolio1 portfolio2 |
	account := ReceptiveAccount new.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio1 add: account.
	portfolio2 add: account.
	

	self should: [ (	portfolio2 add: portfolio1)  ]
 	 raise: Error - MessageNotUnderstood 
 		withExceptionDo: [ :anError |
	 	self assert: anError messageText = Portfolio itemAlreadyRegisteredErrorDescription ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTest class' category: 'ServiciosFinancieros-Ejercicio'!
PortfolioTest class
	instanceVariableNames: 'portfolio'!


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceBetweenAccountsTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceBetweenAccountsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'AM 7/7/2021 19:46:13'!
test01CanAccessToTransferenceValue

	| accountReciever accountSender transference |
	
	accountSender := ReceptiveAccount new.
	accountReciever := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountSender.
	
	transference := TransferenceBetweenAccounts from: accountSender to: accountReciever with: 30 * peso. 
		
	self assert: 30 * peso equals: transference value.! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'AM 7/7/2021 19:52:37'!
test02TransferenceBetweenAccountsChangesBalanceOfSender

	| accountReciever accountSender transference |
	
	accountSender := ReceptiveAccount new.
	accountReciever := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountSender.
	
	transference := TransferenceBetweenAccounts from: accountSender to: accountReciever with: 30 * peso. 
		
	self assert: 70 * peso equals: accountSender balance.! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'AM 7/7/2021 19:50:32'!
test03TransferenceBetweenAccountsChangesBalanceOfInvolvedAccounts

	| accountReciever accountSender transference |
	
	accountSender := ReceptiveAccount new.
	accountReciever := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountSender.
	
	transference := TransferenceBetweenAccounts from: accountSender to: accountReciever with: 30 * peso. 
		
	self assert: 30 * peso equals: accountReciever balance.
	self assert: 70 * peso equals: accountSender balance.! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'AM 7/7/2021 19:49:11'!
test04CanNotCompleteATransferenceBetweenAccountsWhenTransferAmountIsLessThanCero

	| accountReciever accountSender |
	
	accountSender := ReceptiveAccount new.
	accountReciever := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountSender.
	

		
	self should: [ TransferenceBetweenAccounts from: accountSender to: accountReciever with: 0 * peso.  ]
   		 raise: Error - MessageNotUnderstood 
 		   withExceptionDo: [ :anError |
     		   self assert: anError messageText = 'Invalid value' ].! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'AM 7/7/2021 20:16:54'!
test05CanAccessToCounterparts

	| accountReciever accountSender transference |
	
	accountSender := ReceptiveAccount new.
	accountReciever := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountSender.
	
	transference := TransferenceBetweenAccounts from: accountSender to: accountReciever with: 15 * peso.
		
	self assert: (transference depositTransaction) counterpart equals: transference withdrawTransaction.
	self assert: (transference withdrawTransaction) counterpart equals: transference depositTransaction.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'AM 7/7/2021 20:04:46'!
value 

	^value! !


!AccountTransaction methodsFor: 'accesing' stamp: 'AM 7/7/2021 14:36:51'!
effectOnBalance: aBalance

	
	^self subclassResponsibility.! !

!AccountTransaction methodsFor: 'accesing' stamp: 'AM 7/7/2021 20:05:20'!
initializeFor: aValue

	value := aValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'accesing' stamp: 'AM 7/7/2021 14:37:31'!
effectOnBalance: aBalance

	
	^aBalance + self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferenceDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferenceDeposit
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceDeposit methodsFor: 'accesing' stamp: 'AM 7/7/2021 20:19:27'!
counterpart
	
	^counterpart! !

!TransferenceDeposit methodsFor: 'accesing' stamp: 'AM 7/7/2021 20:06:45'!
effectOnBalance: aBalance

	
	^aBalance + value.! !

!TransferenceDeposit methodsFor: 'accesing' stamp: 'AM 7/7/2021 20:18:55'!
setCounterpart: aTransaction
	counterpart := aTransaction.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceDeposit class
	instanceVariableNames: ''!

!TransferenceDeposit class methodsFor: 'instance creation' stamp: 'AM 7/8/2021 17:15:56'!
for: aValue 
	^ self new initializeFor: aValue! !


!classDefinition: #TransferenceWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferenceWithdraw
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceWithdraw methodsFor: 'accesing' stamp: 'AM 7/7/2021 20:19:21'!
counterpart
	
	^counterpart! !

!TransferenceWithdraw methodsFor: 'accesing' stamp: 'AM 7/7/2021 20:06:38'!
effectOnBalance: aBalance

	
	^aBalance - value.! !

!TransferenceWithdraw methodsFor: 'accesing' stamp: 'AM 7/7/2021 20:19:08'!
setCounterpart: aTransaction
	counterpart := aTransaction.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceWithdraw class
	instanceVariableNames: ''!

!TransferenceWithdraw class methodsFor: 'instance creation' stamp: 'AM 7/8/2021 17:16:08'!
for: aValue

	^ self new initializeFor: aValue.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'accesing' stamp: 'AM 7/7/2021 14:38:00'!
effectOnBalance: aBalance

	
	^aBalance - self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #FinantialItem category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #FinantialItem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!FinantialItem methodsFor: 'accesing' stamp: 'AM 7/8/2021 17:10:19'!
balance
	^self subclassResponsibility.! !

!FinantialItem methodsFor: 'accesing' stamp: 'AM 7/8/2021 17:10:39'!
transactions
	^self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
FinantialItem subclass: #Portfolio
	instanceVariableNames: 'finantialItems precedingPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'private' stamp: 'AM 7/7/2021 23:36:11'!
finantialItems
 	^finantialItems copy.! !

!Portfolio methodsFor: 'private' stamp: 'AM 7/8/2021 17:04:21'!
searchInPreceding: aFinantialItem

	(precedingPortfolio = nil) ifFalse: [^(precedingPortfolio searchInPreceding: aFinantialItem)].
	
	^self includes: aFinantialItem. ! !

!Portfolio methodsFor: 'private' stamp: 'AM 7/8/2021 16:57:22'!
setPreceding: aPortfolio
	precedingPortfolio := aPortfolio.! !


!Portfolio methodsFor: 'initialization' stamp: 'AM 7/8/2021 16:56:06'!
initialize

	finantialItems := OrderedCollection new.
	precedingPortfolio := nil.
! !


!Portfolio methodsFor: 'accesing' stamp: 'AM 7/8/2021 17:00:47'!
add: aFinantialItem
	
	(aFinantialItem = self) ifTrue: [self error: self class portfolioCanNotAddItselfErrorDescription].	
	
	(self searchInPreceding: aFinantialItem) ifTrue: [self error: self class itemAlreadyRegisteredErrorDescription].
	
	(aFinantialItem finantialItems) collect: [:oneFinantialItem|(self includes: oneFinantialItem) ifTrue: [self error: self class itemAlreadyRegisteredErrorDescription ] ].

	
	finantialItems add: aFinantialItem.
	aFinantialItem setPreceding: self.! !

!Portfolio methodsFor: 'accesing' stamp: 'AM 7/7/2021 23:41:20'!
balance
	^ finantialItems sum: [ :aFinantialItem | aFinantialItem balance] ifEmpty: [0]! !

!Portfolio methodsFor: 'accesing' stamp: 'AM 7/7/2021 21:29:13'!
hasTransactions

	finantialItems collect: [:aFinantialItem|((aFinantialItem transactions)isEmpty)ifFalse: [^true]].
	
	^false.! !

!Portfolio methodsFor: 'accesing' stamp: 'AM 7/7/2021 23:14:40'!
includes: aFinantialItem
	(aFinantialItem = self) ifTrue: [^true].
	finantialItems collect: [:oneFinantialItem|(oneFinantialItem includes: aFinantialItem) ifTrue: [^true]].
	^false.
	
	! !

!Portfolio methodsFor: 'accesing' stamp: 'AM 7/7/2021 21:30:30'!
transactions

	| portfolioTransactions |
	portfolioTransactions := OrderedCollection new.
	finantialItems collect: [:finantialItem|((finantialItem transactions) collect:[:aTransaction| portfolioTransactions add: aTransaction])].
	^portfolioTransactions! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error descriptions' stamp: 'AM 7/7/2021 23:20:18'!
itemAlreadyRegisteredErrorDescription
	^'Item already registered in family of portfolio'.! !

!Portfolio class methodsFor: 'error descriptions' stamp: 'AM 7/7/2021 17:25:17'!
portfolioCanNotAddItselfErrorDescription
	^'Portfolio can not add itself'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
FinantialItem subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions precedingPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'AM 7/7/2021 14:38:40'!
balance

	^transactions inject: 0 * peso into: [ :currentBalance :aTransaction | aTransaction effectOnBalance: currentBalance]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'AM 7/7/2021 23:32:07'!
finantialItems
 	^OrderedCollection with: self.! !

!ReceptiveAccount methodsFor: 'private' stamp: 'AM 7/7/2021 23:04:26'!
includes: aFinantialItem
	^aFinantialItem = self.! !

!ReceptiveAccount methodsFor: 'private' stamp: 'AM 7/8/2021 16:58:49'!
setPreceding: aPortfolio
	precedingPortfolio := aPortfolio.! !


!classDefinition: #TransferenceBetweenAccounts category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferenceBetweenAccounts
	instanceVariableNames: 'sender reciever value depositTransaction withdrawTransaction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceBetweenAccounts methodsFor: 'initialization' stamp: 'AM 7/7/2021 20:20:09'!
initializeFrom: aSender to: aReciever with: aValue
	
	sender := aSender.
	reciever := aReciever.
	value := aValue.
	
	withdrawTransaction := TransferenceWithdraw register: aValue on: aSender.
	depositTransaction := TransferenceDeposit register: aValue on: aReciever.
	
	withdrawTransaction setCounterpart: depositTransaction.
	depositTransaction setCounterpart: withdrawTransaction.
	
	
	! !


!TransferenceBetweenAccounts methodsFor: 'accesing' stamp: 'AM 7/7/2021 20:12:54'!
depositTransaction

	^depositTransaction! !

!TransferenceBetweenAccounts methodsFor: 'accesing' stamp: 'AM 7/7/2021 19:44:31'!
value
	^value.! !

!TransferenceBetweenAccounts methodsFor: 'accesing' stamp: 'AM 7/7/2021 20:13:23'!
withdrawTransaction
	
	^withdrawTransaction! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceBetweenAccounts class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceBetweenAccounts class
	instanceVariableNames: ''!

!TransferenceBetweenAccounts class methodsFor: 'error description' stamp: 'AM 7/7/2021 19:45:56'!
invalidValueErrorDescription
	^'Invalid value'! !


!TransferenceBetweenAccounts class methodsFor: 'instance creation' stamp: 'AM 7/7/2021 19:45:47'!
from: aSender to: aReciever with: aValue
	
	(aValue <= 0) ifTrue: [self error: self invalidValueErrorDescription].
	
	^self new initializeFrom: aSender to: aReciever with: aValue! !
