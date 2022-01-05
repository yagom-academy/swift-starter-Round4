//
//  routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 박세웅 on 2022/01/05.
//

import Foundation

struct Routine {
    let name: String
    var exercises: [Exercise]
    
    func introduce() {
        print("------------")
        print("\(name)을 시작합니다.")
        exercises.forEach { exercise in
            print(exercise.name)
        }
        print("------------")
    }
    
    func run() {
        exercises.forEach { exercise in
            exercise.action()
        }
    }
}
