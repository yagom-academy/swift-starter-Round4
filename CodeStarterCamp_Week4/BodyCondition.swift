import Foundation

class BodyCondition {
	var upperMuscle: Int = 0
	var lowerMuscle: Int = 0
	var endurance: Int = 0
	var fatigue: Int = 0
	
	func printCondition() {
	print("""
		--------------
		현재의 컨디션은 다음과 같습니다.
		상체근력: \(upperMuscle)
		하체근력: \(lowerMuscle)
		근지구력: \(endurance)
		피로도: \(fatigue)
		""")
	}
}
