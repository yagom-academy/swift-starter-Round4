//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 조민호 on 2021/12/28.
//

import Foundation

final class Routine {
    let name: String
    let exercises: [Exercise]
    let bodyCondition: BodyCondition
    
    init(name: String, bodyCondition: BodyCondition, exercises: [Exercise]) {
        self.name = name
        self.bodyCondition = bodyCondition
        self.exercises = exercises
    }
    
    func start(for set: Int) throws {
        print("--------------")
        print("\(name)을 \(set)set시작합니다.")
        try self.exercises.forEach { exercise in
            print(exercise.name)
            exercise.action()
            try run()
        }
    }
    
    private func run() throws {
        guard bodyCondition.fatigue < 100 else {
            throw FitnessError.fatigueFull
        }
    }
    
    
}
