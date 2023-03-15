//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let myBody = BodyCondition(upperStrength: 100, lowerStrength: 80, endurance: 80, fatigue: 0)
let myRoutine = Routine(name: "hellRoutine", activities: [sitUp, plank, running, activeRest, squat, running, activeRest])
myRoutine.startRoutine(of: myBody)

