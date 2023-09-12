//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterKim = Person.init(name: "김상훈",
                            bodyCondition: BodyCondition(upperBodyStrength: 30,
                                                         lowerBodyStrength: 40,
                                                         muscularEndurance: 20,
                                                         fatigue: 0))
let routineA = Routine(name: "루틴A", activities: [sitUp, squat, stretchRest])
let routineSleep = Routine(name: "수면", activities: [noWorkoutSleep])
let routineB = Routine(name: "루틴B", activities: [longRun, longRun, stretchRest])
routineA.start(with: misterKim)
routineSleep.start(with: misterKim)
routineB.start(with: misterKim)
