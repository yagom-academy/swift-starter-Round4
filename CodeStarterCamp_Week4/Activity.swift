//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by 이지은 on 3/7/24.
//

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
    
    func startWorkout(_ bodyCondition: BodyCondition) {
        print("<<\(name)을(를) 시작합니다>>")
        action(bodyCondition)
        bodyCondition.showCondition()
    }
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: {BodyCondition in
    BodyCondition.upperBodyStrength += Int.random(in: 10...20)
    BodyCondition.fatigue += Int.random(in: 10...20)
})
let squat: Activity = Activity(name: "스쿼트", action: {BodyCondition in
    BodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    BodyCondition.fatigue += Int.random(in: 10...20)
})
let longDistanceRunning: Activity = Activity(name: "오래달리기", action: {BodyCondition in
    BodyCondition.muscularEndurance += Int.random(in: 20...30)
    BodyCondition.upperBodyStrength += Int.random(in: 5...10)
    BodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    BodyCondition.fatigue += Int.random(in: 20...30)
})
let activeRest: Activity = Activity(name: "동적휴식", action: {BodyCondition in
    BodyCondition.fatigue -= Int.random(in: 5...10)
})
