import Foundation
class BodyCondition {
    var upperBodyStrength: Int = 30
    var legStrength: Int = 45
    var muscularEndurance: Int = 25
    var tiredness: Int = 0
    
    func printCondtion() {
        print("""
            현재의 컨디션은 다음과 같습니다.
            상체근력: \(bodyCondition.upperBodyStrength)
            하체근력: \(bodyCondition.legStrength)
            근지구력: \(bodyCondition.muscularEndurance)
            피로도: \(bodyCondition.tiredness)
            --------------
            """)
    }
}
