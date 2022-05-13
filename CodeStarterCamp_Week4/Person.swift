//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by 홍승주 on 2022/05/10.
//

import Foundation

class Person {
    let name: String
    var bodyCondition: BodyCondition
    
    init(name: String, bodyCondition: BodyCondition) {
        self.name = name
        self.bodyCondition = bodyCondition
    }
    
    func exercise(for set: Int, routine: Routine) throws {
        print("\(routine.routineName)을 \(set)set 시작합니다.")
        for _ in 1...set {
            for number in 0..<routine.exercises.count {
                routine.exercises[number].action()
                if bodyCondition.fatigue >= 100 {
                    throw FitnessError.overFatigue
                }
                print(routine.exercises[number].name)
            }
        }
    }
}
