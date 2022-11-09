//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/// Activity 제작 함수
/// - Parameters:
///   - exercises: 수행할 운동 종류(중첩 가능)
///   - condition: BodyCondition
/// - Returns: 수행할 Activity 배열
func makeActivity(exercises: [Exercise], condition: BodyCondition) -> [Activity] {
    return exercises.map { exercise -> Activity in
        Activity(name: exercise.rawValue) { bodyCondition in
            bodyCondition.upperBodyStrength += exercise.upperMuscleStrength
            bodyCondition.muscularEndurance += exercise.muscularEndurance
            bodyCondition.lowerBodyStrength += exercise.lowerMuscleStrength
            bodyCondition.fatigue += exercise.fatigue
        }
    }
}

let bodyCondition = BodyCondition(fatigue: 0)

let activities = makeActivity(exercises:
                                [
                                    .sitUp,
                                    .longRun,
                                    .dynamicBreak,
                                    .squat
                                ],
                              condition: bodyCondition)

let routine = Routine(routineName: "HELL 뤼틴", activities: activities)

try routine.startActivityRoutine(condition: bodyCondition)
