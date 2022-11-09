//
//  step2.swift
//  CodeStarterCamp_Week4
//
//  Created by Hyejeong Jeong on 2022/11/09.
//

import Foundation


enum Numbers: UInt, CaseIterable {
    case first, second, third, fourth, fifth, sixth, seventh, eighth, ninth, tenth, eleventh, twelfth
    
    var numbers: String {
        switch self {
        case .first: return "첫"
        case .second: return "두"
        case .third: return "세"
        case .fourth: return "네"
        case .fifth: return "다섯"
        case .sixth: return "여섯"
        case .seventh: return "일곱"
        case .eighth: return "여덟"
        case .ninth: return "아홈"
        case .tenth: return "열"
        case .eleventh: return "열한"
        case .twelfth: return "열두"
        }
    }
}


enum RoutineError: Error {
    case fatigueLevelLimit
    case invalidInput
}


struct Routine {
    let routineName: String
    var activities: [Activity] = [sitUp, activeRest, squat, activeRest, longRunning]
    
    func repeatSet() throws -> UInt {
        print("루틴을 몇 번 반복할까요?")
        let setsNumber: String? = readLine()
        print("--------------")
        
        guard setsNumber != nil else {
            throw RoutineError.invalidInput
        }
        
        guard let setsNumber = setsNumber else {
            throw RoutineError.invalidInput
        }
        
        guard let setsNumber = UInt(setsNumber) else {
            throw RoutineError.invalidInput
        }
        
        return setsNumber
    }
    
    func repeatRoutine(by bodyCondition: BodyCondition) throws {
        let setsNumber: UInt = try repeatSet()
        
        for sets in 0...setsNumber {
            print("\(Numbers(rawValue: sets)?.numbers ?? "?")번째 \(routineName)을(를) 시작합니다")
            
            for activitiy in activities {
                guard bodyCondition.fatigueLevel < 100 else {
                    throw RoutineError.fatigueLevelLimit
                }
                
                workOut(activity: activitiy, by: bodyCondition)
                print("--------------")
            }
        }
    }
}

