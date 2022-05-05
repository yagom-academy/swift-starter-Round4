//
//  Exercise.swift
//  CodeStarterCamp_Week4
//
//  Created by 윤일성 on 2022/05/05.
//

import Foundation

struct Exercise {
    let name: String
    let action: (inout BodyCondition) -> Void
}

let pushUp = Exercise(name: "팔굽혀펴기") {
    $0.upperBodyStrength += Int.random(in: 5...15)
    $0.tiredness += Int.random(in: 5...10)
}

let chinUp = Exercise(name: "턱걸이") {
    $0.upperBodyStrength += Int.random(in: 15...20)
    $0.tiredness += Int.random(in: 10...15)
}

let dip = Exercise(name: "딥스") {
    $0.upperBodyStrength += Int.random(in: 8...14)
    $0.tiredness += Int.random(in: 5...10)
}

let sitUp = Exercise(name: "윗몸일으키기") {
    $0.upperBodyStrength += Int.random(in: 10...20)
    $0.tiredness += Int.random(in: 10...20)
}

let squatting = Exercise(name: "스쿼트") {
    $0.lowerBodyStrength += Int.random(in: 20...30)
    $0.tiredness += Int.random(in: 10...20)
}

let lunge = Exercise(name: "런지") {
    $0.lowerBodyStrength += Int.random(in: 15...20)
    $0.tiredness += Int.random(in: 7...10)
}

let longRun = Exercise(name: "오래달리기") {
    $0.muscleEndurance += Int.random(in: 20...30)
    $0.upperBodyStrength += Int.random(in: 5...10)
    $0.lowerBodyStrength += Int.random(in: 5...10)
    $0.tiredness += Int.random(in: 20...30)
}

let activeRest = Exercise(name: "동적휴식") {
    $0.tiredness -= Int.random(in: 5...10)
    if $0.tiredness < 0 {
        $0.tiredness = 0
    }
}
