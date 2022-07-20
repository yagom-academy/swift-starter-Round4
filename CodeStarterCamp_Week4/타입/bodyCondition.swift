import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        didSet(upperBodyStrengthBeforeActivity) {
            print("상체근력이 \(upperBodyStrength - upperBodyStrengthBeforeActivity)만큼 증가했습니다")
        }
    }
    var lowerBodyStrength: Int {
        didSet(lowerBodyStrengthBeforeActivity) {
            print("하체근력이 \(lowerBodyStrength - lowerBodyStrengthBeforeActivity)만큼 증가했습니다")
        }
    }
    var muscularEndurance: Int {
        didSet(muscularEnduranceBeforeActivity) {
            print("근지구력이 \(muscularEndurance - muscularEnduranceBeforeActivity)만큼 증가했습니다")
        }
    }
    var fatigue: Int {
        didSet(fatigueBeforeActivity) {
            if fatigue > fatigueBeforeActivity {
                print("피로도가 \(fatigue - fatigueBeforeActivity)만큼 증가했습니다")
            } else if fatigue < fatigueBeforeActivity {
                print("피로도가 \(fatigueBeforeActivity - fatigue)만큼 감소했습니다")
            }
        }
    }
    
    init(upeerBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upeerBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func checkBodyCondition() {
        print("""
              현재의 컨디션은 다음과 같습니다
              상체근력: \(self.upperBodyStrength)
              하체근력: \(self.lowerBodyStrength)
              근지구력: \(self.muscularEndurance)
              피로도: \(self.fatigue)
              """)
    }
}
