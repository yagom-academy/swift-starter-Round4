import Foundation

class BodyCondition {
	var upperMicle: Int = 0
	var lowerMicle: Int = 0
	var endurance: Int = 0
	var fatigue: Int = 0
	
	func yourConsition() {
	print("""
		--------------
		현재의 컨디션은 다음과 같습니다.
		상체근력: \(upperMicle)
		하체근력: \(lowerMicle)
		근지구력: \(endurance)
		피로도: \(fatigue)
		""")
	}
}
