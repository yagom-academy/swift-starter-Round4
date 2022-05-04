//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let exercises: [Exercise] = [윗몸일으키기, 스쿼트, 동적휴식, 스쿼트, 벤치프레스, 동적휴식, 오래달리기, 오래달리기]
let hellRoutine: Routine = Routine(called: "HellRoutine", exercises: exercises)
let misterLee: Person = Person(name: "이정민", routine: hellRoutine)

print("--------------")
print("\(misterLee.routine.routineName)을 시작합니다.")
for exercise in misterLee.routine.exercises {
    print(exercise.name)
    exercise.action(&misterLee.condition)
}
print("--------------")
print("현재의 컨디션은 다음과 같습니다.")
print("상체근력: \(misterLee.condition.upperBodyStrength)")
print("하체근력: \(misterLee.condition.lowerBodyStrength)")
print("근지구력: \(misterLee.condition.endurancePower)")
print("피로도: \(misterLee.condition.fatigue)")

