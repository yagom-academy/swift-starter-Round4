//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let maryCondition = BodyCondition(upperBody: 10, lowerBody: 20, endurance: 30, fatigue: 10)
let hellRoutine = Routine(name: "hellRoutine", activities: [sitUp, activeRest, squat])

startRoutine(routine: hellRoutine, conditions: maryCondition)

