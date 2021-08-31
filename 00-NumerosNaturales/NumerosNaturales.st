!classDefinition: #I category: 'Natural Numbers'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Natural Numbers'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'IA 8/30/2021 23:38:20'!
* unFactor
	^unFactor.! !

!I class methodsFor: 'as yet unclassified' stamp: 'IA 8/26/2021 21:24:53'!
+ aNaturalNumber
	^aNaturalNumber  next.! !

!I class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:15:56'!
- unSustraendo
	^self error: self descripcionDeErrorDeNumerosNegativosNoSoportados! !

!I class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:07:59'!
/ unDivisor
	unDivisor = I ifTrue: [^I].
	self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor! !

!I class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:08:55'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ 'No se puede dividir por un numero mayor'.! !

!I class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:16:43'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^ 'Numeros negativos no soportados'! !

!I class methodsFor: 'as yet unclassified' stamp: 'IA 8/26/2021 21:20:11'!
next
	
	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'IA 8/30/2021 23:25:41'!
restarCon: unMinuendo
	^ unMinuendo previous! !


!classDefinition: #II category: 'Natural Numbers'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Natural Numbers'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'IA 8/30/2021 23:42:39'!
* unFactor
	^ unFactor + (unFactor * self previous)! !

!II class methodsFor: 'as yet unclassified' stamp: 'IA 8/26/2021 21:27:38'!
+ aNaturalNumber

	^self previous + aNaturalNumber  next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'IA 8/30/2021 23:28:29'!
- unSustraendo
	
	^unSustraendo restarCon: self! !

!II class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:04:49'!
/ unDivisor
	self next - unDivisor = I ifTrue: [^I].
	^ I + ((self - unDivisor) / unDivisor)! !

!II class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !

!II class methodsFor: 'as yet unclassified' stamp: 'IA 8/26/2021 21:28:36'!
next
	next ifNotNil: [^next].
	next _ II createChildNamed: self name, 'I'.
	next previous: self.
	^next! !

!II class methodsFor: 'as yet unclassified' stamp: 'IA 8/26/2021 21:31:58'!
previous

	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'IA 8/26/2021 21:31:37'!
previous: aNaturalNumber

	previous _ aNaturalNumber.! !

!II class methodsFor: 'as yet unclassified' stamp: 'IA 8/30/2021 23:31:47'!
restarCon: unMinuendo 
	^ unMinuendo previous - self previous.! !


!classDefinition: #III category: 'Natural Numbers'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Natural Numbers'!
III class
	instanceVariableNames: ''!

!III class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: 'Natural Numbers'!
II subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: 'Natural Numbers'!
IIII class
	instanceVariableNames: ''!

!IIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	previous := III.! !


!classDefinition: #IIIII category: 'Natural Numbers'!
II subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: 'Natural Numbers'!
IIIII class
	instanceVariableNames: ''!

!IIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIII.
	previous := IIII.! !


!classDefinition: #IIIIII category: 'Natural Numbers'!
II subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: 'Natural Numbers'!
IIIIII class
	instanceVariableNames: ''!

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIII.
	previous := IIIII.! !


!classDefinition: #IIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIII class' category: 'Natural Numbers'!
IIIIIII class
	instanceVariableNames: ''!

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIII.
	previous := IIIIII.! !


!classDefinition: #IIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIII class' category: 'Natural Numbers'!
IIIIIIII class
	instanceVariableNames: ''!

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIII.
	previous := IIIIIII.! !


!classDefinition: #IIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIII.
	previous := IIIIIIII.! !


!classDefinition: #IIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIII.
	previous := IIIIIIIII.! !


!classDefinition: #IIIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIII.
	previous := IIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIIII.
	previous := IIIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIIIII.
	previous := IIIIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIIIIII.
	previous := IIIIIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIIIIIII.
	previous := IIIIIIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIIIIIIII.
	previous := IIIIIIIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIIIIIIIII.
	previous := IIIIIIIIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIIIIIIIIII.
	previous := IIIIIIIIIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIIIIIIIIIII.
	previous := IIIIIIIIIIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIIIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIIIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIIIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIIIIIIIIIIII.
	previous := IIIIIIIIIIIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIIIIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIIIIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIIIIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIIIIIIIIIIIII.
	previous := IIIIIIIIIIIIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIIIIIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIIIIIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIIIIIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIIIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIIIIIIIIIIIIII.
	previous := IIIIIIIIIIIIIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIIIIIIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIIIIIIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIIIIIIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIIIIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIIIIIIIIIIIIIII.
	previous := IIIIIIIIIIIIIIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIIIIIIIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIIIIIIIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIIIIIIIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIIIIIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIIIIIIIIIIIIIIII.
	previous := IIIIIIIIIIIIIIIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIIIIIIIIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIIIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIIIIIIIIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIIIIIIIIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIIIIIIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIIIIIIIIIIIIIIIII.
	previous := IIIIIIIIIIIIIIIIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIIIIIIIIIIIIIIIII category: 'Natural Numbers'!
II subclass: #IIIIIIIIIIIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Natural Numbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIIIIIIIIIIIIIIIII class' category: 'Natural Numbers'!
IIIIIIIIIIIIIIIIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIIIIIIIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'IA 8/31/2021 00:32:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := AnObsoleteIIIIIIIIIIIIIIIIIIIIIIIIIII.
	previous := IIIIIIIIIIIIIIIIIIIIIIIII.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!
IIIIII initializeAfterFileIn!
IIIIIII initializeAfterFileIn!
IIIIIIII initializeAfterFileIn!
IIIIIIIII initializeAfterFileIn!
IIIIIIIIII initializeAfterFileIn!
IIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIIIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIIIIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIIIIIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIIIIIIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIIIIIIIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIIIIIIIIIIIIIIIII initializeAfterFileIn!