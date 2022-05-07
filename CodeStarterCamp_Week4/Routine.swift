//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 홍승주 on 2022/05/05.
//

import Foundation

struct Routine {
    let routineName: String
    var exercises: Array<Exercise>
    
    func startRoutine() {
        print("--------------")
        print("hellRoutine을 시작합니다.")
        for exercise in exercises {
            print(exercise.name)
            exercise.action()
        }
        print("--------------")
        
    }
}

