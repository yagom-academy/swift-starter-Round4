//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var person = BodyCondition(upperBodyMuscleStrength: 0, lowerBodyMuscleStrength: 0, muscleEndurance: 0, fatigue: 0)
let exercise: Array<Exercise> = [sitUp, activeRest, yoga]
var aa = Routine(routineName: "hellroutine", exercises: exercise)
aa.startRoutine()
person.checkBodyCondition()
