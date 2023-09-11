//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by QL Jeong on 2023/09/07.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp = Activity(name: "윗몸일으키기") {
    $0.setUpperBodyStrength($0.upperBodyStrength + Int.random(in: 10...20))
    $0.setFatigue($0.fatigue + Int.random(in: 10...20))
}

let squat = Activity(name: "스쿼트") {
    $0.setLowerBodyStrength($0.lowerBodyStrength + Int.random(in: 20...30))
    $0.setFatigue($0.fatigue + Int.random(in: 10...20))
}

let longRun = Activity(name: "오래달리기") {
    $0.setUpperBodyStrength($0.upperBodyStrength + Int.random(in: 5...10))
    $0.setLowerBodyStrength($0.lowerBodyStrength + Int.random(in: 5...10))
    $0.setMuscularEndurance($0.muscularEndurance + Int.random(in: 20...30))
    $0.setFatigue($0.fatigue + Int.random(in: 20...30))
}

let stretchRest = Activity(name: "동적휴식") {
    $0.setFatigue($0.fatigue - Int.random(in: 5...10))
}

let noWorkoutSleep = Activity(name: "수면") {
    $0.setUpperBodyStrength($0.upperBodyStrength - Int.random(in: 5...15))
    $0.setLowerBodyStrength($0.lowerBodyStrength - Int.random(in: 5...15))
    $0.setMuscularEndurance($0.muscularEndurance - Int.random(in: 5...15))
    $0.setFatigue($0.fatigue - Int.random(in: 20...50))
}
