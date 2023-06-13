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


    private func inputCycle() throws -> Int {
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

    private func executeRoutine(bodyCondition: BodyCondition) throws {
        for activity in activities {
            activity.action(bodyCondition)
            guard bodyCondition.fatigueLevel < 100 else {
                throw RoutineError.overwork
            }
        }
    }
    
    func startRoutine() {
        do {
            let cycle = try inputCycle()
            for _ in 0..<cycle {
                try executeRoutine(bodyCondition: myBodyCondition)
            }
        } catch RoutineError.inputError {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
            startRoutine()
        } catch RoutineError.overwork {
            print("피로도가 100 이상입니다. 루틴을 중단합니다.")
        } catch {
            print("알 수 없는 에러가 발생했습니다.")
        }
    }
}
