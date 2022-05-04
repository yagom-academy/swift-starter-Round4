//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by 이정민 on 2022/05/04.
//

import Foundation

class Person {
    let name: String
    let routine: Routine
    var condition: BodyCondition
    
    init(name: String, routine: Routine) {
        self.name = name
        self.routine = routine
        self.condition = BodyCondition()
    }
    
    func workOut() {
        print("""
        --------------
        \(self.routine.routineName)을 시작합니다.
        """)
        
        for exercise in routine.exercises {
            print(exercise.name)
            exercise.action(&condition)
        }
    }

    func showCondition() {
        print("""
        --------------
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(self.condition.upperBodyStrength)
        하체근력: \(self.condition.lowerBodyStrength)
        근지구력: \(self.condition.endurancePower)
        피로도: \(self.condition.fatigue)
        """)
    }
}
