//
//  week4_step1.swift
//  CodeStarterCamp_Week4
//
//  Created by 정경우 on 2022/11/17.
//

class BodyCondition {
    var upperStrength: Int = 0 {
        didSet(oldValue) {
            print("상체근력이 \(upperStrength - oldValue) 상승합니다.")
        }
    }
    var lowerStrength: Int = 0 {
        didSet(oldValue) {
            print("하체근력이 \(lowerStrength - oldValue) 상승합니다.")
        }
    }
    
    var muscularEndurance: Int = 0 {
        didSet(oldValue) {
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    var fatigue: Int = 0 {
        didSet(oldValue) {
            print("피로도가 \(fatigue - oldValue) 만큼 변합니다.")
        }
    }
    
    func presentCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperStrength)")
        print("하체근력: \(lowerStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigue)")
        print("--------------")
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    print("<<\(sitUp.name)을(를) 시작합니다>>")
    bodyCondition.upperStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let squat: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<\(squat.name)을(를) 시작합니다>>")
    bodyCondition.lowerStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let longRunning: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<\(longRunning.name)을(를) 시작합니다>>")
    bodyCondition.upperStrength += Int.random(in: 5...10)
    bodyCondition.lowerStrength += Int.random(in: 5...10)
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 20...30)
})

let dynamicBreak: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<\(dynamicBreak.name)을(를) 시작합니다>>")
    if bodyCondition.fatigue == 0 {
        print("현재 피로도는 0이기 때문에 변화가 없습니다")
    }else{
        bodyCondition.fatigue -= Int.random(in: 5...10)
    }
})

var myBody: BodyCondition = BodyCondition()

sitUp.action(myBody)
squat.action(myBody)
longRunning.action(myBody)
dynamicBreak.action(myBody)
myBody.presentCondition()
