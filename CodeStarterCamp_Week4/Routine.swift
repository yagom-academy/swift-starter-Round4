//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 이지원 on 2023/06/13.
//

import Foundation

enum RoutineError: Error {
    case inputError
    case overwork
}

struct Routine {
    var name: String
    var activities: [Activity]


    func inputCycle() throws -> Int {
        print("루틴을 몇 번 반복할까요?")
        let input = readLine()

        guard let input else {
            throw RoutineError.inputError
        }

        guard let cycle = Int(input) else {
            throw RoutineError.inputError
        }
        return cycle
    }

    func executeRoutine(bodyCondition: BodyCondition) throws {
        for activity in activities {
            activity.action(bodyCondition)
            guard bodyCondition.fatigueLevel < 100 else {
                throw RoutineError.overwork
            }
        }
    }
}
