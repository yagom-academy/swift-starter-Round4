//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 김인호 on 2022/05/04.
//

import Foundation

struct Routine {
    let routineName: String
    let exercises: [Exercise]
    
    func runRoutine(with bodyCondtion: inout BodyCondition, until fatigueLimit: Int) throws {
        print("--------------")
        print("\(routineName)을 시작합니다.")
        for exercise in exercises {
            print(exercise.name)
            exercise.action(&bodyCondtion)
            if bodyCondtion.fatigue >= fatigueLimit {
                throw FitnessError.exhaustion
            }
        }
    }
}
