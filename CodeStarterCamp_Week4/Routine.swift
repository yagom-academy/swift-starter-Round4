//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 장경빈 on 2022/05/05.
//

import Foundation

struct Routine {
    let name: String
    var exercises: Array<Exercise>
    
    func start() {
        print("\(name)을 시작합니다.")
        for exercise in exercises {
            exercise.action()
            print(exercise.name)
        }
    }
}
