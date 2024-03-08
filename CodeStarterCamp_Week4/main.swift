//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let haruBodyCondition: BodyCondition = BodyCondition(upperBodyStrength: 10, lowerBodyStrength: 10, muscularEndurance: 10, fatigue: 10)
let haruRoutine: Routine = Routine(routineName: "haruRoutine", activities: [activeRest, squat, sitUp, activeRest])

do {
    try haruRoutine.setRoutine(by: haruBodyCondition)
} catch RoutineError.invalidInput {
    print(RoutineError.invalidInput.localizedDescription)
} catch RoutineError.maxFatigueExceeded {
    print(RoutineError.maxFatigueExceeded.localizedDescription, "현재 피로도: \(haruBodyCondition.fatigue)")
}
