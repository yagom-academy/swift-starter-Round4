//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let myBodyCondition: BodyCondition = BodyCondition(upperBodyMuscleStrength: 0, lowerBodyMuscleStrength: 0, muscularEndurance: 0, tiredness: 0)

let sitUp: Exercise = Exercise(name: "윗몸일으키기", action: {
    (bodyCondition: BodyCondition) in
    bodyCondition.upperBodyMuscleStrength += bodyCondition.selectRandomStatusIndex(min: 10, max: 20)
    bodyCondition.tiredness += bodyCondition.selectRandomStatusIndex(min: 10, max: 20)
})

let squat: Exercise = Exercise(name: "스쿼트", action: { (bodyCondition: BodyCondition) in
    bodyCondition.lowerBodyMuscleStrength += bodyCondition.selectRandomStatusIndex(min: 20, max: 30)
    bodyCondition.tiredness += bodyCondition.selectRandomStatusIndex(min: 10, max: 20)
})

let longRunning: Exercise = Exercise(name: "오래달리기", action: { (bodyCondition: BodyCondition) in
    bodyCondition.upperBodyMuscleStrength += bodyCondition.selectRandomStatusIndex(min: 5, max: 10)
    bodyCondition.lowerBodyMuscleStrength += bodyCondition.selectRandomStatusIndex(min: 5, max: 10)
    bodyCondition.muscularEndurance += bodyCondition.selectRandomStatusIndex(min: 20, max: 30)
    bodyCondition.tiredness += bodyCondition.selectRandomStatusIndex(min: 20, max: 30)
})

let activeRest: Exercise = Exercise(name: "동적휴식", action: { (bodyCondition: BodyCondition) in
    bodyCondition.tiredness -= bodyCondition.selectRandomStatusIndex(min: 5, max: 10)
})

let todayRoutine: Routine = Routine(name: "전신 근육 박살내기 루틴", routineArray: [sitUp, sitUp, activeRest, squat, squat, activeRest, longRunning, longRunning])

todayRoutine.startExerciseRoutine()
myBodyCondition.printMucleStatus()


