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
            if fatigue > oldValue {
                print("피로도가 \(fatigue - oldValue) 상승합니다.")
            }else{
                print("피로도가 \(fatigue - oldValue) 하락합니다.")
            }
        }
    }
    
    func presentCondition() {
        print("""
        "--------------"
        "현재의 컨디션은 다음과 같습니다."
        "상체근력: \(upperStrength)"
        "하체근력: \(lowerStrength)"
        "근지구력: \(muscularEndurance)"
        "피로도: \(fatigue)"
        "--------------"
        """)
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    bodyCondition.upperStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let squat: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    bodyCondition.lowerStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let longRunning: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    bodyCondition.upperStrength += Int.random(in: 5...10)
    bodyCondition.lowerStrength += Int.random(in: 5...10)
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 20...30)
})

let dynamicBreak: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    if bodyCondition.fatigue == 0 {
        print("현재 피로도는 0이기 때문에 변화가 없습니다")
    }else{
        bodyCondition.fatigue -= Int.random(in: 5...10)
    }
})

func executeActivity(condition: BodyCondition, activity: Activity) {
    print("<<\(activity.name)을(를) 시작합니다>>")
    activity.action(condition)
}

var myBody: BodyCondition = BodyCondition()

executeActivity(condition: myBody, activity: sitUp)
executeActivity(condition: myBody, activity: squat)
executeActivity(condition: myBody, activity: longRunning)
executeActivity(condition: myBody, activity: dynamicBreak)
myBody.presentCondition()
