//
//  routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 수염 on 2022/05/12.
//

import Foundation

struct Routine {
    var name: String
    var exercises: Array<Exercise>
        
    func routineStart() {
        print("--------------\n \(name)을 시작합니다.")
        for exercise in exercises {
            print(exercise.name)
        }
    }
}
