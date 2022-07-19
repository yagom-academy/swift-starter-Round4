//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by junho lee on 2022/07/19.
//

import Foundation

struct Routine {
    let name: String
    let activities: Array<Activity>
    
    func doRoutine(bodyCondition: BodyCondition) {
        do {
            let routineTimes: Int = try getRoutineTimes()
            try doRoutineTimes(in: activities,
                               to: bodyCondition,
                               times: routineTimes)
        } catch {
            print("기타 예외 사항")
        }
    }
    
    func getRoutineTimes() throws -> Int {
        print("루틴을 몇 번 반복할까요?")
        while true {
            do {
                guard let routineTimes = Int(readLine() ?? "") else {
                    throw RoutineError.unexpectedInputValue
                }
                guard routineTimes > 0 else {
                    throw RoutineError.unexpectedInputValue
                }
                return routineTimes
            } catch RoutineError.unexpectedInputValue {
                print("잘못된 입력 형식입니다. 다시 입력해주세요.")
                continue
            }
        }
    }
    
    func doRoutineTimes(in activities: Array<Activity>,
                        to bodyCondition: BodyCondition,
                        times routineTimes: Int) throws {
        do {
            for routineTime in 1...routineTimes {
                print("\(routineTime) 번째 \(name)을(를) 시작합니다.")
                for activity in activities {
                    activity.action(bodyCondition)
                    guard !bodyCondition.fatigueExceed100() else {
                        throw RoutineError.fatigueExceeds100
                    }
                }
            }
            bodyCondition.printCurrentBodyCondition()
        } catch RoutineError.fatigueExceeds100 {
            print("피로도가 100 이상입니다. 루틴을 중단합니다.")
            bodyCondition.printCurrentBodyCondition()
        }
    }
}
