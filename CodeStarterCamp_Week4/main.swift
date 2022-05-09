//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var person = BodyCondition(startingPoint: 0)

let exercise: [Exercise] = [sitUp, sitUp, sitUp, activeRest, deadLift, deadLift, deadLift, activeRest, plank, plank, plank, activeRest, barbellRow, barbellRow, barbellRow, activeRest, cablePullover, cablePullover, cablePullover, activeRest, longRun]

let hellRoutine = Routine(routineName: "지옥의 헬스루틴", exercises: exercise)

hellRoutine.startRoutine() // 지옥의 헬스루틴 시작
person.checkYourCondition() // 인바디 측정 

