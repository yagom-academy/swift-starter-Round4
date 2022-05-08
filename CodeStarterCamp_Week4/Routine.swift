//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 정선아 on 2022/05/08.
//

import Foundation

struct Routine {
    let routineName: String
    var exercises: Array<Exercise>
    
    func startRoutine() {
        print("🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥")
        print("\(routineName)을 시작합니다.")
        for exercise in exercises {
            print(exercise.name)
            exercise.action()
        }
        print("🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥\n")

    }
}
