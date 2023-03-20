//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 김형철 on 2023/03/20.
//

import Foundation

struct Routine {
    var routineName: String
    var activities: [Activity]
    
    
    func writeNumberOfRoutine() throws -> Int {
        
        guard let timesOfRoutine = readLine(), let routineTimes = Int(timesOfRoutine) else {
            throw RoutineInputError.unexpectedInputValue
        }
        
        return routineTimes
    }
    
    
    func doRoutineActivities(by activities: [Activity], with bodyCondition: BodyCondition) {
        print("루틴을 몇 번 반복할까요?")
        
        do {
            let times = try writeNumberOfRoutine()
            print("--------------")
            
            for time in 1 ... times {
                print("\(time) 번째 \(self.routineName)을(를) 시작합니다.")
                for activity in activities {
                    activity.doExercise(with: bodyCondition)
                    do {
                        try bodyCondition.checkFatigability()
                    } catch RoutineInputError.overflowFatigue {
                        print("피로도가 100 이상입니다. 루틴을 중단합니다")
                        break
                    }
                }
            }
            bodyCondition.checkCondition()
        } catch RoutineInputError.unexpectedInputValue {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        } catch RoutineInputError.otherException {
            print("예기치 않은 오류")
        } catch {
            print(error)
        }

    }
}
