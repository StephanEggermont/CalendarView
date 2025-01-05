Class {
	#name : #BaselineOfCalendarView,
	#superclass : #BaselineOf,
	#category : #BaselineOfCalendarView
}

{ #category : #loading }
BaselineOfCalendarView class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'CalendarView' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfCalendarView >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'CalendarView'
		]
]
