//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var upperStrength = 상체근력(10, 20)
var lowerStrength = 하체근력(20, 30)
var muscularEndurance = 근지구력(20, 30)
var fatigue = 피로도(10, 20)

func printCondition() {
    print("""
    현재의 컨디션은 다음과 같습니다.
    상체근력: \(upperStrength.value)
    하체근력: \(lowerStrength.value)
    근지구력: \(muscularEndurance.value)
    피로도: \(fatigue.value)
    --------------
    """)
}

func doRoutineCourse(_ routine: Routine) throws {
    do {
        try routine.doRoutine()
    } catch RoutineError.fatigueOverflow {
        print("피로도가 100 이상입니다. 루틴을 중단합니다.")
        printCondition()
    } catch RoutineError.wrongInput {
        print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        try doRoutineCourse(routine)
    }
}

var routine = Routine("hellRoutine", [윗몸일으키기, 스쿼트, 오래달리기, 동적휴식])

print("루틴을 몇 번 반복할까요?")
try doRoutineCourse(routine)
