//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 김예림 on 2023/06/13.
//

import Foundation

struct Routine {
    fileprivate var name: String
    private var activities: [Activity]
    
    init(name: String, activities: [Activity]) {
        self.name = name
        self.activities = activities
    }
    
    func startRoutine(bodyCondition: inout BodyCondition) {
        print("루틴을 몇 번 반복할까요?")
        
        while true {
            do {
                guard let repeatCount = Int(readLine()!), repeatCount > 0 else {
                    throw RoutineError.invalidInput
                }
                try performRoutines(on: &bodyCondition, repeatCount: repeatCount)
                printBodyCondition(bodyCondition: bodyCondition)
                break
            } catch {
                handleRoutineError(error)
            }
        }
    }
    
    private func performRoutines(on bodyCondition: inout BodyCondition, repeatCount: Int) throws {
        for count in 1...repeatCount {
            print("--------------")
            print("\(count) 번째 \(self.name)을(를) 시작합니다.")
            for activity in activities {
                guard bodyCondition.fatigue < 100 else {
                    throw RoutineError.fatigueExceeded
                }
                activity.perform(on: &bodyCondition)
                print("--------------")
            }
        }
    }
    
    private func handleRoutineError(_ error: Error) {
        if let routineError = error as? RoutineError {
            switch routineError {
            case .fatigueExceeded:
                print(routineError.errorDescription ?? "")
            case .invalidInput:
                print(routineError.errorDescription ?? "")
            case .otherError:
                print(routineError.errorDescription ?? "")
            }
        } else {
            print(RoutineError.otherError.errorDescription ?? "")
        }
    }
}
