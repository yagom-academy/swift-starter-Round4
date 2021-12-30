//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let defaultBodyCondition = BodyCondition(upperBodyStrength: 0,
                                  lowerBodyStrength: 0,
                                  muscularEndurance: 0,
                                  fatigue: 0)

let situp: Exercise = Exercise(name: "윗몸일으키기", action: {
    defaultBodyCondition.upperBodyStrength += Int.random(in: ExerciseOption.mediumLevelRange)
    defaultBodyCondition.fatigue += Int.random(in: ExerciseOption.mediumLevelRange)
})

let squat: Exercise = Exercise(name: "스쿼트", action: {
    defaultBodyCondition.lowerBodyStrength += Int.random(in: ExerciseOption.highLevelRange)
    defaultBodyCondition.fatigue += Int.random(in: ExerciseOption.mediumLevelRange)
})

let running: Exercise = Exercise(name: "오래달리기", action: {
    defaultBodyCondition.muscularEndurance += Int.random(in: ExerciseOption.highLevelRange)
    defaultBodyCondition.upperBodyStrength += Int.random(in: ExerciseOption.lowLevelRange)
    defaultBodyCondition.lowerBodyStrength += Int.random(in: ExerciseOption.lowLevelRange)
    defaultBodyCondition.fatigue += Int.random(in: ExerciseOption.highLevelRange)
})

let activeRest: Exercise = Exercise(name: "동적휴식", action: {
    defaultBodyCondition.fatigue -= Int.random(in: ExerciseOption.lowLevelRange)
    defaultBodyCondition.fatigue -= Int.random(in: ExerciseOption.lowLevelRange)
})

let hellRoutine = Routine(name: "hellRoutine",
                      bodyCondition: defaultBodyCondition,
                      exercises: [situp,
                                  situp,
                                  squat,
                                  squat,
                                  activeRest,
                                  running,
                                  running])

let ohMyGodRoutine = Routine(name: "ohMyGodRoutine",
                      bodyCondition: defaultBodyCondition,
                      exercises: [situp,
                                  situp,
                                  squat,
                                  squat,
                                  activeRest,
                                  running,
                                  running])

let routineList = [hellRoutine, ohMyGodRoutine]
let inputView = InputView()
let resultView = ResultView()
let nameOfMember = try inputView.inputNameOfMember()
let goalsBodyCondition = try inputView.inputGolasBodyCondition()
let member = Person(name: nameOfMember, bodyCondition: defaultBodyCondition)
let fitnessCenter = FitnessCenter(goalsBodyCondition: BodyCondition(upperBodyStrength: goalsBodyCondition[0],
                                                                     lowerBodyStrength: goalsBodyCondition[1],
                                                                     muscularEndurance: goalsBodyCondition[2],
                                                                     fatigue: 0),
                                   member: member,
                                   routineList: routineList)

do {
    try fitnessCenter.start()
    resultView.printSuccessMessage(member: member)
} catch FitnessError.fatigueFull {
    resultView.printError(fitnessError: FitnessError.fatigueFull, member: member)
} catch FitnessError.failToReachGoals {
    resultView.printError(fitnessError: FitnessError.failToReachGoals, member: member)
    try fitnessCenter.start()
}

