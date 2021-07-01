!classDefinition: #MarsRoverTest category: 'Ejercicio MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 7/1/2021 15:56:47'!
test01MarsRoverIsInCorrectPositionAfterCreated

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'N'.
	
	self assert: rover position = (0@0).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 7/1/2021 15:57:07'!
test02MarsRoverFacesCorrectCardinalPointAfterCreated

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'N'.
	
	self assert: rover cardinalPoint = 'N'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 7/1/2021 15:49:53'!
test03MarsRoverFacingNorthIsInCorrectPositionAfterMovingForward

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'N'.
	
	rover sendMovements: 'f'.
	
	self assert: rover position = (0@1).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 7/1/2021 15:50:13'!
test04MarsRoverFacingNorthIsInCorrectPositionAfterMovingBack

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'N'.
	
	rover sendMovements: 'b'.
	
	self assert: rover position = (0@-1).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 7/1/2021 15:50:33'!
test05MarsRoverFacingSouthIsInCorrectPositionAfterMovingForward

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'S'.
	
	rover sendMovements: 'f'.
	
	self assert: rover position = (0@-1).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 7/1/2021 15:50:58'!
test06MarsRoverFacingSouthIsInCorrectPositionAfterMovingBack

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'S'.
	
	rover sendMovements: 'b'.
	
	self assert: rover position = (0@1).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 7/1/2021 15:51:12'!
test07MarsRoverFacingEastIsInCorrectPositionAfterMovingForward

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'E'.
	
	rover sendMovements: 'f'.
	
	self assert: rover position = (1@0).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 7/1/2021 15:51:27'!
test08MarsRoverFacingEastIsInCorrectPositionAfterMovingBack

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'E'.
	
	rover sendMovements: 'b'.
	
	self assert: rover position = (-1@0).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 7/1/2021 15:51:48'!
test09MarsRoverFacingWestIsInCorrectPositionAfterMovingForward

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'O'.
	
	rover sendMovements: 'f'.
	
	self assert: rover position = (-1@0).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 7/1/2021 15:52:10'!
test10MarsRoverFacingWestIsInCorrectPositionAfterMovingBack

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'O'.
	
	rover sendMovements: 'b'.
	
	self assert: rover position = (1@0).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 6/29/2021 19:24:14'!
test11MarsRoverIsInCorrectPositionAfterMovingSeveralTimes

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'N'.
	
	rover sendMovements: 'bbbfbfffff'.
	
	self assert: rover position = (0@2).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 6/29/2021 19:25:45'!
test12MarsRoverIsInCorrectPositionAfterNotMovingAtAll

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'N'.
	
	rover sendMovements: ''.
	
	self assert: rover position = (0@0).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 6/29/2021 19:29:19'!
test13MarsRoverIsInCorrectPositionAfterRotatingLeftAndMoving

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'N'.
	
	rover sendMovements: 'lf'.
	
	self assert: rover position = (-1@0).
	self assert: rover cardinalPoint = 'O'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 6/29/2021 19:52:44'!
test14MarsRoverIsInCorrectPositionAfterRotatingRightAndMoving

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'E'.
	
	rover sendMovements: 'rf'.
	
	self assert: rover position = (0@-1).
	self assert: rover cardinalPoint = 'S'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 7/1/2021 15:59:25'!
test15MarsRoverIsInCorrectPositionAfterRotatingSeveralTimesAndMoving

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'N'.
	
	rover sendMovements: 'rlllrlllrllf'.
	
	self assert: rover position = (-1@0).
	self assert: rover cardinalPoint = 'O'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 7/1/2021 15:55:52'!
test16MarsRoverIsInCorrectPositionAfterRotatingAndMovingSeveralTimes

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'N'.
	
	rover sendMovements: 'fffrffbrfffl'.
	
	self assert: rover position = (1@0).
	self assert: rover cardinalPoint = 'E'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 7/1/2021 15:55:59'!
test17MarsRoverStopsExecutingCommandsWhenIncorrectCommandIsSent

	| rover |
	rover := MarsRover in: 0 and: 0 facing: 'N'.
	
	self should: [ rover sendMovements: 'ffhbb' ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
		self assert: anError messageText = 'Invalid Command' ].
	
	self assert: rover position = (0@2).! !


!classDefinition: #CardinalPoint category: 'Ejercicio MarsRover'!
Object subclass: #CardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!CardinalPoint methodsFor: 'accesing' stamp: 'IB 6/29/2021 19:43:39'!
back

	^self subclassResponsibility.! !

!CardinalPoint methodsFor: 'accesing' stamp: 'IB 6/29/2021 19:43:42'!
direction

	^self subclassResponsibility.! !

!CardinalPoint methodsFor: 'accesing' stamp: 'IB 6/29/2021 19:35:50'!
forward

	^self subclassResponsibility.! !

!CardinalPoint methodsFor: 'accesing' stamp: 'IB 6/29/2021 20:03:12'!
leftCardinalPoint

	^self subclassResponsibility.! !

!CardinalPoint methodsFor: 'accesing' stamp: 'IB 6/29/2021 20:03:28'!
rightCardinalPoint

	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalPoint class' category: 'Ejercicio MarsRover'!
CardinalPoint class
	instanceVariableNames: ''!

!CardinalPoint class methodsFor: 'as yet unclassified' stamp: 'IB 6/29/2021 19:38:54'!
initializeIn: aCardinalPoint

	| subclase subclases |
	subclases := CardinalPoint allSubclasses.
	subclase := subclases detect: [:cadaSubclase | cadaSubclase canHandle: aCardinalPoint].
	^subclase new.! !


!classDefinition: #East category: 'Ejercicio MarsRover'!
CardinalPoint subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!East methodsFor: 'accesing' stamp: 'IB 6/29/2021 19:40:52'!
back

	^(-1@0).! !

!East methodsFor: 'accesing' stamp: 'IB 6/29/2021 19:43:52'!
direction

	^'E'.! !

!East methodsFor: 'accesing' stamp: 'IB 6/29/2021 19:36:02'!
forward

	^(1@0).! !

!East methodsFor: 'accesing' stamp: 'IB 6/29/2021 20:03:12'!
leftCardinalPoint

	^North new.! !

!East methodsFor: 'accesing' stamp: 'IB 6/29/2021 20:03:28'!
rightCardinalPoint

	^South new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'Ejercicio MarsRover'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'as yet unclassified' stamp: 'IB 6/29/2021 19:39:10'!
canHandle: aCardinalPoint

	^aCardinalPoint = 'E'! !


!classDefinition: #North category: 'Ejercicio MarsRover'!
CardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!North methodsFor: 'accesing' stamp: 'IB 6/29/2021 19:41:01'!
back

	^(0@-1).! !

!North methodsFor: 'accesing' stamp: 'IB 6/29/2021 19:43:58'!
direction

	^'N'.! !

!North methodsFor: 'accesing' stamp: 'IB 6/29/2021 19:36:42'!
forward

	^(0@1).! !

!North methodsFor: 'accesing' stamp: 'IB 6/29/2021 20:03:12'!
leftCardinalPoint

	^West new.! !

!North methodsFor: 'accesing' stamp: 'IB 6/29/2021 20:03:28'!
rightCardinalPoint

	^East new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'Ejercicio MarsRover'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'as yet unclassified' stamp: 'IB 6/29/2021 19:39:16'!
canHandle: aCardinalPoint

	^aCardinalPoint = 'N'! !


!classDefinition: #South category: 'Ejercicio MarsRover'!
CardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!South methodsFor: 'accesing' stamp: 'IB 6/29/2021 19:41:09'!
back

	^(0@1).! !

!South methodsFor: 'accesing' stamp: 'IB 6/29/2021 19:44:04'!
direction

	^'S'.! !

!South methodsFor: 'accesing' stamp: 'IB 6/29/2021 19:37:01'!
forward

	^(0@-1).! !

!South methodsFor: 'accesing' stamp: 'IB 6/29/2021 20:03:12'!
leftCardinalPoint

	^East new.! !

!South methodsFor: 'accesing' stamp: 'IB 6/29/2021 20:03:28'!
rightCardinalPoint

	^West new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'Ejercicio MarsRover'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'as yet unclassified' stamp: 'IB 6/29/2021 19:39:22'!
canHandle: aCardinalPoint

	^aCardinalPoint = 'S'! !


!classDefinition: #West category: 'Ejercicio MarsRover'!
CardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!West methodsFor: 'accesing' stamp: 'IB 6/29/2021 19:41:15'!
back

	^(1@0).! !

!West methodsFor: 'accesing' stamp: 'IB 6/29/2021 19:44:10'!
direction

	^'O'.! !

!West methodsFor: 'accesing' stamp: 'IB 6/29/2021 19:37:06'!
forward

	^(-1@0).! !

!West methodsFor: 'accesing' stamp: 'IB 6/29/2021 20:03:12'!
leftCardinalPoint

	^South new.! !

!West methodsFor: 'accesing' stamp: 'IB 6/29/2021 20:03:28'!
rightCardinalPoint

	^North new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'Ejercicio MarsRover'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'as yet unclassified' stamp: 'IB 6/29/2021 19:39:27'!
canHandle: aCardinalPoint

	^aCardinalPoint = 'O'! !


!classDefinition: #MarsRover category: 'Ejercicio MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!MarsRover methodsFor: 'accesing' stamp: 'IB 6/29/2021 19:43:32'!
cardinalPoint

	^cardinalPoint direction.! !

!MarsRover methodsFor: 'accesing' stamp: 'IB 6/29/2021 18:57:36'!
position

	^position.! !

!MarsRover methodsFor: 'accesing' stamp: 'IB 7/1/2021 15:45:35'!
sendMovements: aSeriesOfMovements

	aSeriesOfMovements collect: [:eachMovement | (RoverCommand with: eachMovement) doActionTo: self ].! !


!MarsRover methodsFor: 'initialization' stamp: 'IB 6/29/2021 18:58:44'!
initializeIn: x and: y facing: aCardinalPoint

	position := x@y.
	
	cardinalPoint := aCardinalPoint.! !


!MarsRover methodsFor: 'actions' stamp: 'IB 6/29/2021 19:59:42'!
moveBack

	position := position + cardinalPoint back.! !

!MarsRover methodsFor: 'actions' stamp: 'IB 6/29/2021 19:59:51'!
moveForward

	position := position + cardinalPoint forward.! !

!MarsRover methodsFor: 'actions' stamp: 'IB 6/29/2021 20:04:04'!
rotateLeft

	cardinalPoint := cardinalPoint leftCardinalPoint.! !

!MarsRover methodsFor: 'actions' stamp: 'IB 6/29/2021 20:04:14'!
rotateRight

	cardinalPoint := cardinalPoint rightCardinalPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Ejercicio MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'IB 6/29/2021 19:38:25'!
in: x and: y facing: aCardinalPoint

	^self new initializeIn: x and: y facing: (CardinalPoint initializeIn: aCardinalPoint).! !


!classDefinition: #RoverCommand category: 'Ejercicio MarsRover'!
Object subclass: #RoverCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!RoverCommand methodsFor: 'as yet unclassified' stamp: 'IB 6/29/2021 20:01:46'!
doActionTo: aRover

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RoverCommand class' category: 'Ejercicio MarsRover'!
RoverCommand class
	instanceVariableNames: ''!

!RoverCommand class methodsFor: 'as yet unclassified' stamp: 'IB 6/29/2021 19:56:27'!
invalidCommandErrorDescription

	^'Invalid Command'! !

!RoverCommand class methodsFor: 'as yet unclassified' stamp: 'IB 7/1/2021 15:45:35'!
with: anAction

	| subclase subclases |
	subclases := RoverCommand allSubclasses.
	subclase := subclases detect: [:cadaSubclase | cadaSubclase canHandle: anAction] ifNone: [self error: self invalidCommandErrorDescription].
	^subclase new.! !


!classDefinition: #MoveBack category: 'Ejercicio MarsRover'!
RoverCommand subclass: #MoveBack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!MoveBack methodsFor: 'as yet unclassified' stamp: 'IB 6/29/2021 19:58:38'!
doActionTo: aRover

	aRover moveBack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveBack class' category: 'Ejercicio MarsRover'!
MoveBack class
	instanceVariableNames: ''!

!MoveBack class methodsFor: 'as yet unclassified' stamp: 'IB 6/29/2021 19:56:42'!
canHandle: anAction

	^$b = anAction.! !


!classDefinition: #MoveForward category: 'Ejercicio MarsRover'!
RoverCommand subclass: #MoveForward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!MoveForward methodsFor: 'as yet unclassified' stamp: 'IB 6/29/2021 19:58:50'!
doActionTo: aRover

	aRover moveForward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveForward class' category: 'Ejercicio MarsRover'!
MoveForward class
	instanceVariableNames: ''!

!MoveForward class methodsFor: 'as yet unclassified' stamp: 'IB 6/29/2021 19:56:49'!
canHandle: anAction

	^$f = anAction.! !


!classDefinition: #RotateLeft category: 'Ejercicio MarsRover'!
RoverCommand subclass: #RotateLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!RotateLeft methodsFor: 'as yet unclassified' stamp: 'IB 6/29/2021 20:04:31'!
doActionTo: aRover

	aRover rotateLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateLeft class' category: 'Ejercicio MarsRover'!
RotateLeft class
	instanceVariableNames: ''!

!RotateLeft class methodsFor: 'as yet unclassified' stamp: 'IB 6/29/2021 19:56:56'!
canHandle: anAction

	^$l = anAction.! !


!classDefinition: #RotateRight category: 'Ejercicio MarsRover'!
RoverCommand subclass: #RotateRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!RotateRight methodsFor: 'as yet unclassified' stamp: 'IB 6/29/2021 20:04:42'!
doActionTo: aRover

	aRover rotateRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateRight class' category: 'Ejercicio MarsRover'!
RotateRight class
	instanceVariableNames: ''!

!RotateRight class methodsFor: 'as yet unclassified' stamp: 'IB 6/29/2021 19:57:01'!
canHandle: anAction

	^$r = anAction.! !
