//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func printCondition() {
    print("""
    현재의 컨디션은 다음과 같습니다.
    상체근력: \(상체근력.value)
    하체근력: \(하체근력.value)
    근지구력: \(근지구력.value)
    피로도: \(피로도.value)
    --------------
    """)
}

func doRoutineCourse(_ routine: Routine) throws {
    print("루틴을 몇 번 반복할까요?")
    while true {
        do {
            try routine.doRoutine()
            return
        } catch RoutineError.fatigueOverflow {
            print("피로도가 100 이상입니다. 루틴을 중단합니다.")
            printCondition()
            return
        } catch RoutineError.wrongInput {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        }
    }
}

var routine = Routine("hellRoutine", [윗몸일으키기, 스쿼트, 오래달리기, 동적휴식])

try doRoutineCourse(routine)
