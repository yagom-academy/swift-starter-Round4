import Foundation

class BodyCondtion {
    var upperBodyStrength: Int // 상체근력
    var lowerBodyStrength: Int // 하체근력
    var muscleEndurance: Int // 근지구력
    var tiredness: Int // 피로도
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscleEndurance: Int, tiredness: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscleEndurance = muscleEndurance
        self.tiredness = tiredness
    }

    func checkCondition() {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscleEndurance)")
        print("피로도: \(tiredness)")
    }
}
