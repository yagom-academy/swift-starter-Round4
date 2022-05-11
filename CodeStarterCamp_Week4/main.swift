//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var person = BodyCondition(startingPoint: 0)

let hellExercise: [Exercise] = [sitUp, activeRest, deadLift, activeRest, plank, activeRest, barbellRow, activeRest, cablePullover, activeRest, squat, activeRest, lunge, activeRest, legExtension, activeRest, longRun]

let normalExercise: [Exercise] = [sitUp, activeRest, squat, activeRest, activeRest, barbellRow, activeRest, cablePullover, activeRest, legExtension, activeRest, longRun]

// [Routine]에 들어갈 루틴 선언
let hellRoutine = Routine(routineName: "지옥의 헬스루틴", exercises: hellExercise)
let normalRoutine = Routine(routineName: "보통의 헬스루탄", exercises: normalExercise)


