//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by suyeon park on 2023/03/17.
//

import Foundation

struct Routine {
    enum RoutineError: Error {
        case exhaustion
        case inputValueError
        case Else
    }
    
    var name: String
    var activities: [Activity]
    
    func startRoutine(body: BodyCondition) {
        print("루틴을 몇 번 반복할까요?")
        
        do {
            try? doRoutine(body: body)
            print("")
        } catch RoutineError.exhaustion {
            
        } catch RoutineError.inputValueError {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        }
    }
    
    func doRoutine(body: BodyCondition) throws {
        let times = Int(readLine() ?? "0") ?? 0

        guard times > 0 else {
            throw RoutineError.inputValueError
        }
        
        for _ in 1...times {
            print("첫 번째 \(name)을(를) 시작합니다.")
            for actiity in activities {
                if body.fatigue >= 100 {
                    throw RoutineError.exhaustion
                } else {
                    actiity.action(body)
                }
            }
        }
    }
}
