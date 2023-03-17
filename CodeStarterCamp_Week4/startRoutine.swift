//
//  routineCount.swift
//  CodeStarterCamp_Week4
//
//  Created by JSB on 2023/03/15.
//

import Foundation

enum RoutineInputError: Error {
    case routineInputLessThanZero
    case fatigueOver100
    case invalidInputType
    case routineInputIsNil
}

struct Routine {
    let routineName: String
    let activities: [Activity] = [윗몸일으키기, 스쿼트, 오래달리기, 동적휴식]
}

func startRoutineAndThrows(_ inputString: String?, _ bodyCondition: BodyCondition) throws {
    
    guard let input = inputString else {
        throw RoutineInputError.routineInputIsNil
    }
    
    guard let inputToInt = Int(input) else {
        throw RoutineInputError.invalidInputType
    }
    
    guard inputToInt > 0 else {
        throw RoutineInputError.routineInputLessThanZero
    }
    
    guard bodyCondition.피로도 < 100 else {
        throw RoutineInputError.fatigueOver100
    }
    
    let routine: Routine = Routine(routineName: "hellRoutine")
    
    for routineCount in 1...inputToInt {
        print("\(routineCount)번째 루틴을 시작합니다.")
        print("-------------------------")
        
        for routineArray in routine.activities {
            routineArray.action(bodyCondition)
            print("-------------------------")
        }
        
        guard bodyCondition.피로도 < 100 else {
            throw RoutineInputError.fatigueOver100
        }
        
        bodyCondition.checkBodyCondition()
        print("-------------------------")
    }
}

func startRoutine(name: BodyCondition) {
    
    while(true) {
        print("루틴을 몇 번 반복할까요?")
        let input = readLine()
        
        do {
            try startRoutineAndThrows(input, name)
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
            name.checkBodyCondition()
            print("-------------------------")
            break
        } catch {
            print("알 수 없는 에러가 발생했습니다. 루틴을 중단합니다.")
            print("-------------------------")
            break
        }
    }
}
