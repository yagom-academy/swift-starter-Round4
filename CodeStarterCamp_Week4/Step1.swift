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
              ----------------------
              현재의 컨디션은 다음과 같습니다
              상체근력: \(self.upperBodyStrength)
              하체근력: \(self.lowerBodyStrength)
              근지구력: \(self.muscularEndurance)
              피로도: \(self.fatigue)
              ----------------------
              """)
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: {
    print("<<\(sitUp.name)을(를) 실행합니다>>")
    $0.upperBodyStrength += Int.random(in: 10...20)
    $0.fatigue += Int.random(in: 10...20)
    $0.checkBodyCondition()
})

let squats : Activity = Activity(name: "스쿼트", action: {
    print("<<\(squats.name)을(를) 실행합니다>>")
    $0.lowerBodyStrength += Int.random(in: 20...30)
    $0.fatigue += Int.random(in: 10...20)
    $0.checkBodyCondition()
})

let longRun: Activity = Activity(name: "오래달리기", action: {
    print("<<\(longRun.name)을(를) 실행합니다>>")
    $0.upperBodyStrength += Int.random(in: 5...10)
    $0.lowerBodyStrength += Int.random(in: 5...10)
    $0.muscularEndurance += Int.random(in: 20...30)
    $0.fatigue += Int.random(in: 20...30)
    $0.checkBodyCondition()
})

let activeRest: Activity = Activity(name: "동적 휴식", action: {
    print("<<\(activeRest.name)을(를) 실행합니다>>")
    $0.fatigue -= Int.random(in: 20...30)
    $0.checkBodyCondition()
})
