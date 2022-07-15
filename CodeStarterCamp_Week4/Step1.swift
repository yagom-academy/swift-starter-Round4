import Foundation

class BodyCondition {
    var upperBodyStrength: Int,
        lowerBodyStrength: Int,
        muscularEndurance: Int,
        fatigue: Int
    
    init(upeerBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upeerBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func checkBodyConditionChange(after activity: Activity, compareWith BodyConditionBeforeActivity: [Int]) {
        print("<<\(activity.name)을(를) 실행합니다>>")
        
        let currentBodyConditon = [upperBodyStrength, lowerBodyStrength, muscularEndurance, fatigue]
        
        var growth = [Int]()
        
        for index in 0...3 {
            growth.append(currentBodyConditon[index] - BodyConditionBeforeActivity[index])
        }
        
        if growth[0] > 0 {
            print("상체근력이 \(growth[0])만큼 증가했습니다")
        }
        if growth[1] > 0 {
            print("하체근력이 \(growth[1])만큼 증가했습니다")
        }
        if growth[2] > 0 {
            print("근지구력이 \(growth[2])만큼 증가했습니다")
        }
        if growth[3] > 0 {
            print("피로도가 \(growth[3])만큼 증가했습니다")
        } else if growth[3] < 0 {
            print("피로도가 \(-growth[3])만큼 감소했습니다")
        }
        
        print("""
              ----------------------
              현재의 컨디션은 다음과 같습니다
              상체근력: \(self.upperBodyStrength)
              하체근력: \(self.lowerBodyStrength)
              근지구력: \(self.muscularEndurance)
              피로도: \(self.fatigue)
              """)
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> BodyCondition
}

var sitUp: Activity = Activity(name: "윗몸일으키기", action: {
    let beforeActivityBodyCondition = [$0.upperBodyStrength, $0.lowerBodyStrength, $0.muscularEndurance, $0.fatigue]
    $0.upperBodyStrength += Int.random(in: 10...20)
    $0.fatigue += Int.random(in: 10...20)
    $0.checkBodyConditionChange(after: sitUp, compareWith: beforeActivityBodyCondition)
    return $0
})

var squats : Activity = Activity(name: "스쿼트", action: {
    let beforeActivityBodyCondition = [$0.upperBodyStrength, $0.lowerBodyStrength, $0.muscularEndurance, $0.fatigue]
    $0.lowerBodyStrength += Int.random(in: 20...30)
    $0.fatigue += Int.random(in: 10...20)
    $0.checkBodyConditionChange(after: squats, compareWith: beforeActivityBodyCondition)
    return $0
})

var longRun: Activity = Activity(name: "오래달리기", action: {
    let beforeActivityBodyCondition = [$0.upperBodyStrength, $0.lowerBodyStrength, $0.muscularEndurance, $0.fatigue]
    $0.upperBodyStrength += Int.random(in: 5...10)
    $0.lowerBodyStrength += Int.random(in: 5...10)
    $0.muscularEndurance += Int.random(in: 20...30)
    $0.fatigue += Int.random(in: 20...30)
    $0.checkBodyConditionChange(after: longRun, compareWith: beforeActivityBodyCondition)
    return $0
})

var activeRest: Activity = Activity(name: "동적 휴식", action: {
    let beforeActivityBodyCondition = [$0.upperBodyStrength, $0.lowerBodyStrength, $0.muscularEndurance, $0.fatigue]
    $0.fatigue -= Int.random(in: 20...30)
    $0.checkBodyConditionChange(after: activeRest, compareWith: beforeActivityBodyCondition)
    return $0
})

