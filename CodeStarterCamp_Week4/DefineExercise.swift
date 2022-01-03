//
//  DefineExercise.swift
//  CodeStarterCamp_Week4
//
//  Created by Jungmo Yu on 2021/12/31.
//

import Foundation


let 윗몸일으키기: Exercise = Exercise(name: "윗몸일으키기", action: {
    publicBodyCondition.upperBodyStrength += Int.random(in: 10...20)
    publicBodyCondition.fatigue += Int.random(in: 10...20)
})

let 스쿼트: Exercise = Exercise(name: "스쿼트", action: {
    publicBodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    publicBodyCondition.fatigue += Int.random(in: 10...20)
})

let 오래달리기: Exercise = Exercise(name: "오래달리기", action: {
    publicBodyCondition.muscularEndurance += Int.random(in: 20...30)
    publicBodyCondition.upperBodyStrength += Int.random(in: 5...10)
    publicBodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    publicBodyCondition.fatigue += Int.random(in: 20...30)
})

let 동적휴식: Exercise = Exercise(name: "동적휴식", action: {
    publicBodyCondition.fatigue -= Int.random(in: 10...20)

    guard publicBodyCondition.fatigue >= 0 else {
        publicBodyCondition.fatigue = 0
        return
    }
})


