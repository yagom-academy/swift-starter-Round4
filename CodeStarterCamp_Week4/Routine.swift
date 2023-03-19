//
//  r.swift
//  CodeStarterCamp_Week4
//
//  Created by suyeon park on 2023/03/19.
//

import Foundation

let FatigueMaginotLine = 100

struct Routine {
    
    enum RoutineError: Error {
        case exhaustion
        case inputValueError
    }
    
    var name: String
    var activities: [Activity]
    
    func startRoutine(body: BodyCondition) {
        print("루틴을 몇 번 반복할까요?")
        
        do {
            try doRoutine(body: body)
        } catch RoutineError.inputValueError {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        } catch {
            print("알수없는 문제가 발생하였습니다.")
        }
    }
    
    private func doRoutine(body: BodyCondition) throws {
        let times = Int(readLine() ?? "0") ?? 0
        
        guard times > 0 else {
            throw RoutineError.inputValueError
        }
        
        for count in 1...times {
            if body.fatigue < FatigueMaginotLine {
                print("\(count)번째 \(name)을(를) 시작합니다.")
            }
            for actiity in activities {
                if body.fatigue >= FatigueMaginotLine {
                    throw RoutineError.exhaustion
                }  else {
                    actiity.exercise(bodyCondition: body)
                }
            }
        }
    }
}
