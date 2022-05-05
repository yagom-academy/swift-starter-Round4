//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 윤일성 on 2022/05/05.
//

import Foundation

struct Routine {
    let name: String
    var exercises: [Exercise]
    
    init(name: String, exercises: Exercise...) {
        self.name = name
        self.exercises = exercises
    }
    
    mutating func appendExercise(_ exercise: Exercise) {
        exercises.append(exercise)
    }
    
    mutating func insertExercise(_ exercise: Exercise, at point: Int) {
        if point < exercises.count {
            exercises.insert(exercise, at: point)
        }
    }
    
    mutating func removeExercise(at point: Int) {
        if point < exercises.count {
            exercises.remove(at: point)
        }
    }
    
    func introduceRoutine() {
        print("\(name)의 순서를 소개합니다.")
        print("----------------------------------")
        for exercise in exercises {
            print(exercise)
        }
    }
    
    func startRoutine(based bodyCondition: BodyCondition) -> BodyCondition {
        var exerciserBodyCondition = bodyCondition
        print("----------------------------------")
        if exercises.isEmpty {
            print("Don't start \(name) Routine because \(name) Routine is empty")
            return exerciserBodyCondition
        } else {
            print("\(name) Routine Start")
        }
        print("----------------------------------")
        for exercise in exercises {
            print("\(exercise.name)")
            exerciserBodyCondition = exercise.action(exerciserBodyCondition)
        }
        exerciserBodyCondition.informBodyCondition()
        return exerciserBodyCondition
    }
}
