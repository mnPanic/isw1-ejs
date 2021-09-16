!classDefinition: #NumeroTest category: 'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 4/15/2021 16:45:35'!
test27EnteroSubstractsEnteroCorrectly

	self assert: four - one equals: three! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:02'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:09'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de número inválido!!!!!!'! !


!classDefinition: #Entero category: 'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations - private' stamp: 'IA 9/13/2021 23:51:59'!
divideFraction: aFractionDividend

	^Fraccion
		with: aFractionDividend numerator
		over: aFractionDividend denominator * self.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'IA 9/13/2021 21:40:02'!
divideInteger: anIntegerDividend

	^ Fraccion with: anIntegerDividend over: self! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'IA 9/13/2021 21:31:59'!
multiplyFraction: aFractionToMultiply

	^self * aFractionToMultiply.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'IA 9/13/2021 21:32:29'!
multiplyInteger: anIntegerToMultiply

	^ self class with: value * anIntegerToMultiply integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'IA 9/13/2021 23:44:38'!
subtractFraction: aFractionMinuend

	^Fraccion
		with: aFractionMinuend numerator - (self * aFractionMinuend denominator)
		over: aFractionMinuend denominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'IA 9/13/2021 21:37:02'!
subtractInteger: anIntegerMinuend

	^ self class with: anIntegerMinuend integerValue - value! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'IA 9/13/2021 21:33:52'!
sumFraction: aFractionToAdd

	^self + aFractionToAdd.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'IA 9/13/2021 21:34:16'!
sumInteger: anIntegerToAdd

	^self class with: value + anIntegerToAdd integerValue	.! !


!Entero methodsFor: 'arithmetic operations' stamp: 'IA 9/13/2021 21:32:29'!
* aMultiplier 
	
	^aMultiplier multiplyInteger: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IA 9/13/2021 21:34:16'!
+ anAdder

	^anAdder sumInteger: self.
	
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IA 9/13/2021 21:33:38'!
- aSubtrahend

	^aSubtrahend subtractInteger: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IA 9/13/2021 21:06:10'!
/ aDivisor 
	
	^ aDivisor divideInteger: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IA 9/14/2021 17:48:59'!
fibonacci

	^self subclassResponsibility .

		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation - private' stamp: 'IA 9/14/2021 17:50:36'!
canHandle: aValue

	^ self subclassResponsibility.! !


!Entero class methodsFor: 'instance creation' stamp: 'NR 4/15/2021 16:42:24'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos!!!!!!'! !

!Entero class methodsFor: 'instance creation' stamp: 'IA 9/14/2021 17:51:57'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [ self error: 'aValue debe ser anInteger' ].
	
	^(Entero subclasses
		detect: [:aSubclass | aSubclass canHandle: aValue]
		ifNone: [self error: 'No se pudo inicializar un Entero con ese valor']) new initalizeWith: aValue.! !


!classDefinition: #Cero category: 'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'arithmetic operations' stamp: 'IA 9/14/2021 00:15:48'!
fibonacci
	
	^Entero with: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numero-Exercise'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'instance creation - private' stamp: 'IA 9/14/2021 17:50:36'!
canHandle: aValue

	^ aValue = 0.! !


!classDefinition: #EnteroMayorAUno category: 'Numero-Exercise'!
Entero subclass: #EnteroMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroMayorAUno methodsFor: 'arithmetic operations' stamp: 'IA 9/14/2021 17:49:15'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroMayorAUno class' category: 'Numero-Exercise'!
EnteroMayorAUno class
	instanceVariableNames: ''!

!EnteroMayorAUno class methodsFor: 'instance creation - private' stamp: 'IA 9/14/2021 17:56:05'!
canHandle: aValue
	
	^ aValue > 1.! !


!classDefinition: #EnteroNegativo category: 'Numero-Exercise'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroNegativo methodsFor: 'arithmetic operations' stamp: 'IA 9/14/2021 00:18:14'!
fibonacci
	
	^ self error: self class negativeFibonacciErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNegativo class' category: 'Numero-Exercise'!
EnteroNegativo class
	instanceVariableNames: ''!

!EnteroNegativo class methodsFor: 'instance creation - private' stamp: 'IA 9/14/2021 17:50:36'!
canHandle: aValue

	^ aValue < 0.! !


!classDefinition: #Uno category: 'Numero-Exercise'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'arithmetic operations' stamp: 'IA 9/14/2021 01:43:08'!
fibonacci
	
	^self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numero-Exercise'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'instance creation - private' stamp: 'IA 9/14/2021 17:50:36'!
canHandle: aValue

	^ aValue = 1.! !


!classDefinition: #Fraccion category: 'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'IA 9/13/2021 21:09:03'!
divideFraction: aFractionToDivide

	^aFractionToDivide numerator * self denominator / ( aFractionToDivide denominator * self numerator).! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'IA 9/13/2021 23:52:48'!
divideInteger: anInteger

	^Fraccion
		with: anInteger * denominator
		over: numerator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'IA 9/13/2021 21:31:59'!
multiplyFraction: aFractionToMultiply

	^ aFractionToMultiply numerator * numerator / (aFractionToMultiply denominator * denominator)! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'IA 9/13/2021 21:32:29'!
multiplyInteger: anIntegerToMultiply

	^self class with: anIntegerToMultiply * numerator over: denominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'IA 9/13/2021 21:33:22'!
subtractFraction: aFractionToSubtract

	| newNumerator newDenominator |
	
	newNumerator := (aFractionToSubtract numerator * denominator) - (aFractionToSubtract denominator * numerator).
	newDenominator := aFractionToSubtract denominator * denominator.
	
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'IA 9/13/2021 23:47:04'!
subtractInteger: anIntegerToSubtract

	^Fraccion 
		with: anIntegerToSubtract * denominator - numerator
		over: denominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'IA 9/13/2021 21:33:52'!
sumFraction: aFractionToAdd

	| newNumerator newDenominator |
	newNumerator := (numerator * aFractionToAdd denominator) + (denominator * aFractionToAdd numerator).
	newDenominator := denominator * aFractionToAdd denominator.

	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'IA 9/13/2021 21:34:16'!
sumInteger: anIntegerToAdd

	^self class with: anIntegerToAdd * denominator + numerator over: denominator.! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'IA 9/13/2021 21:31:59'!
* aMultiplier 
	
	^aMultiplier multiplyFraction: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IA 9/13/2021 21:33:52'!
+ anAdder 
	
	^anAdder sumFraction: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IA 9/13/2021 21:33:22'!
- aSubtrahend 
	
	^ aSubtrahend subtractFraction: self.

! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IA 9/13/2021 21:12:27'!
/ aDivisor 
	
	^ aDivisor divideFraction: self.
	! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'instance creation - private' stamp: 'IA 9/16/2021 01:36:12'!
canHandle: aNumerator and: aDenominator

	self subclassResponsibility.! !


!Fraccion class methodsFor: 'instance creation' stamp: 'IA 9/16/2021 02:02:24'!
with: aDividend over: aDivisor

	^(Fraccion subclasses
		detect: [:aSubclass | aSubclass canHandle: aDividend and: aDivisor]
		ifNone: [self error: 'No se pudo inicializar una Fraccion con esos valores']) with: aDividend over: aDivisor.! !


!classDefinition: #FraccionConDenominadorCero category: 'Numero-Exercise'!
Fraccion subclass: #FraccionConDenominadorCero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionConDenominadorCero class' category: 'Numero-Exercise'!
FraccionConDenominadorCero class
	instanceVariableNames: ''!

!FraccionConDenominadorCero class methodsFor: 'instance creation' stamp: 'IA 9/16/2021 01:46:55'!
with: aDividend over: aDivisor

	self error: self canNotDivideByZeroErrorDescription.! !


!FraccionConDenominadorCero class methodsFor: 'instance creation - private' stamp: 'IA 9/16/2021 02:06:01'!
canHandle: aNumerator and: aDenominator

	^aDenominator isZero! !


!classDefinition: #FraccionConDenominadorNegativo category: 'Numero-Exercise'!
Fraccion subclass: #FraccionConDenominadorNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionConDenominadorNegativo class' category: 'Numero-Exercise'!
FraccionConDenominadorNegativo class
	instanceVariableNames: ''!

!FraccionConDenominadorNegativo class methodsFor: 'instance creation - private' stamp: 'IA 9/16/2021 02:06:32'!
canHandle: aNumerator and: aDenominator

	^ aDenominator isNegative.! !


!FraccionConDenominadorNegativo class methodsFor: 'instance creation' stamp: 'IA 9/16/2021 01:49:20'!
with: aDividend over: aDivisor

	^aDividend negated / aDivisor negated.! !


!classDefinition: #FraccionConDenominadorPositivoONumeradorNoCero category: 'Numero-Exercise'!
Fraccion subclass: #FraccionConDenominadorPositivoONumeradorNoCero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionConDenominadorPositivoONumeradorNoCero class' category: 'Numero-Exercise'!
FraccionConDenominadorPositivoONumeradorNoCero class
	instanceVariableNames: ''!

!FraccionConDenominadorPositivoONumeradorNoCero class methodsFor: 'instance creation - private' stamp: 'IA 9/16/2021 02:07:42'!
canHandle: aNumerator and: aDenominator

	^ (aDenominator integerValue > 0) or: (aNumerator isZero not)! !


!FraccionConDenominadorPositivoONumeradorNoCero class methodsFor: 'instance creation' stamp: 'IA 9/16/2021 02:21:31'!
with: aDividend over: aDivisor

	| denominator greatestCommonDivisor numerator |
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	^(FraccionConDenominadorPositivoONumeradorNoCero subclasses
		detect: [:aSubclass | aSubclass isFor: denominator]
		ifNone: [self error: 'No se pudo inicializar una Fraccion con esos valores']) with: numerator over: denominator.! !


!classDefinition: #FraccionConDenominadorNoUno category: 'Numero-Exercise'!
FraccionConDenominadorPositivoONumeradorNoCero subclass: #FraccionConDenominadorNoUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionConDenominadorNoUno class' category: 'Numero-Exercise'!
FraccionConDenominadorNoUno class
	instanceVariableNames: ''!

!FraccionConDenominadorNoUno class methodsFor: 'instance creation - private' stamp: 'IA 9/16/2021 02:22:57'!
isFor: aDenominator

	^ aDenominator isOne not.! !


!FraccionConDenominadorNoUno class methodsFor: 'instance creation' stamp: 'IA 9/16/2021 02:22:23'!
with: aNumerator over: aDenominator
	
	^self new initializeWith: aNumerator over: aDenominator.! !


!classDefinition: #FraccionConDenominadorUno category: 'Numero-Exercise'!
FraccionConDenominadorPositivoONumeradorNoCero subclass: #FraccionConDenominadorUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionConDenominadorUno class' category: 'Numero-Exercise'!
FraccionConDenominadorUno class
	instanceVariableNames: ''!

!FraccionConDenominadorUno class methodsFor: 'instance creation - private' stamp: 'IA 9/16/2021 02:23:32'!
isFor: aDenominator

	^ aDenominator isOne.! !


!FraccionConDenominadorUno class methodsFor: 'instance creation' stamp: 'IA 9/16/2021 02:24:29'!
with: aNumerator over: aDenominator

	^ aNumerator.! !


!classDefinition: #FraccionConNumeradorCero category: 'Numero-Exercise'!
Fraccion subclass: #FraccionConNumeradorCero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionConNumeradorCero class' category: 'Numero-Exercise'!
FraccionConNumeradorCero class
	instanceVariableNames: ''!

!FraccionConNumeradorCero class methodsFor: 'instance creation - private' stamp: 'IA 9/16/2021 02:07:08'!
canHandle: aNumerator and: aDenominator

	^ aNumerator isZero.! !


!FraccionConNumeradorCero class methodsFor: 'instance creation' stamp: 'IA 9/16/2021 02:01:03'!
with: aDividend over: aDivisor

	^ aDividend.! !
