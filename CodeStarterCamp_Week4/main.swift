//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


// MARK: - STEP1 호출
var myCondition: BodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigueLevel: 0)
//workOut(activity: sitUp, by: myCondition)
//workOut(activity: squat, by: myCondition)
//workOut(activity: longRunning, by: myCondition)
//workOut(activity: activeRest, by: myCondition)
//
//myCondition.informBodyCondition()


// MARK: - STEP2 호출
var myRoutine: Routine = Routine(name: "hyemorysRoutine")

print("루틴을 몇 번 반복할까요?")
executeRoutine(routine: myRoutine, by: myCondition)

