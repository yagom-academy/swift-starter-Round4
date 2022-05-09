import Foundation

struct Routine {
	let routineName: String
	let exercises: [Exercise]
	
	mutating func playMyRoutine(condition: BodyCondition) {
		print("""
		--------------
		hellRoutine을 시작합니다.
		""")
		for exercise in exercises {
			print("\(exercise.name)")
			exercise.action()
		}
		condition.printCondition()
	}
}
