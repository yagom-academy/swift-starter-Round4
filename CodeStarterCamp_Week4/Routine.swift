//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 이지은 on 3/8/24.
//

import Foundation

enum RoutineError: Error, LocalizedError {
    case invalidInput
    case maxFatigueExceeded
    
    var errorDescription: String? {
        switch self {
        case .invalidInput:
            return "잘못된 입력 형식입니다. 다시 입력해주세요."
        case .maxFatigueExceeded:
            return "피로도가 100 이상입니다. 루틴을 중단합니다."
        }
    }
}

struct Routine {
    var routineName: String
    var activities: [Activity]
    
    func setRoutine(by name: BodyCondition) throws {
        print("루틴을 몇 번 반복할까요?")
        guard let reps = Int(readLine() ?? ""), reps > 0 else {
            throw RoutineError.invalidInput
        }
        try startRoutine(for: reps, by: name)
    }
    
    func startRoutine(for reps: Int, by name: BodyCondition) throws {
        for i in (1...reps) {
            print("--------------")
            print("\(i)번째 \(routineName)을(를) 시작합니다.")
            for activity in activities {
                activity.startWorkout(name)
                print("--------------")
                if name.fatigue > 100 {
                    throw RoutineError.maxFatigueExceeded
                }
            }
            name.showCondition()
        }
    }
}
