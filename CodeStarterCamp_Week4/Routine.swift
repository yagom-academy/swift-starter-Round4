//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 황지웅 on 2022/05/02.
//

import Foundation

struct Routine {
    var name: String
    var exercises: [Exercise]
    
    func runRoutine() {
        print("--------------")
        print("\(name)을 시작합니다.")
        exercises.forEach { exercise in
            print(exercise.name)
            exercise.action()
        }
        print("--------------")
    }
}
