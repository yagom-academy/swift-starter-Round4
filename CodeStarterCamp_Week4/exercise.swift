//
//  exercise.swift
//  CodeStarterCamp_Week4
//
//  Created by 수염 on 2022/05/12.
//

import Foundation

struct Exercise {
        let name: String
        let action: () -> Void
}

let sitUp: Exercise = Exercise(name: "윗몸일으키기", action: {
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let squat: Exercise = Exercise(name: "스쿼트", action: {
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let 오래달리기: Exercise = Exercise(name: "오래달리기", action: {
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 5...10)
})

let 동적휴식: Exercise = Exercise(name: "동적휴식", action: {
    bodyCondition.fatigue -= Int.random(in: 5...10)
})
