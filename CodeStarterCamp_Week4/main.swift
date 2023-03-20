//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let maryBodyCondition = BodyCondition(upperBody: 0, lowerBody: 0, endurance: 0, fatigue: 0)
let mary = Person(name: "mary", bodyCondition: maryBodyCondition)
let hellRoutine = Routine(name: "hellRoutine", activities: [sitUp, activeRest, squat])

mary.doWorkout(routine: hellRoutine)
