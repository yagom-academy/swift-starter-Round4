//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var NamJunBodyConditionw = BodyCondition(upperBodyStrengh: 20, lowerBodyStrengh: 10, muscularEndurance: 30, fatigue: 0)
let activities: Array<Activity> = [sitUp, squat, longRun, rest]
let routine = Routine(routineName: "남준루틴", activities: activities)

do {
    try startRoutine()
} catch ActivityError.wrongValue {
    print("잘못된 입력 형식입니다. 다시 입력해주세요.")
    try startRoutine()
} catch ActivityError.notPositiveInteger {
    print("입력값은 양의 정수만 가능합니다. 다시 입력해주세요.")
    try startRoutine()
} catch ActivityError.excessiveFatigue {
    print("피로도가 100이상입니다. 루틴을 중단합니다.")
    NamJunBodyConditionw.checkCondition()
}
