//
//  excercise.swift
//  CodeStarterCamp_Week4
//
//  Created by song on 2021/12/29.
//

import Foundation


struct Exercise {
        let name: String
        let action: () -> Void
}

let 윗몸일으키기: Exercise = Exercise(name: "윗몸일으키기",
        action: {
    bodyCondition.upperbodystrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})


let 스쿼트: Exercise = Exercise(name: "스쿼트",
        action: {
    bodyCondition.lowerbodystrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
})


let 오래달리기: Exercise = Exercise(name: "오래달리기",
        action: {
    bodyCondition.muscularendurance += Int.random(in: 20...30)
    bodyCondition.upperbodystrength += Int.random(in: 5...10)
    bodyCondition.lowerbodystrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
})


let 동적휴식: Exercise = Exercise(name: "동적휴식",
        action: {
    bodyCondition.fatigue -= Int.random(in: 5...10)
})


