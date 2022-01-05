//
//  exercise.swift
//  CodeStarterCamp_Week4
//
//  Created by 박세웅 on 2022/01/06.
//

import Foundation

struct Exercise {
    let name: String
    let action:() -> Void
}

let situp = Exercise(name: "윗몸일으키기", action: {
    myBodyCondition.upperMuscles += randomNumber(from: 10, to: 20)
    myBodyCondition.fatigue += randomNumber(from: 10, to: 20)
})
let squat = Exercise(name: "스쿼트", action: {
    myBodyCondition.lowerMuscles += randomNumber(from: 20, to: 30)
    myBodyCondition.fatigue += randomNumber(from: 10, to: 20)
})
let running = Exercise(name: "오래달리기", action: {
    myBodyCondition.endurance += randomNumber(from: 20, to: 30)
    myBodyCondition.upperMuscles += randomNumber(from: 5, to: 10)
    myBodyCondition.lowerMuscles += randomNumber(from: 5, to: 10)
    myBodyCondition.fatigue += randomNumber(from: 20, to: 30)
})
let pilates = Exercise(name: "필라테스", action: {
    myBodyCondition.endurance += randomNumber(from: 10, to: 20)
    myBodyCondition.fatigue += randomNumber(from: 5, to: 10)
})
let rest = Exercise(name: "동적휴식", action: {
    myBodyCondition.fatigue -= randomNumber(from: 5, to: 10)
})
