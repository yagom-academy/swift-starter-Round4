//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var myBodyCondition = BodyCondition(upperBodyStrength: 30, lowerBodyStrength: 30, muscleEndurance: 10)

let pushUp = Exercise(name: "팔굽혀펴기") {
    myBodyCondition.increaseUpperBodyStrength(by: Int.random(in: 5...15))
    myBodyCondition.increaseTiredness(by: Int.random(in: 5...10))
}

let chinUp = Exercise(name: "턱걸이") {
    myBodyCondition.increaseUpperBodyStrength(by: Int.random(in: 15...20))
    myBodyCondition.increaseTiredness(by: Int.random(in: 10...15))
}

let dip = Exercise(name: "딥스") {
    myBodyCondition.increaseUpperBodyStrength(by: Int.random(in: 8...14))
    myBodyCondition.increaseTiredness(by: Int.random(in: 5...10))
}

let sitUp = Exercise(name: "윗몸일으키기") {
    myBodyCondition.increaseUpperBodyStrength(by: Int.random(in: 10...20))
    myBodyCondition.increaseTiredness(by: Int.random(in: 10...20))
}

let squatting = Exercise(name: "스쿼트") {
    myBodyCondition.increaseLowerBodyStrength(by: Int.random(in: 20...30))
    myBodyCondition.increaseTiredness(by: Int.random(in: 10...20))
}

let lunge = Exercise(name: "런지") {
    myBodyCondition.increaseLowerBodyStrength(by: Int.random(in: 15...20))
    myBodyCondition.increaseTiredness(by: Int.random(in: 7...10))
}

let longRun = Exercise(name: "오래달리기") {
    myBodyCondition.increaseMuscleEndurance(by: Int.random(in: 20...30))
    myBodyCondition.increaseUpperBodyStrength(by: Int.random(in: 5...10))
    myBodyCondition.increaseLowerBodyStrength(by: Int.random(in: 5...10))
    myBodyCondition.increaseTiredness(by: Int.random(in: 20...30))
}

let activeRest = Exercise(name: "동적휴식") {
    myBodyCondition.declineTiredness(by: Int.random(in: 5...10))
}

let emptyRoutine = Routine(name: "Empty")
let upperBodyRoutine = Routine(name: "Upper Body", exercises: pushUp, dip, chinUp, activeRest, chinUp, dip, pushUp)
let lowerBodyRoutine = Routine(name: "Lower Body", exercises: squatting, squatting, squatting, activeRest, lunge, lunge, lunge)
let wholeBodyRoutine = Routine(name: "Whole Body", exercises: longRun, activeRest, pushUp, dip, chinUp, activeRest, squatting, lunge, activeRest, sitUp)

var yagomFitnessCenter = FitnessCenter(name: "야곰", routines: upperBodyRoutine, lowerBodyRoutine)

yagomFitnessCenter.startFitnessProgram()
