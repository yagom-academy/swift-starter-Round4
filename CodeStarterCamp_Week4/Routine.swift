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
    
    func start() {
        print("--------------")
        print("\(name)을 시작합니다.")
        self.exercises.forEach { exercise in
            print(exercise.name)
            exercise.action()
        }
        bodyCondition.checkCurrentCondition()
    }
}
