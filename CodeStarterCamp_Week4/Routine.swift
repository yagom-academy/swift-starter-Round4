//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by mingmac on 2022/05/08.
//

import Foundation

struct Routine {
    let name: String
    var routineArray: Array<Exercise>
    
    func startExerciseRoutine() {
        print("--------------------")
        print("\(self.name)을(를) 시작합니다.")

        for exercise in routineArray {
            exercise.action(myBodyCondition)
            print(exercise.name)
        }
    }
}
