//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let myBody = BodyCondition(upperStrength: 100, lowerStrength: 80, endurance: 80, fatigue: 0)
let exercises = Exercise()
let myRoutine = Routine(name: "hellRoutine", activities: [exercises.sitUp, exercises.plank, exercises.running, exercises.activeRest, exercises.squat, exercises.running, exercises.activeRest])
myRoutine.startRoutine(of: myBody)

