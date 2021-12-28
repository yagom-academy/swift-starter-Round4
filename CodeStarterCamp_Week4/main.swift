//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let bodyCondition = BodyCondition(upperBodyStrength: 0,
                                  lowerBodyStrength: 0,
                                  muscularEndurance: 0,
                                  fatigue: 0)

let situp: Exercise = Exercise(name: "윗몸일으키기", action: {
    bodyCondition.upperBodyStrength += Int.random(in: ExerciseOption.mediumLevelRange)
    bodyCondition.fatigue += Int.random(in: ExerciseOption.mediumLevelRange)
})

let squat: Exercise = Exercise(name: "스쿼트", action: {
    bodyCondition.lowerBodyStrength += Int.random(in: ExerciseOption.highLevelRange)
    bodyCondition.fatigue += Int.random(in: ExerciseOption.mediumLevelRange)
})

let running: Exercise = Exercise(name: "오래달리기", action: {
    bodyCondition.muscularEndurance += Int.random(in: ExerciseOption.highLevelRange)
    bodyCondition.upperBodyStrength += Int.random(in: ExerciseOption.lowLevelRange)
    bodyCondition.lowerBodyStrength += Int.random(in: ExerciseOption.lowLevelRange)
    bodyCondition.fatigue += Int.random(in: ExerciseOption.highLevelRange)
})

let activeRest: Exercise = Exercise(name: "동적휴식", action: {
    bodyCondition.fatigue -= Int.random(in: ExerciseOption.lowLevelRange)
})

let routine = Routine(name: "hellRoutine",
                      bodyCondition: bodyCondition,
                      exercises: [situp,
                                  situp,
                                  squat,
                                  squat,
                                  activeRest,
                                  running,
                                  running])

routine.start()
