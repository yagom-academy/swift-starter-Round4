//
//  DefineExercise.swift
//  CodeStarterCamp_Week4
//
//  Created by Jungmo Yu on 2021/12/31.
//

import Foundation


let 윗몸일으키기: Exercise = Exercise(name: "윗몸일으키기", action: {
    myBodyCondition.upperBodyStrength += UInt.random(in: 10...20)
    myBodyCondition.fatigue += Int.random(in: 10...20)
})

let 스쿼트: Exercise = Exercise(name: "스쿼트", action: {
    myBodyCondition.lowerBodyStrength += UInt.random(in: 20...30)
    myBodyCondition.fatigue += Int.random(in: 10...20)
})

let 오래달리기: Exercise = Exercise(name: "오래달리기", action: {
    myBodyCondition.muscularEndurance += UInt.random(in: 20...30)
    myBodyCondition.upperBodyStrength += UInt.random(in: 5...10)
    myBodyCondition.lowerBodyStrength += UInt.random(in: 5...10)
    myBodyCondition.fatigue += Int.random(in: 20...30)
})

let 동적휴식: Exercise = Exercise(name: "동적휴식", action: {
    myBodyCondition.fatigue -= Int.random(in: 10...20)

    guard myBodyCondition.fatigue >= 0 else {
        myBodyCondition.fatigue = 0
        return
    }
})


