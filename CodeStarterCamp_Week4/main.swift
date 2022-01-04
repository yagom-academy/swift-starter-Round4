//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var 상체근력: Int = 0
    var 하체근력: Int = 0
    var 근지구력: Int = 0
    var 피로도: Int = 0
}

var bodyCondition: BodyCondition = BodyCondition()
var hellRoutine: Routine = Routine(name: "hellRoutine", exercises: [윗몸일으키기, 윗몸일으키기, 오래달리기, 동적휴식, 철봉매달리기, 스쿼트])

func doRoutineExercise(routine: Routine) {
    print("--------------\n\(routine.name)을 시작합니다.")
    for exercise in routine.exercises {
        print(exercise.name)
        exercise.action()
    }
    print("--------------\n현재의 컨디션은 다음과 같습니다.")
    print("상체근력 : \(bodyCondition.상체근력)")
    print("하체근력: \(bodyCondition.하체근력)")
    print("근지구력: \(bodyCondition.근지구력)")
    print("피로도: \(bodyCondition.피로도)\n")
}

doRoutineExercise(routine: hellRoutine)
