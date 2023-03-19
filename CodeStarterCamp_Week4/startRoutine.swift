//
//  startRoutine.swift
//  CodeStarterCamp_Week4
//
//  Created by JSB on 2023/03/15.
//

import Foundation

struct Routine {
    let routineName: String
    var activities: [Activity]
    
    func startAndThrows(_ inputString: String?, _ bodyCondition: BodyCondition) throws {
        
        let input = try checkInputValue(inputString)
        print("\(self.routineName)을 시작합니다.")
        
        for routineCount in 1...input {
            print("\(routineCount)번째 루틴을 시작합니다.")
            print("-------------------------")
            
            for activity in self.activities {
                activity.action(bodyCondition)
                print("-------------------------")
                guard bodyCondition.피로도 < 100 else {
                    throw RoutineInputError.fatigueOver100
                }
            }
            
            bodyCondition.checkBodyCondition()
            print("-------------------------")
        }
    }
    
    func start(bodyCondition: BodyCondition) {
        
        while true {
            print("루틴을 몇 번 반복할까요?")
            let input = readLine()
            
            do {
                try startAndThrows(input, bodyCondition)
            } catch RoutineInputError.routineInputIsNil {
                print("입력값이 없습니다. 다시 입력해주세요.")
                print("-------------------------")
            } catch RoutineInputError.invalidInputType {
                print("입력값이 올바르지 않습니다. 다시 입력해주세요.")
                print("-------------------------")
            } catch RoutineInputError.routineInputLessThanZero {
                print("입력값이 작습니다. 다시 입력해주세요.")
                print("-------------------------")
            } catch RoutineInputError.fatigueOver100 {
                print("피로도가 100을 초과했습니다. 루틴을 중단합니다.")
                bodyCondition.checkBodyCondition()
                print("-------------------------")
                break
            } catch {
                print("알 수 없는 에러가 발생했습니다. 루틴을 중단합니다.")
                print("-------------------------")
                break
            }
        }
    }
    
    func checkInputValue(_ inputString: String?) throws -> Int{
        guard let input = inputString else {
            throw RoutineInputError.routineInputIsNil
        }
        
        guard let inputToInt = Int(input) else {
            throw RoutineInputError.invalidInputType
        }
        
        guard inputToInt > 0 else {
            throw RoutineInputError.routineInputLessThanZero
        }
        
        return inputToInt
    }
}
