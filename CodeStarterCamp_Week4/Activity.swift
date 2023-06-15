//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by Lee minyeol on 2023/06/14.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let situp: Activity = Activity(name: "윗몸일으키기", action: { BodyCondition in
    BodyCondition.upperBodyMuscle += executeAction(from: 10, to: 20, condition: .upperBodyMuscle, energy: true)
    BodyCondition.fatigue += executeAction(from: 10, to: 20, condition: .fatigue, energy: true)
})

let squat: Activity = Activity(name: "스쿼트", action: { BodyCondition in
    BodyCondition.lowerBodyMuscle += executeAction(from: 10, to: 20, condition: .lowerBodyMuscle, energy: true)
    BodyCondition.fatigue += executeAction(from: 10, to: 20, condition: .fatigue, energy: true)
})

let longrun: Activity = Activity(name: "오래달리기", action: { BodyCondition in
    BodyCondition.muscularEndurance += executeAction(from: 20, to: 30, condition: .muscularEndurance, energy: true)
    BodyCondition.upperBodyMuscle += executeAction(from: 5, to: 10, condition: .upperBodyMuscle, energy: true)
    BodyCondition.lowerBodyMuscle += executeAction(from: 5, to: 10, condition: .lowerBodyMuscle, energy: true)
    BodyCondition.fatigue += executeAction(from: 20, to: 30, condition: .fatigue, energy: true)
})

let activerest: Activity = Activity(name: "동적휴식", action: { BodyCondition in
    BodyCondition.fatigue -= executeAction(from: 5, to: 10, condition: .fatigue, energy: false)
})
