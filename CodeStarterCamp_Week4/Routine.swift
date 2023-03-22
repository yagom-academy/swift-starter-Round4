//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 김형철 on 2023/03/20.
//

import Foundation

struct Routine {
    let routineName: String
    let activities: [Activity]
    
    
    func writeNumberOfRoutine() throws -> Int {
        
        guard let timesOfRoutine = readLine(), let routineTimes = Int(timesOfRoutine),routineTimes > 0, routineTimes != 0 else {
            throw RoutineInputError.unexpectedInputValue
        }
        
        return routineTimes
    }
    
    
    private func doRoutine(with bodyCondition: BodyCondition) throws {
        for activity in activities {
            activity.doExercise(with: bodyCondition)
            try bodyCondition.checkFatigability()
        }
    }
    
    
    func doRoutineActivities(by activities: [Activity], with bodyCondition: BodyCondition) {
        print("루틴을 몇 번 반복할까요?")
        
        do {
            let times = try writeNumberOfRoutine()
            print("--------------")
            
            for time in 1 ... times {
                print("\(time) 번째 \(self.routineName)을(를) 시작합니다.")
                try doRoutine(with: bodyCondition)
            }
            bodyCondition.checkCondition()
        } catch RoutineInputError.unexpectedInputValue {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
            doRoutineActivities(by: activities, with: bodyCondition)
        } catch RoutineInputError.otherException {
            print("예기치 않은 오류")
        } catch RoutineInputError.overflowFatigue {
            print("피로도가 100이상입니다. 루틴을 중단합니다.")
            bodyCondition.checkCondition()
        } catch {
            print(error)
        }
    }
}
