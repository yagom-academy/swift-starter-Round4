import Foundation

class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func showStatus() {
        print("""
        --------------
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(bodyCondition.upperBodyStrength)
        하체근력: \(bodyCondition.lowerBodyStrength)
        근지구력: \(bodyCondition.muscularEndurance)
        피로도: \(bodyCondition.fatigue)
        """)
    }
}
