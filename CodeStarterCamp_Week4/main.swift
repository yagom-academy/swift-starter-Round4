//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum PersonError: Error {
    case beDrained
}

let pushUp = Exercise(name: "팔굽혀펴기") {
    $0.increaseUpperBodyStrength(by: Int.random(in: 5...15))
    $0.increaseTiredness(by: Int.random(in: 5...10))
}

let chinUp = Exercise(name: "턱걸이") {
    $0.increaseUpperBodyStrength(by: Int.random(in: 15...20))
    $0.increaseTiredness(by: Int.random(in: 10...15))
}

let dip = Exercise(name: "딥스") {
    $0.increaseUpperBodyStrength(by: Int.random(in: 8...14))
    $0.increaseTiredness(by: Int.random(in: 5...10))
}

let sitUp = Exercise(name: "윗몸일으키기") {
    $0.increaseUpperBodyStrength(by: Int.random(in: 10...20))
    $0.increaseTiredness(by: Int.random(in: 10...20))
}

let squatting = Exercise(name: "스쿼트") {
    $0.increaseLowerBodyStrength(by: Int.random(in: 20...30))
    $0.increaseTiredness(by: Int.random(in: 7...10))
}

let lunge = Exercise(name: "런지") {
    $0.increaseLowerBodyStrength(by: Int.random(in: 15...20))
    $0.increaseTiredness(by: Int.random(in: 7...10))
}

let longRun = Exercise(name: "오래달리기") {
    $0.increaseMuscleEndurance(by: Int.random(in: 20...30))
    $0.increaseUpperBodyStrength(by: Int.random(in: 5...10))
    $0.increaseLowerBodyStrength(by: Int.random(in: 5...10))
    $0.increaseTiredness(by: Int.random(in: 20...30))
}

let activeRest = Exercise(name: "동적휴식") {
    $0.declineTiredness(by: Int.random(in: 5...10))
}

let emptyRoutine = Routine(name: "Empty")
let upperBodyRoutine = Routine(name: "Upper Body", exercises: pushUp, activeRest, dip, activeRest, chinUp, activeRest, chinUp, dip, pushUp)
let lowerBodyRoutine = Routine(name: "Lower Body", exercises: squatting, squatting,  activeRest, squatting, activeRest, lunge, lunge, activeRest, lunge)
let wholeBodyRoutine = Routine(name: "Whole Body", exercises: longRun, activeRest, pushUp, activeRest, dip, chinUp, activeRest, squatting, activeRest, lunge, activeRest, sitUp)

var yagomFitnessCenter = FitnessCenter(name: "야곰", routines: upperBodyRoutine, lowerBodyRoutine, wholeBodyRoutine)

yagomFitnessCenter.startFitnessProgram()
