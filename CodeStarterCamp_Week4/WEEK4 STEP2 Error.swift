//
//  WEEK4 STEP2 Error.swift
//  CodeStarterCamp_Week4
//
//  Created by oh namjun on 2022/07/21.
//

import Foundation

enum ActivityError: Error {
    case nilValue
    case notPositiveInteger
    case excessiveFatigue
}

func startRoutine() throws {
    print("루틴을 몇 번 반복할까요?")
    let input = readLine()!
    
    guard let checkInput = Int(input) else {
        throw ActivityError.nilValue
    }
    
    if checkInput < 1 {
        throw ActivityError.notPositiveInteger
    }
    
    print("--------------")
    
    for count in 1...checkInput {
        print("\(count) 번째 \(routine.routineName)을(를) 시작합니다.")
    
        for sizecount in 0...routine.activities.count - 1 {
            moveExercise(routine.activities[sizecount], NamJunBodyConditionw)
    
            print("--------------")
            
            if NamJunBodyConditionw.fatigue > 100 {
                throw ActivityError.excessiveFatigue
            }
        }
    }
    moveExercise(checkCondition, NamJunBodyConditionw)
}
