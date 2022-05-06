//
//  Exercise.swift
//  CodeStarterCamp_Week4
//
//  Created by 김인호 on 2022/05/04.
//

import Foundation

struct Exercise {
    let name: String
    let action: (inout BodyCondition) -> Void
}

let sitUp = Exercise(name: "윗몸일으키기") {
    $0.changeCondition(of: "upperBodyStrength", about: Int.random(in: 10...20))
    $0.changeCondition(of: "fatigue", about: Int.random(in: 10...20))
}

let pullUp = Exercise(name: "풀업") {
    $0.changeCondition(of: "upperBodyStrength", about: Int.random(in: 20...30))
    $0.changeCondition(of: "fatigue", about: Int.random(in: 15...25))
}

let pushUp = Exercise(name: "푸쉬업") {
    $0.changeCondition(of: "upperBodyStrength", about: Int.random(in: 10...20))
    $0.changeCondition(of: "fatigue", about: Int.random(in: 10...20))
}

let squat = Exercise(name: "스쿼트") {
    $0.changeCondition(of: "lowerBodyStrength", about: Int.random(in: 20...30))
    $0.changeCondition(of: "fatigue", about: Int.random(in: 10...20))
}

let lunge = Exercise(name: "런지") {
    $0.changeCondition(of: "lowerBodyStrength", about: Int.random(in: 20...30))
    $0.changeCondition(of: "fatigue", about: Int.random(in: 10...20))
}

let longRun = Exercise(name: "오래달리기") {
    $0.changeCondition(of: "muscularEndurance", about: Int.random(in: 20...30))
    $0.changeCondition(of: "upperBodyStrength", about: Int.random(in: 5...10))
    $0.changeCondition(of: "lowerBodyStrength", about: Int.random(in: 5...10))
    $0.changeCondition(of: "fatigue", about: Int.random(in: 20...30))
}

let activeRest = Exercise(name: "동적휴식") {
    $0.changeCondition(of: "fatigue", about: Int.random(in: 5...10))
}

