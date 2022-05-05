//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Exercise {
    let name: String
    let action: (BodyCondition) -> BodyCondition
}

let pushUp = Exercise(name: "팔굽혀펴기") { (bodyCondition: BodyCondition) in
    var exerciserBodyCondition = bodyCondition
    exerciserBodyCondition.upperBodyStrength += Int.random(in: 5...15)
    exerciserBodyCondition.tiredness += Int.random(in: 5...10)
    return exerciserBodyCondition
}

let chinUp = Exercise(name: "턱걸이") { (bodyCondition: BodyCondition) in
    var exerciserBodyCondition = bodyCondition
    exerciserBodyCondition.upperBodyStrength += Int.random(in: 15...20)
    exerciserBodyCondition.tiredness += Int.random(in: 10...15)
    return exerciserBodyCondition
}

let dip = Exercise(name: "딥스") { (bodyCondition: BodyCondition) in
    var exerciserBodyCondition = bodyCondition
    exerciserBodyCondition.upperBodyStrength += Int.random(in: 8...14)
    exerciserBodyCondition.tiredness += Int.random(in: 5...10)
    return exerciserBodyCondition
}

let sitUp = Exercise(name: "윗몸일으키기") { (bodyCondition: BodyCondition) in
    var exerciserBodyCondition = bodyCondition
    exerciserBodyCondition.upperBodyStrength += Int.random(in: 10...20)
    exerciserBodyCondition.tiredness += Int.random(in: 10...20)
    return exerciserBodyCondition
}

let squatting = Exercise(name: "스쿼트") { (bodyCondition: BodyCondition) in
    var exerciserBodyCondition = bodyCondition
    exerciserBodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    exerciserBodyCondition.tiredness += Int.random(in: 10...20)
    return exerciserBodyCondition
}

let lunge = Exercise(name: "런지") { (bodyCondition: BodyCondition) in
    var exerciserBodyCondition = bodyCondition
    exerciserBodyCondition.lowerBodyStrength += Int.random(in: 15...20)
    exerciserBodyCondition.tiredness += Int.random(in: 7...10)
    return exerciserBodyCondition
}

let longRun = Exercise(name: "오래달리기") { (bodyCondition: BodyCondition) in
    var exerciserBodyCondition = bodyCondition
    exerciserBodyCondition.muscleEndurance += Int.random(in: 20...30)
    exerciserBodyCondition.upperBodyStrength += Int.random(in: 5...10)
    exerciserBodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    exerciserBodyCondition.tiredness += Int.random(in: 20...30)
    return exerciserBodyCondition
}

let activeRest = Exercise(name: "동적휴식") { (bodyCondition: BodyCondition) in
    var exerciserBodyCondition = bodyCondition
    exerciserBodyCondition.tiredness -= Int.random(in: 5...10)
    if exerciserBodyCondition.tiredness < 0 {
        exerciserBodyCondition.tiredness = 0
    }
    return exerciserBodyCondition
}

var myBodyCondition = BodyCondition()
let emptyRoutine = Routine(name: "Empty")
let upperBodyRoutine = Routine(name: "Upper Body", exercises: pushUp, dip, chinUp, activeRest, chinUp, dip, pushUp)
let lowerBodyRoutine = Routine(name: "Lower Body", exercises: squatting, squatting, squatting, activeRest, lunge, lunge, lunge)
let wholeBodyRoutine = Routine(name: "Whole Body", exercises: longRun, activeRest, pushUp, dip, chinUp, activeRest, squatting, lunge, activeRest, sitUp)

myBodyCondition = emptyRoutine.startRoutine(based: myBodyCondition)
myBodyCondition = upperBodyRoutine.startRoutine(based: myBodyCondition)
