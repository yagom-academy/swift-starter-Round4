//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var myBodyCondition = BodyCondition(upperBodyStrength: 60, lowerBodyStrength: 60, muscularEndurance: 60, fatigue: 30)
let upperBodyRoutine = Routine(routineName: "상체루틴", exercises: [sitUp, pullUp, pullUp, activeRest, pullUp, pullUp, activeRest])
let lowerBodyRoutine = Routine(routineName: "하체루틴", exercises: [squat, squat, activeRest, lunge, lunge, activeRest])

upperBodyRoutine.runRoutine(with: &myBodyCondition)
myBodyCondition.showCondition()


