//
//  File.swift
//  CodeStarterCamp_Week4
//
//  Created by 비모 on 2023/03/14.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기") {
    $0.upperBodyStrength += Int.random(in: 10...20)
    $0.fatigue += Int.random(in: 10...20)
}

let squat: Activity = Activity(name: "스쿼트") {
    $0.lowerBodyStrength += Int.random(in: 20...30)
    $0.fatigue += Int.random(in: 10...20)
}

let longRun: Activity = Activity(name: "오래달리기") {
    $0.muscularEndurance += Int.random(in: 20...30)
    $0.upperBodyStrength += Int.random(in: 5...10)
    $0.lowerBodyStrength += Int.random(in: 5...10)
    $0.fatigue += Int.random(in: 20...30)
}

let dynamicRest: Activity = Activity(name: "동적휴식") {
    $0.fatigue -= Int.random(in: 5...10)
}

let hangBoard: Activity = Activity(name: "행보드") {
    $0.upperBodyStrength += Int.random(in: 10...20)
    $0.muscularEndurance += Int.random(in: 10...20)
    $0.fatigue += Int.random(in: 10...20)
}
