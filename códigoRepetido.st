!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBook johnLennon paulMcCartney'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'IB 5/20/2021 16:04:58'!
setUp

	customerBook  := CustomerBook new.
	
	paulMcCartney := 'Paul McCartney'.
	
	johnLennon := 'John Lennon'.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IB 5/20/2021 16:06:05'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	self theClosure: [ customerBook addCustomerNamed: johnLennon ] shouldNotTakeMoreTimeToRunThan: 50 * millisecond.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IB 5/20/2021 16:06:00'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	customerBook addCustomerNamed: paulMcCartney.
	  
	self theClosure: [ customerBook removeCustomerNamed: paulMcCartney ] shouldNotTakeMoreTimeToRunThan: 100 * millisecond.
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IB 5/20/2021 16:05:52'!
test03CanNotAddACustomerWithEmptyName 

	self should: [ customerBook addCustomerNamed: '' ] raise: Error withExceptionDo: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IB 5/20/2021 16:05:42'!
test04CanNotRemoveAnInvalidCustomer

	customerBook addCustomerNamed: johnLennon.
	
	self should: [ customerBook removeCustomerNamed: paulMcCartney ] raise: NotFound withExceptionDo: [ :anError | 
			self checkThatInTheBook: customerBook theNumberOfTotalCustomersIs: 1 andOneOfThemIs: johnLennon ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IB 5/20/2021 16:06:21'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self checkThatInTheBook: customerBook theNumberOfActiveCostumersIs: 0 theNumberOfSuspendedCostumersIs: 1 theNumerOfTotalCostumersIs: 1.

	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IB 5/20/2021 16:06:37'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self checkThatInTheBook: customerBook theNumberOfActiveCostumersIs: 0 theNumberOfSuspendedCostumersIs: 0 theNumerOfTotalCostumersIs: 0.
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IB 5/20/2021 16:06:53'!
test07CanNotSuspendAnInvalidCustomer
	
	customerBook addCustomerNamed: johnLennon.
	
	self should: [ customerBook suspendCustomerNamed: 'Ringo Starr' ] raise: CantSuspend withExceptionDo: [ :anError | 
			self checkThatInTheBook: customerBook theNumberOfTotalCustomersIs: 1 andOneOfThemIs: johnLennon ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IB 5/20/2021 16:07:08'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self should: [ customerBook suspendCustomerNamed: johnLennon ] raise: CantSuspend withExceptionDo: [ :anError | 
			self checkThatInTheBook: customerBook theNumberOfTotalCustomersIs: 1 andOneOfThemIs: johnLennon ]
! !


!CustomerBookTest methodsFor: 'auxiliar' stamp: 'IB 5/20/2021 15:58:12'!
checkThatInTheBook: aBook theNumberOfActiveCostumersIs: numberOfActiveCustomers 
theNumberOfSuspendedCostumersIs: numberOfSuspendedCustomers theNumerOfTotalCostumersIs: numberOfTotalCustomers

	self assert: numberOfActiveCustomers equals: aBook numberOfActiveCustomers.
	self assert: numberOfSuspendedCustomers equals: aBook numberOfSuspendedCustomers.
	self assert: numberOfTotalCustomers equals: aBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'auxiliar' stamp: 'IB 5/20/2021 15:57:57'!
checkThatInTheBook: aBook theNumberOfTotalCustomersIs: numberOfTotalCustomers andOneOfThemIs: aName

	self assert: numberOfTotalCustomers equals: aBook numberOfCustomers.
	
	self assert: (aBook includesCustomerNamed: aName).
	
	! !

!CustomerBookTest methodsFor: 'auxiliar' stamp: 'IB 5/20/2021 12:37:08'!
theClosure: aClosure shouldNotTakeMoreTimeToRunThan: aTime

	self assert: aClosure timeToRun < aTime! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'AM 5/19/2021 14:49:51'!
removeCustomerNamed: aName 
	
	active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [^NotFound signal]].
	
	^aName.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
