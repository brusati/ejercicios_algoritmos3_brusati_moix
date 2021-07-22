!classDefinition: #TestMarsRover category: 'marsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'marsRover'!

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 6/30/2021 16:05:43'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LL 7/1/2021 00:42:36'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #TestMarsRoverLog category: 'marsRover'!
TestCase subclass: #TestMarsRoverLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'marsRover'!

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IB 7/22/2021 14:53:26'!
test01DoesNotLogPositionWhenNotMovingAtAll

	| marsRover positionLog |
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	
	positionLog := MarsRoverLog new.
	marsRover addPositionObserver: positionLog.
	
	self assert: positionLog getLog equals: OrderedCollection new.
	! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IB 7/22/2021 14:10:05'!
test02LogsPositionWhenMovingBack

	| marsRover positionLog |
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	
	positionLog := MarsRoverLog new.
	marsRover addPositionObserver: positionLog.
	
	marsRover processCommands: 'b'.
	
	self assert: positionLog getLog equals: (OrderedCollection with: '0@-1').
	! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IB 7/22/2021 14:53:37'!
test03LogsPositionWhenMovingForward

	| marsRover positionLog |
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	
	positionLog := MarsRoverLog new.
	marsRover addPositionObserver: positionLog.
	
	marsRover processCommands: 'f'.
	
	self assert: positionLog getLog equals: (OrderedCollection with: '0@1').
	! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IB 7/22/2021 14:53:45'!
test04LogsPositionWhenMovingSeveralTimes
	| marsRover positionLog |
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	
	positionLog := MarsRoverLog new.
	marsRover addPositionObserver: positionLog.
	
	marsRover processCommands: 'bf'.
	
	self assert: positionLog getLog equals: (OrderedCollection with: '0@-1' with: '0@0' ).
	! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IB 7/22/2021 14:55:44'!
test05DoesNotLogHeadingWhenNotRotatingAtAll

	| marsRover headingLog |
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	
	headingLog := MarsRoverLog new.
	marsRover addHeadingObserver: headingLog.
	
	self assert: headingLog getLog equals: OrderedCollection new.
	! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IB 7/22/2021 14:54:28'!
test06LogsHeadingWhenRotatingToEast
	| marsRover headingLog |
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	
	headingLog := MarsRoverLog new.
	marsRover addHeadingObserver: headingLog.
	
	marsRover processCommands: 'r'.
	
	self assert: headingLog getLog equals: (OrderedCollection with: 'Este' ).
	! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IB 7/22/2021 14:11:14'!
test07LogsHeadingWhenRotatingToNorth
	| marsRover headingLog |
	marsRover := MarsRover startingAt: (0@0) heading: #East.
	
	headingLog := MarsRoverLog new.
	marsRover addHeadingObserver: headingLog.
	
	marsRover processCommands: 'l'.
	
	self assert: headingLog getLog equals: (OrderedCollection with: 'Norte' ).
	! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IB 7/22/2021 14:55:21'!
test08LogsHeadingWhenRotatingToWest
	| marsRover headingLog |
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	
	headingLog := MarsRoverLog new.
	marsRover addHeadingObserver: headingLog.
	
	marsRover processCommands: 'l'.
	
	self assert: headingLog getLog equals: (OrderedCollection with: 'Oeste' ).
	! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IB 7/22/2021 14:54:47'!
test09LogsHeadingWhenRotatingToSouth
	| marsRover headingLog |
	marsRover := MarsRover startingAt: (0@0) heading: #East.
	
	headingLog := MarsRoverLog new.
	marsRover addHeadingObserver: headingLog.
	
	marsRover processCommands: 'r'.
	
	self assert: headingLog getLog equals: (OrderedCollection with: 'Sur' ).
	! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IB 7/22/2021 14:55:55'!
test10LogsHeadingWhenRotatingSeveralTimes
	| marsRover headingLog |
	marsRover := MarsRover startingAt: (0@0) heading: #East.
	
	headingLog := MarsRoverLog new.
	marsRover addHeadingObserver: headingLog.
	
	marsRover processCommands: 'll'.
	
	self assert: headingLog getLog equals: (OrderedCollection with: 'Norte' with: 'Oeste' ).
	! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IB 7/22/2021 14:56:09'!
test11CanLogPositionAndHeadingAtTheSameTime
	| marsRover log |
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	
	log := MarsRoverLog new.
	marsRover addPositionObserver: log.
	marsRover addHeadingObserver: log.
	
	marsRover processCommands: 'fl'.
	
	self assert: log getLog equals: (OrderedCollection with: '0@1' with: 'Oeste' ).
	! !


!classDefinition: #TestMarsRoverWindow category: 'marsRover'!
TestCase subclass: #TestMarsRoverWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'marsRover'!

!TestMarsRoverWindow methodsFor: 'tests' stamp: 'IB 7/22/2021 17:14:21'!
test01UpdatesPositionWhenMovingOnce

	| marsRover positionWindow |
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	
	positionWindow := MarsRoverWindow new.
	marsRover addPositionObserver: positionWindow.
	
	marsRover processCommands: 'f'.
	
	self assert: '0@1' equals: positionWindow positionTextField.
	! !

!TestMarsRoverWindow methodsFor: 'tests' stamp: 'IB 7/22/2021 17:14:35'!
test02UpdatesPositionWhenMovingSeveralTimes

	| marsRover positionWindow |
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	
	positionWindow := MarsRoverWindow new.
	marsRover addPositionObserver: positionWindow.
	
	marsRover processCommands: 'ff'.
	
	self assert: '0@2' equals: positionWindow positionTextField.
	! !

!TestMarsRoverWindow methodsFor: 'tests' stamp: 'IB 7/22/2021 17:14:44'!
test03UpdatesHeadingWhenRotatingToEast

	| marsRover headingWindow |
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	
	headingWindow := MarsRoverWindow new.
	marsRover addHeadingObserver: headingWindow.
	
	marsRover processCommands: 'r'.
	
	self assert: 'Este' equals: headingWindow headingTextField.
	! !

!TestMarsRoverWindow methodsFor: 'tests' stamp: 'IB 7/22/2021 14:14:58'!
test04UpdatesHeadingWhenRotatingToSouth

	| marsRover headingWindow |
	marsRover := MarsRover startingAt: (0@0) heading: #West.
	
	headingWindow := MarsRoverWindow new.
	marsRover addHeadingObserver: headingWindow.
	
	marsRover processCommands: 'l'.
	
	self assert: 'Sur' equals: headingWindow headingTextField.
	! !

!TestMarsRoverWindow methodsFor: 'tests' stamp: 'IB 7/22/2021 14:15:15'!
test05UpdatesHeadingWhenRotatingToNorth

	| marsRover headingWindow |
	marsRover := MarsRover startingAt: (0@0) heading: #West.
	
	headingWindow := MarsRoverWindow new.
	marsRover addHeadingObserver: headingWindow.
	
	marsRover processCommands: 'r'.
	
	self assert: 'Norte' equals: headingWindow headingTextField.
	! !

!TestMarsRoverWindow methodsFor: 'tests' stamp: 'IB 7/22/2021 17:14:52'!
test06UpdatesHeadingWhenRotatingToWest

	| marsRover headingWindow |
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	
	headingWindow := MarsRoverWindow new.
	marsRover addHeadingObserver: headingWindow.
	
	marsRover processCommands: 'l'.
	
	self assert: 'Oeste' equals: headingWindow headingTextField.
	! !

!TestMarsRoverWindow methodsFor: 'tests' stamp: 'IB 7/22/2021 17:15:28'!
test07UpdatesHeadingWhenRotatingSeveralTimes

	| marsRover headingWindow |
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	
	headingWindow := MarsRoverWindow new.
	marsRover addHeadingObserver: headingWindow.
	
	marsRover processCommands: 'll'.
	
	self assert: 'Sur' equals: headingWindow headingTextField.
	! !

!TestMarsRoverWindow methodsFor: 'tests' stamp: 'IB 7/22/2021 17:15:35'!
test08UpdatesPositionAndHeadingAtTheSameTime

	| marsRover window |
	marsRover := MarsRover startingAt: (0@0) heading: #West.
	
	window := MarsRoverWindow new.
	marsRover addPositionObserver: window.
	marsRover addHeadingObserver: window.
	
	marsRover processCommands: 'rf'.
	
	self assert: 'Norte' equals: window headingTextField.
	self assert: '0@1' equals: window positionTextField.
	! !


!classDefinition: #MarsRover category: 'marsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'marsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'IB 7/22/2021 14:41:33'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := MarsRoverAttributeLinker initializeWith: aPosition andAMessageForObservers: #positionChangedTo:.
	head := MarsRoverAttributeLinker initializeWith: (MarsRoverHead of: self facing: aCardinalPoint) andAMessageForObservers: #headingChangedTo:.! !


!MarsRover methodsFor: 'process commands' stamp: 'LL 6/30/2021 15:54:14'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'IB 7/22/2021 14:28:35'!
isAt: aPosition heading: aCardinalPoint

	^ position value = aPosition and: [ head isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'IB 7/19/2021 21:19:55'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ head movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ head movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ head rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ head rotateLeft ].
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'IB 7/22/2021 15:04:20'!
move: aStep

	position updateValue: position + aStep.! !

!MarsRover methodsFor: 'dd - moving' stamp: 'IB 7/21/2021 21:26:49'!
moveDown

	self move: (0@-1).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'IB 7/21/2021 21:26:49'!
moveLeft

	self move: (-1@0).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'IB 7/21/2021 21:26:49'!
moveRight

	self move: (1@0).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'IB 7/21/2021 21:26:49'!
moveUp

	self move: (0@1).! !


!MarsRover methodsFor: 'dd - heading' stamp: 'IB 7/22/2021 15:04:20'!
head: aNewHead

	head updateValue: aNewHead.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'IB 7/21/2021 13:34:30'!
headEast

	self head: (MarsRoverHeadFacingEast of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'IB 7/21/2021 13:34:43'!
headNorth

	self head: (MarsRoverHeadFacingNorth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'IB 7/21/2021 13:34:50'!
headSouth

	self head: (MarsRoverHeadFacingSouth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'IB 7/21/2021 13:34:58'!
headWest

	self head: (MarsRoverHeadFacingWest of: self).! !


!MarsRover methodsFor: 'add observers' stamp: 'IB 7/21/2021 18:06:09'!
addHeadingObserver: anObserver

	head addObserver: anObserver.! !

!MarsRover methodsFor: 'add observers' stamp: 'IB 7/21/2021 18:06:13'!
addPositionObserver: anObserver

	position addObserver: anObserver.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'marsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverAttributeLinker category: 'marsRover'!
Object subclass: #MarsRoverAttributeLinker
	instanceVariableNames: 'observers value observersMessage'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'marsRover'!

!MarsRoverAttributeLinker methodsFor: 'private' stamp: 'IB 7/22/2021 14:51:37'!
notifyObservers

	observers do: [ :anObserver | self sendObserversMessageTo: anObserver ].! !

!MarsRoverAttributeLinker methodsFor: 'private' stamp: 'IB 7/22/2021 14:51:27'!
sendObserversMessageTo: anObserver

	(Message selector: observersMessage argument: value) sendTo: anObserver.! !


!MarsRoverAttributeLinker methodsFor: 'initialization' stamp: 'IB 7/22/2021 00:12:52'!
initializeWith: anInitializationValue andAMessageForObservers: aMessageForObservers

	value := anInitializationValue.
	observers := OrderedCollection new.
	observersMessage := aMessageForObservers.! !


!MarsRoverAttributeLinker methodsFor: 'accesing' stamp: 'IB 7/21/2021 18:02:47'!
addObserver: anObserver

	observers add: anObserver.! !

!MarsRoverAttributeLinker methodsFor: 'accesing' stamp: 'IB 7/21/2021 18:10:34'!
doesNotUnderstand: aMessage

	^aMessage sendTo: self value.! !

!MarsRoverAttributeLinker methodsFor: 'accesing' stamp: 'IB 7/22/2021 15:04:20'!
updateValue: aNewValue

	value := aNewValue.
	self notifyObservers.! !

!MarsRoverAttributeLinker methodsFor: 'accesing' stamp: 'IB 7/21/2021 17:59:44'!
value

	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverAttributeLinker class' category: 'marsRover'!
MarsRoverAttributeLinker class
	instanceVariableNames: ''!

!MarsRoverAttributeLinker class methodsFor: 'instance creation' stamp: 'IB 7/22/2021 00:12:27'!
initializeWith: anInitializationValue andAMessageForObservers: aMessageForObservers

	^self new initializeWith: anInitializationValue andAMessageForObservers: aMessageForObservers.! !


!classDefinition: #MarsRoverHead category: 'marsRover'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'marsRover'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:43'!
rotateRight

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'marsRover'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'marsRover'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'marsRover'!

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'IB 7/22/2021 15:00:13'!
directionAsString

	^'Este'.! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'marsRover'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'marsRover'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'marsRover'!

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'IB 7/22/2021 15:00:23'!
directionAsString

	^'Norte'.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'marsRover'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'marsRover'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'marsRover'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'IB 7/22/2021 15:00:29'!
directionAsString

	^'Sur'.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'marsRover'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'marsRover'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'marsRover'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'IB 7/22/2021 15:00:37'!
directionAsString

	^'Oeste'.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'marsRover'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverLog category: 'marsRover'!
Object subclass: #MarsRoverLog
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'marsRover'!

!MarsRoverLog methodsFor: 'initialization' stamp: 'IB 7/22/2021 14:06:39'!
initialize

	log := OrderedCollection new.! !


!MarsRoverLog methodsFor: 'accesing' stamp: 'IB 7/22/2021 14:06:39'!
getLog

	 ^log! !

!MarsRoverLog methodsFor: 'accesing' stamp: 'IB 7/22/2021 15:01:21'!
headingChangedTo: aNewHead

	log add: aNewHead directionAsString.! !

!MarsRoverLog methodsFor: 'accesing' stamp: 'IB 7/22/2021 15:03:27'!
positionChangedTo: aNewPosition

	log add: aNewPosition asString.! !


!classDefinition: #MarsRoverWindow category: 'marsRover'!
Object subclass: #MarsRoverWindow
	instanceVariableNames: 'positionTextField headingTextField'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'marsRover'!

!MarsRoverWindow methodsFor: 'accesing' stamp: 'IB 7/22/2021 15:00:58'!
headingChangedTo: aNewHead

	headingTextField := aNewHead directionAsString.! !

!MarsRoverWindow methodsFor: 'accesing' stamp: 'IB 7/22/2021 00:30:37'!
headingTextField

	^headingTextField.! !

!MarsRoverWindow methodsFor: 'accesing' stamp: 'IB 7/22/2021 00:30:58'!
positionChangedTo: aNewPosition
	
	positionTextField := aNewPosition asString.
	! !

!MarsRoverWindow methodsFor: 'accesing' stamp: 'IB 7/22/2021 00:30:48'!
positionTextField

	^positionTextField.! !
