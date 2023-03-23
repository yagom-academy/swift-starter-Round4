//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
import Foundation

let person: BodyCondition = BodyCondition(upperBodyStrengthValue: 0, lowerBodyStrengthValue: 0, muscularEnduranceValue: 0, fatigueLevelValue: 0)
let hellRoutine: Routine = Routine(name: "hellRoutine", activities: [sitUp, dynamicResting, squats])

do {
    try hellRoutine.start(bodyCondition: person)
} catch RoutineError.invalidInput {
    print("잘못된 입력입니다. 다시 입력하세요.")
} catch RoutineError.insufficientNumberInput {
    print("1 이상의 숫자를 입력하세요.")
} catch RoutineError.exceedingFatigueLevel {
    print("피로도가 100 이상입니다. 루틴을 중단합니다.")
    person.showBodyCondition()
}
