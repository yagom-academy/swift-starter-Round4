//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var kiwoongsBody = BodyCondition(upperBodyMuscleStrength: 20, lowerBodyMuscleStrength: 10, muscularEndurance: 25, fatigue: 10)
var basicRoutine = Routine(
    routineName: "basicRoutine",
    activityArray: [sitUp,pushup])

try startRoutine(routine: basicRoutine, bodyCondition: kiwoongsBody)
