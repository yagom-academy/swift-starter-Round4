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
let fitnessCenter = FitnessCenter(bodyCondition: defaultBodyCondition,
                                  routineList: routineList,
                                  inputView: inputView,
                                  resultView: resultView)
fitnessCenter.startFitnessProcess()

