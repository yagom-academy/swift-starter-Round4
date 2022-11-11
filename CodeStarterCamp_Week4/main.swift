//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: STEP2 야곰 피트니스, 지옥의 헬스 트레이닝
let rowan = BodyCondition()

var hellRoutine = Routine(name: "hellRoutine", member: rowan, activities: [sitUp, dynamicBreak, climbing, dynamicBreak])

print("루틴을 몇 번 반복할까요?")
startRoutine(hellRoutine)
