//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by Kyeongmo Yang on 12/8/23.
//

import Foundation

enum RoutineError: Error {
    case invalidInput
    case overFatigue
}

struct Routine {
    let name: String
    let activities: [Activity]
    
    func getInput(with bodyCondition: BodyCondition) throws {
        print("루틴을 몇 번 반복할까요?")
        let input = readLine()
        guard let input,
              let repeatCount = Int(input) else {
            throw RoutineError.invalidInput
        }
        do {
            try self.runActivities(count: repeatCount, with: bodyCondition)
        } catch RoutineError.overFatigue {
            print("피로도가 100 이상입니다. 루틴을 중단합니다.")
            bodyCondition.checkCurrent()
        }
    }
    
    func runActivities(count: Int, with bodyCondtion: BodyCondition) throws {
        for i in 1...count {
            print("\(i) 번째 \(self.name)을(를) 시작합니다.")
            for activity in activities {
                guard bodyCondtion.fatigue < 100 else {
                    throw RoutineError.overFatigue
                }
                
                activity.action(bodyCondtion)
            }
        }
    }
}
