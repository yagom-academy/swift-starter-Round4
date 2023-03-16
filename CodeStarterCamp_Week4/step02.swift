//
//  step02.swift
//  CodeStarterCamp_Week4
//
//  Created by karen on 2023/03/16.
//

import Foundation

struct Routine {
    let routineName: String
    let activities: Array<Activity>
}

enum ActivityError: Error {
    case invalidInput
    case nonPositiveInteger
    case tooTired
}

func startRoutine() throws {
    print("루틴을 몇 번 반복할까요?")
    let inputRound: String! = readLine()
    
    guard let roundOfInputs = Int(inputRound) else {
        throw ActivityError.invalidInput
    }
    
    if roundOfInputs < 1 {
        throw ActivityError.nonPositiveInteger
    }
    
    print("--------------")
    
    for count in 1...roundOfInputs {
        print("\(count) 번째 \(routine.routineName)을(를) 시작합니다.")
        
        for sizecount in 0...routine.activities.count - 1 {
            startTraining(routine.activities[sizecount], person)
            
            print("--------------")
            
            if person.degreeOfFatigue > 100 {
                throw ActivityError.tooTired
            }
        }
    }
    person.printCondition()
}
