//
//  step2.swift
//  CodeStarterCamp_Week4
//
//  Created by Hyejeong Jeong on 2022/11/09.
//

import Foundation


enum Numbers: UInt {
    case first, second, third, fourth, fifth, sixth, seventh, eighth, ninth, tenth
    
    var numbers: String {
        switch self {
        case .first:
            return "첫"
        case .second:
            return "두"
        case .third:
            return "세"
        case .fourth:
            return "네"
        case .fifth:
            return "다섯"
        case .sixth:
            return "여섯"
        case .seventh:
            return "일곱"
        case .eighth:
            return "여덟"
        case .ninth:
            return "아홈"
        case .tenth:
            return "열"
        }
    }
}


enum RoutineError: Error {
    case fatigueLevelLimit
    case invalidInput
}


struct Routine {
    let name: String
    var activities: [Activity] = [longRunning, activeRest, squat]
    
    func repeatSet() throws -> UInt {
        let setsNumber: String? = readLine()
        print("--------------")
        
        guard let inputNumber = setsNumber, inputNumber != "0" else {
            throw RoutineError.invalidInput
        }
        
        guard let positiveSetsNumber = UInt(inputNumber) else {
            throw RoutineError.invalidInput
        }
        
        return positiveSetsNumber - 1
    }
    
    func repeatRoutine(by bodyCondition: BodyCondition) throws {
        let positiveSetsNumber: UInt = try repeatSet()
        
        for sets in 0...positiveSetsNumber {
            guard bodyCondition.fatigueLevel < 100 else {
                throw RoutineError.fatigueLevelLimit
            }
            
            print("\(Numbers(rawValue: sets)?.numbers ?? "\(sets + 1)")번째 \(name)을(를) 시작합니다")
            
            for activitiy in activities {
                workOut(activity: activitiy, by: bodyCondition)
                print("--------------")
            }
        }
    }
}


func executeRoutine(routine: Routine, by bodyCondition: BodyCondition) {
    do {
        try routine.repeatRoutine(by: bodyCondition)
    } catch RoutineError.invalidInput {
        print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        executeRoutine(routine: routine, by: bodyCondition)
    } catch RoutineError.fatigueLevelLimit {
        print("피로도가 100이상입니다. 루틴을 중단합니다.")
        bodyCondition.informBodyCondition()
    } catch {
        print(error)
    }
}
