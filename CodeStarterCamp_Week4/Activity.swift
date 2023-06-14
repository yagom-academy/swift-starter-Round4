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
    BodyCondition.upperBodyMuscle += executeAction(a: 10, b: 20, condtion: .upperBodyMuscle, energy: 5)
    BodyCondition.fatigue += executeAction(a: 10, b: 20, condtion: .fatigue, energy: 5)
})

let squat: Activity = Activity(name: "스쿼트", action: { BodyCondition in
    BodyCondition.lowerBodtMuscle += executeAction(a: 20, b: 30, condtion: .lowerBodtMuscle, energy: 5)
    BodyCondition.fatigue += executeAction(a: 10, b: 20, condtion: .fatigue, energy: 5)
})

let longrun: Activity = Activity(name: "오래달리기", action: { BodyCondition in
    BodyCondition.muscularEndurance += executeAction(a: 20, b: 30, condtion: .muscularEndurance, energy: 5)
    BodyCondition.upperBodyMuscle += executeAction(a: 5, b: 10, condtion: .upperBodyMuscle, energy: 5)
    BodyCondition.lowerBodtMuscle += executeAction(a: 5, b: 10, condtion: .lowerBodtMuscle, energy: 5)
    BodyCondition.fatigue += executeAction(a: 20, b: 30, condtion: .fatigue, energy: 5)
})

let activerest: Activity = Activity(name: "동적휴식", action: { BodyCondition in
    BodyCondition.fatigue -= executeAction(a: 5, b: 10, condtion: .fatigue, energy: 3)
})
