//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let exercises: [Exercise] = [sitUp, squat, activeRest, squat, benchPress, activeRest, miniMarathon, miniMarathon]
let hellRoutine: Routine = Routine(called: "HellRoutine", exercises: exercises)
let misterLee: Person = Person(name: "이정민", routine: hellRoutine)

misterLee.workOut()
misterLee.showCondition()
