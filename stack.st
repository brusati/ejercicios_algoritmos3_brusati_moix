!classDefinition: #OOLimitedStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOLimitedStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStackTest methodsFor: 'test' stamp: 'IB 6/10/2021 17:48:55'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOLimitedStack withAMaximumSizeOf: 3.
	
	self assert: stack isEmpty! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'IB 6/10/2021 17:48:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOLimitedStack withAMaximumSizeOf: 3.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'IB 6/10/2021 17:48:55'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOLimitedStack withAMaximumSizeOf: 3.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'IB 6/10/2021 17:48:55'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOLimitedStack withAMaximumSizeOf: 3.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'IB 6/10/2021 17:48:55'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOLimitedStack withAMaximumSizeOf: 3.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'IB 6/10/2021 17:48:55'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOLimitedStack withAMaximumSizeOf: 3.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'IB 6/10/2021 17:48:55'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOLimitedStack withAMaximumSizeOf: 3.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'IB 6/10/2021 17:48:55'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOLimitedStack withAMaximumSizeOf: 3.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'IB 6/10/2021 17:48:55'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOLimitedStack withAMaximumSizeOf: 3.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'IB 6/10/2021 17:48:55'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOLimitedStack withAMaximumSizeOf: 3.
	
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'IB 6/10/2021 17:49:19'!
test11CanNotAddObjectsWhenLimitIsZero

	| stack  |
	
	stack := OOLimitedStack withAMaximumSizeOf: 0.
	
	self
		should: [ stack push: 'something'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackLimitReached ]
		
! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'IB 6/10/2021 17:48:55'!
test12CanNotAddObjectsWhenLimitIsReached

	| stack  |
	
	stack := OOLimitedStack withAMaximumSizeOf: 3.
	
	stack push: 'something1'.
	stack push: 'something2'.
	stack push: 'something3'.
	
	self
		should: [ stack push: 'something4'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackLimitReached ]
		
! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'IB 6/10/2021 17:48:55'!
test13CanAddANewObjectAfterReachingStackLimitAndPop

	| stack  |
	
	stack := OOLimitedStack withAMaximumSizeOf: 3.
	
	stack push: 'something1'.
	stack push: 'something2'.
	stack push: 'something3'.
	
	stack pop.
	
	stack push: 'something4'.
		
! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'IB 6/10/2021 17:48:55'!
test14CanNotAddANewObjectAfterReachingStackLimitAndPopAndPush

	| stack  |
	
	stack := OOLimitedStack withAMaximumSizeOf: 3.
	
	stack push: 'something1'.
	stack push: 'something2'.
	stack push: 'something3'.
	
	stack pop.
	
	stack push: 'something4'.
	
	self
		should: [ stack push: 'something5'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackLimitReached ]
		
		
! !


!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'IB 6/10/2021 17:41:57'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack finder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IB 6/10/2021 16:06:50'!
test00ResultStackMustBeEmptyWhenNoSentencesHaveBeenPushed

	| results |
	
	results := finder find: 'Wint' in: stack.
	
	self checkThatCanNotPopWhenThereAreNoObjectsInTheStack: results.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IB 6/10/2021 16:16:37'!
test01ResultStackMustHaveOneElementWhenSentencePushedStartsWithPrefix

	| results |
	
	stack push: 'Winter is coming'.
	results := finder find: 'Wint' in: stack.
	
	self assert: results pop = 'Winter is coming'.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IB 6/10/2021 16:11:16'!
test02ResultStackMustBeEmptyWhenSentenceDoesNotStartWithPrefix

	| results |
	
	stack push: 'Winter is coming'.
	results := finder find: 'wint' in: stack.
	
	self checkThatCanNotPopWhenThereAreNoObjectsInTheStack: results.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IB 6/10/2021 16:17:56'!
test03ResultStackMustHaveOnlySentencesThatStartWithPrefix

	| results |
	
	stack push: 'Winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	results := finder find: 'Wint' in: stack.
	
	self assert: results pop = 'Winter is coming'.
	self assert: results pop = 'Winter is here'.

	self checkThatCanNotPopWhenThereAreNoObjectsInTheStack: results.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IB 6/10/2021 16:18:45'!
test04StackMustRemainInTheSameOrderAfterThereWereNoMatchesInFindByPrefix
	
	| results |
	
	stack push: 'Winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	results := finder find: 'Hello' in: stack.

	self assert: (stack pop = 'Winter is here').
	self assert: (stack pop = 'The winds of Winter').
	self assert: (stack pop = 'winning is everything').
	self assert: (stack pop = 'Winter is coming').
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IB 6/10/2021 16:26:56'!
test05StackMustRemainInTheSameOrderAfterFindByPrefixAndThereWereAllMatches
	
	| results |
	
	stack push: 'Winter is coming'.
	stack push: 'Winning is everything'.
	stack push: 'Winds of Winter'.
	stack push: 'Winter is here'.
	
	results := finder find: 'Win' in: stack.

	self assert: (stack pop = 'Winter is here').
	self assert: (stack pop = 'Winds of Winter').
	self assert: (stack pop = 'Winning is everything').
	self assert: (stack pop = 'Winter is coming').
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IB 6/10/2021 16:26:11'!
test06StackMustRemainInTheSameOrderAfterFindByPrefixAndThereWereMatches
	
	| results |
	
	stack push: 'Winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	results := finder find: 'Wint' in: stack.

	self assert: (stack pop = 'Winter is here').
	self assert: (stack pop = 'The winds of Winter').
	self assert: (stack pop = 'winning is everything').
	self assert: (stack pop = 'Winter is coming').
		
	! !


!SentenceFinderByPrefixTest methodsFor: 'auxiliar' stamp: 'IB 6/10/2021 16:01:55'!
checkThatCanNotPopWhenThereAreNoObjectsInTheStack: aStack

	self
	should: [ aStack pop ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError |
		self assert: anError messageText = OOStack stackEmptyErrorDescription ]

	! !

!SentenceFinderByPrefixTest methodsFor: 'auxiliar' stamp: 'IB 6/10/2021 16:06:43'!
setUp

	stack := OOStack new.
	finder := SentenceFinderByPrefix new.! !


!classDefinition: #OOLimitedStack category: 'Stack-Exercise'!
Object subclass: #OOLimitedStack
	instanceVariableNames: 'contents maximumSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStack methodsFor: 'accesing' stamp: 'IB 6/10/2021 17:43:07'!
isEmpty
	
	^(contents last) isEmpty.! !

!OOLimitedStack methodsFor: 'accesing' stamp: 'IB 6/10/2021 17:43:07'!
pop

	| top |
	
	top := self top.
	
	contents removeLast.
	
	^top! !

!OOLimitedStack methodsFor: 'accesing' stamp: 'IB 6/10/2021 17:50:26'!
push: anElement

	| newElement |
	
	(self size = maximumSize) ifTrue: [ ^self error: self class stackLimitReached ].
	
	newElement := NonEmptyStackableElements with: anElement.
	
	newElement previous: contents last.
	
	contents add: newElement.
	! !

!OOLimitedStack methodsFor: 'accesing' stamp: 'IB 6/10/2021 17:43:07'!
size

	^contents last size.! !

!OOLimitedStack methodsFor: 'accesing' stamp: 'IB 6/10/2021 17:43:07'!
top

	^(contents last) top.! !


!OOLimitedStack methodsFor: 'initialization' stamp: 'IB 6/10/2021 17:45:46'!
initializeWith: aLimitSize

	contents := OrderedCollection new.
	contents add: EmptyStackableElements new.
	maximumSize := aLimitSize.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOLimitedStack class' category: 'Stack-Exercise'!
OOLimitedStack class
	instanceVariableNames: 'elementos'!

!OOLimitedStack class methodsFor: 'error descriptions' stamp: 'IB 6/10/2021 17:43:08'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !

!OOLimitedStack class methodsFor: 'error descriptions' stamp: 'IB 6/10/2021 17:43:34'!
stackLimitReached

	^'Cannot add more elements into the stack because the limit has been reached'! !


!OOLimitedStack class methodsFor: 'initialization' stamp: 'IB 6/10/2021 17:43:14'!
withAMaximumSizeOf: aMaximumSize

	^self new initializeWith: aMaximumSize.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accesing' stamp: 'IB 6/10/2021 17:05:14'!
isEmpty
	
	^(contents last) isEmpty.! !

!OOStack methodsFor: 'accesing' stamp: 'IB 6/8/2021 00:23:19'!
pop

	| top |
	
	top := self top.
	
	contents removeLast.
	
	^top! !

!OOStack methodsFor: 'accesing' stamp: 'IB 6/10/2021 17:35:41'!
push: anElement

	| newElement |
	newElement := NonEmptyStackableElements with: anElement.
	
	newElement previous: contents last.
	
	contents add: newElement.
	! !

!OOStack methodsFor: 'accesing' stamp: 'IB 6/10/2021 17:42:07'!
size

	^contents last size.! !

!OOStack methodsFor: 'accesing' stamp: 'IB 6/10/2021 17:05:47'!
top

	^(contents last) top.! !


!OOStack methodsFor: 'initialization' stamp: 'IB 6/10/2021 15:53:09'!
initialize

	contents := OrderedCollection new.
	contents add: EmptyStackableElements new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: 'elementos'!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'auxiliar' stamp: 'IB 6/10/2021 16:23:16'!
findTheSentencesIn: theOriginalStack thatStartWith: aPrefix using: anAcumulatorStack and: aResultStack

	| sentence |
	
	[ theOriginalStack isEmpty ] whileFalse: [
		sentence := theOriginalStack pop.

		((sentence commonPartWith: aPrefix startAt: 1 stopAt: (aPrefix size) applying: [ :c | c ]) = aPrefix size) ifTrue: [ aResultStack push: sentence ].
	
		anAcumulatorStack push: sentence. 
	].
	
	"
	forma recursiva:
	
	(theOriginalStack isEmpty) ifTrue: [ ^true ].
	
	sentence := theOriginalStack pop.

	((sentence commonPartWith: aPrefix startAt: 1 stopAt: (aPrefix size) applying: [ :c | c ]) = aPrefix size) ifTrue: [ aStack2 push: sentence ].
	
	aStack1 push: sentence.
	
	^(self checkThatThePrefix: aPrefix isIn: aStack1 usingAuxiliar1: aStack2 andAuxiliar2: theOriginalStack).
	"! !

!SentenceFinderByPrefix methodsFor: 'auxiliar' stamp: 'IB 6/10/2021 15:56:51'!
invertStack: aStack1 into: aStack2

	[ aStack1 isEmpty ] whileFalse: [ aStack2 push: (aStack1 pop) ].
	
	"
	forma recursiva:
	
	(aStack1 isEmpty) ifTrue: [ ^true ].
	
	aStack2 push: (aStack1 pop).
	
	^self invertStack: aStack1 into: aStack2.
	"! !


!SentenceFinderByPrefix methodsFor: 'accesing' stamp: 'IB 6/10/2021 16:28:24'!
find: aPrefix in: aStack

	| acumulatorStack resultStack |
	acumulatorStack := OOStack new. "nos sirve para acumular los elementos originales de la stack"
	resultStack := OOStack new. "nos sirve para devolver las oraciones que empiezan con el prefijo"
	
	self findTheSentencesIn: aStack thatStartWith: aPrefix using: acumulatorStack and: resultStack.
	
	self invertStack: acumulatorStack into: aStack.
	
	^resultStack 
	
	
	
	! !


!classDefinition: #StackableElements category: 'Stack-Exercise'!
Object subclass: #StackableElements
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackableElements methodsFor: 'accesing' stamp: 'IB 6/10/2021 15:52:27'!
isEmpty

	^self subclassResponsibility.! !

!StackableElements methodsFor: 'accesing' stamp: 'IB 6/10/2021 17:52:06'!
size

	^self subclassResponsibility.! !

!StackableElements methodsFor: 'accesing' stamp: 'IB 6/10/2021 15:52:35'!
top

	^self subclassResponsibility.! !


!classDefinition: #EmptyStackableElements category: 'Stack-Exercise'!
StackableElements subclass: #EmptyStackableElements
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackableElements methodsFor: 'accesing' stamp: 'IB 6/8/2021 17:18:03'!
isEmpty

	^true! !

!EmptyStackableElements methodsFor: 'accesing' stamp: 'IB 6/10/2021 17:26:01'!
size

	^0! !

!EmptyStackableElements methodsFor: 'accesing' stamp: 'IB 6/8/2021 17:39:52'!
top

	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #NonEmptyStackableElements category: 'Stack-Exercise'!
StackableElements subclass: #NonEmptyStackableElements
	instanceVariableNames: 'content previousElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyStackableElements methodsFor: 'initialization' stamp: 'IB 6/8/2021 17:13:08'!
initializeWith: anObject

	content := anObject.

	! !


!NonEmptyStackableElements methodsFor: 'accesing' stamp: 'IB 6/8/2021 17:18:03'!
isEmpty

	^false! !

!NonEmptyStackableElements methodsFor: 'accesing' stamp: 'IB 6/10/2021 17:25:50'!
previous: anElement

	previousElement := anElement! !

!NonEmptyStackableElements methodsFor: 'accesing' stamp: 'IB 6/10/2021 17:27:11'!
size

	^1 + previousElement size.! !

!NonEmptyStackableElements methodsFor: 'accesing' stamp: 'IB 6/8/2021 17:19:50'!
top

	^content! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyStackableElements class' category: 'Stack-Exercise'!
NonEmptyStackableElements class
	instanceVariableNames: ''!

!NonEmptyStackableElements class methodsFor: 'as yet unclassified' stamp: 'IB 6/8/2021 17:27:44'!
with: anObject

	^self new initializeWith: anObject.! !
