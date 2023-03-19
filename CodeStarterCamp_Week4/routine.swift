//
//  routine.swift
//  CodeStarterCamp_Week4
//
//  Created by karen on 2023/03/19.
//

import Foundation

struct Routine {
    let routineName: String
    let activities: Array<Activity>
    
    func startRoutine() throws {
        print("루틴을 몇 번 반복할까요?")
        guard let inputRound = readLine(), let roundOfInputs = Int(inputRound) else {
            throw ActivityError.invalidInput
        }
        
        print("--------------")
        if roundOfInputs < 1 {
            throw ActivityError.nonPositiveInteger
        }
        
        for count in 1...roundOfInputs {
            print("\(count) 번째 \(routine.routineName)을(를) 시작합니다.")
            for sizecount in 0...routine.activities.count - 1 {
                routine.activities[sizecount].action(person)
                print("--------------")
                if person.degreeOfFatigue > 100 {
                    throw ActivityError.tooTired
                }
            }
        }
    }
}
