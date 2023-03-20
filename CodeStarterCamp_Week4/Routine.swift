//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 비모 on 2023/03/17.
//

import Foundation

struct Routine {
    let name: String
    let activities: [Activity]
    
    func play(bodyCondition: BodyCondition) {
        do {
            let round = try inputRound()
            
            try repeatRound(count: round, bodyCondition: bodyCondition)
        } catch RoutineError.invalidInput {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
            play(bodyCondition: bodyCondition)
        } catch RoutineError.exceedingFatigue {
            print("""
            --------------
            피로도가 100 이상입니다. 루틴을 중단합니다.
            """)
            
            bodyCondition.printCurrentBodyCondition()
        } catch {
            print("그 외 에러 발생: \(error)")
        }
    }
    
    func inputRound() throws -> Int {
        guard let input = readLine(), let inputAsInt = Int(input), inputAsInt > 0 else {
            throw RoutineError.invalidInput
        }
        
        print("--------------")
        
        return inputAsInt
    }
    
    func repeatRound(count: Int, bodyCondition: BodyCondition) throws {
        for number in 1...count {
            print("\(number) 번째 \(name)을(를) 시작합니다.")
            
            for activity in activities {
                try exercise(activity, bodyCondition: bodyCondition)
            }
        }
        
        bodyCondition.printCurrentBodyCondition()
    }
    
    func exercise(_ activity: Activity, bodyCondition: BodyCondition) throws {
        print("<<\(activity.name)을(를) 시작합니다>>")
        
        activity.action(bodyCondition)
        
        guard bodyCondition.fatigue < 100 else {
            throw RoutineError.exceedingFatigue
        }
        
        print("--------------")
    }
}
