//
//  Exercise.swift
//  CodeStarterCamp_Week4
//
//  Created by marisol on 2022/01/04.
//

import Foundation

struct Exercise {
    let name: String
    let action: () -> Void
}

let 윗몸일으키기: Exercise = Exercise(name: "윗몸일으키기") {
    var randomNumber1: Int = Int.random(in: 10...20)
    var randomNumber2: Int = Int.random(in: 10...20)
    bodyCondition.상체근력 += randomNumber1
    bodyCondition.피로도 += randomNumber2
}

let 스쿼트: Exercise = Exercise(name: "스쿼트") {
    var randomNumber1: Int = Int.random(in: 20...30)
    var randomNumber2: Int = Int.random(in: 10...20)
    bodyCondition.하체근력 += randomNumber1
    bodyCondition.피로도 += randomNumber2
}

let 오래달리기: Exercise = Exercise(name: "오래달리기") {
    var randomNumber1: Int = Int.random(in: 20...30)
    var randomNumber2: Int = Int.random(in: 5...10)
    bodyCondition.근지구력 += randomNumber1
    bodyCondition.상체근력 += randomNumber2
    bodyCondition.하체근력 += randomNumber2
    bodyCondition.피로도 += randomNumber1
}

let 동적휴식: Exercise = Exercise(name: "동적휴식") {
    var randomNumber: Int = Int.random(in: 5...10)
    bodyCondition.피로도 -= randomNumber
}

let 철봉매달리기: Exercise = Exercise(name: "철봉매달리기") {
    var randomNumber: Int = Int.random(in: 20...30)
    bodyCondition.근지구력 += randomNumber
    bodyCondition.피로도 += randomNumber
}
