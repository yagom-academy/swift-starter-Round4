//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by 이정민 on 2022/05/04.
//

import Foundation

class Person {
    let name: String
    var bodyCondition: BodyCondition
    
    init(name: String) {
        self.name = name
        self.bodyCondition = BodyCondition()
    }
    
    func exercise(for set: Int, routine: Routine) {
        print("""
        --------------
        \(routine.routineName)을 \(set)set 시작합니다.
        """)
        
        for _ in 1...set {
            for exercise in routine.exercises {
                print(exercise.name)
                exercise.action(&bodyCondition)
            }
            print("set End")
        }
    }

    func showCondition() {
        print("""
        상체근력: \(self.bodyCondition.upperBodyStrength)
        하체근력: \(self.bodyCondition.lowerBodyStrength)
        근지구력: \(self.bodyCondition.endurancePower)
        피로도: \(self.bodyCondition.fatigue)
        """)
    }
}
