//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by Jay Shin on 3/7/24.
//

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void

    func startActivity(_ bodyCondition: BodyCondition) {
        print("<<\(name)을(를) 시작합니다>>")
        action(bodyCondition)
        bodyCondition.checkBodyCondition()
    }
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: {bodyCondition in
    bodyCondition.upperMuscleStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let squat: Activity = Activity(name: "스쿼트", action: {bodyCondition in
    bodyCondition.lowerMuscleStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let running: Activity = Activity(name: "오래달리기", action: {bodyCondition in
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.upperMuscleStrength += Int.random(in: 5...10)
    bodyCondition.lowerMuscleStrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
})

let activeRecovery: Activity = Activity(name: "동적휴식", action: {bodyCondition in
    bodyCondition.fatigue -= Int.random(in: 5...10)
})
