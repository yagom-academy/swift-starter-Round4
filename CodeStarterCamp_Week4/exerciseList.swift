//
//  exerciseList.swift
//  CodeStarterCamp_Week4
//
//  Created by Lily on 2022/05/13.
//

import Foundation

var sitUp: Exercise = Exercise(name: "윗몸일으키기", action: { (bodyCondition: BodyCondition) -> Void in
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let squat: Exercise = Exercise(name: "스쿼트", action: { (bodyCondition: BodyCondition) -> Void in
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let longRun: Exercise = Exercise(name: "오래달리기", action: { (bodyCondition: BodyCondition) -> Void in
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 20...30)
})

let activeRest: Exercise = Exercise(name: "동적휴식", action: { (bodyCondition: BodyCondition) -> Void in
    bodyCondition.fatigue -= Int.random(in: 5...10)
})
