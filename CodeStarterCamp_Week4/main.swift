//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var bmoCondition = BodyCondition(
    upperBodyStrength: 20,
    lowerBodyStrength: 10,
    muscularEndurance: 30,
    fatigue: 15
)
let activities: [Activity] = [sitUp, dynamicRest, hangBoard, dynamicRest]
let routine = Routine(name: "비모루틴", activities: activities)
let manager = RoutineManager()

print("루틴을 몇 번 반복할까요?")
manager.start(routine, of: bmoCondition)
