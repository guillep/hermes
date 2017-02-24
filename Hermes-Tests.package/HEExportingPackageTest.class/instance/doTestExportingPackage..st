as yet unclassified
doTestExportingPackage: aPackageNamed
	| old new aPackage |
	aPackage := RPackageOrganizer default packageNamed: aPackageNamed.
	old := HEPackage for:aPackage.
 
	old writeInto: writer.
	new := HEPackage readFrom: reader.
	
	self assert: old classes size equals: (aPackage definedClasses reject:#isTrait) size.
	self assert: old extensionMethods size equals: (aPackage extensionMethods) size.
	
	self assert: ( old classes allSatisfy: [ :e | self in: old classes allSuperclassesAreBeforeThan: e] ).

	self assert: new equals: old.