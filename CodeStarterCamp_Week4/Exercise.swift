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
    
    enum NumberOfRange {
        static let range1 = 5...10
        static let range2 = 10...20
        static let range3 = 20...30
    }
}

let 윗몸일으키기: Exercise = Exercise(name: "윗몸일으키기") {
    bodyCondition.상체근력 += Int.random(in: Exercise.NumberOfRange.range1)
    bodyCondition.피로도 += Int.random(in: Exercise.NumberOfRange.range2)
}

let 스쿼트: Exercise = Exercise(name: "스쿼트") {
    bodyCondition.하체근력 += Int.random(in: Exercise.NumberOfRange.range3)
    bodyCondition.피로도 += Int.random(in: Exercise.NumberOfRange.range2)
}

let 오래달리기: Exercise = Exercise(name: "오래달리기") {
    bodyCondition.근지구력 += Int.random(in: Exercise.NumberOfRange.range3)
    bodyCondition.상체근력 += Int.random(in: Exercise.NumberOfRange.range1)
    bodyCondition.하체근력 += Int.random(in: Exercise.NumberOfRange.range1)
    bodyCondition.피로도 += Int.random(in: Exercise.NumberOfRange.range3)
}

let 동적휴식: Exercise = Exercise(name: "동적휴식") {
    bodyCondition.피로도 -= Int.random(in: Exercise.NumberOfRange.range1)
}

let 철봉매달리기: Exercise = Exercise(name: "철봉매달리기") {
    bodyCondition.근지구력 += Int.random(in: Exercise.NumberOfRange.range3)
    bodyCondition.피로도 += Int.random(in: Exercise.NumberOfRange.range1)
}
