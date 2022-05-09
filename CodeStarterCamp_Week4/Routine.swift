//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by Jiyoung Lee on 2022/05/07.
//

import Foundation

struct Routine {
    var name: String
    var exercises = [Exercise]()
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addExercise(exercise: Exercise) {
        self.exercises.append(exercise)
    }
    
    func run(whose bodyCondition: BodyCondition, do exercises: Array<Exercise>) {
        print("--------------")
        print("\(name)을 시작합니다.")
        exercises.forEach { exercise in
            print(exercise.name)
            exercise.action()
        }
    }
}
