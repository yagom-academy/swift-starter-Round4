//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var bodyCondition: BodyCondition = BodyCondition(upperBody: 0, lowerBody: 0, muscularEndurance: 0, fatigue: 0)
let sitUp = Exercise(name: "윗몸일으키기") {
    bodyCondition.upperBody += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)

}

let squat = Exercise(name: "스쿼트") {
    bodyCondition.lowerBody += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
}

let longRun = Exercise(name: "오래달리기") {
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.upperBody += Int.random(in: 5...10)
    bodyCondition.lowerBody += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
}

let dynamicalRest = Exercise(name: "동적휴식") {
    let decreaseFatigue = Int.random(in: 5...10)
    if bodyCondition.fatigue > decreaseFatigue {
        bodyCondition.fatigue -= decreaseFatigue
    } else {
        bodyCondition.fatigue = 0
    }
}

let pushUp = Exercise(name: "푸시업") {
    bodyCondition.upperBody += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
}

let routine = Routine(name: "hellRoutine", exercises: [sitUp, sitUp, dynamicalRest, squat, squat, dynamicalRest, longRun, longRun, dynamicalRest, pushUp, pushUp])

routine.run()
bodyCondition.printStatus()
