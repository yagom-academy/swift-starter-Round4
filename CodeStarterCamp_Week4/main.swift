//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let person = BodyCondition(upperBodyStrength: 0, lowerBodyMuscleStrength: 0, muscularEndurance: 0, degreeOfFatigue: 0)
let activities: Array<Activity> = [sitUp, squats, longRun, dynamicResting]
let routine = Routine(routineName: "야곰 피트니스 지옥의 헬스 트레이닝 루틴", activities: activities)

do {
    try startRoutine()
} catch ActivityError.invalidInput {
    print("잘못된 입력 형식입니다. 다시 입력해주세요.")
    try startRoutine()
} catch ActivityError.nonPositiveInteger {
    print("입력값은 양의 정수만 가능합니다. 다시 입력해주세요.")
    try startRoutine()
} catch ActivityError.tooTired {
    print("피로도가 100이상입니다. 루틴을 중단합니다.")
    person.printCondition()
}


