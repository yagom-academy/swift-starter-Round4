//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by eve on 2023/03/13.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let squat: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let longRun: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
})

let dynamicRest: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    bodyCondition.fatigue -= Int.random(in: 5...10)
})

let lunge: Activity = Activity(name: "런지", action: { bodyCondition in
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.muscularEndurance += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

func doExercise(_ condition: BodyCondition, activities: [Activity]) {
    guard activities.count > 0 else { return }
    
    for (index, activity) in activities.enumerated() {
        print("<<\(activity.name)을(를) 시작합니다>>")
        activity.action(condition)
        print(index == activities.count-1 ? "--------------" : "")
    }
    checkBody(condition)
}
