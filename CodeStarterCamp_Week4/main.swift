//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let exercises = [sitUp, letBreak, squat, squat, letBreak, longRunning, longRunning]
let bodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)
let hellRoutine = Routine(name: "hellRoutine", exercises: exercises)

hellRoutine.routineStart()
bodyCondition.yourCondition()


