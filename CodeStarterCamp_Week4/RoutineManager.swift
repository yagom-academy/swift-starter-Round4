//
//  RoutineManager.swift
//  CodeStarterCamp_Week4
//
//  Created by 비모 on 2023/03/21.
//

import Foundation

struct RoutineManager {
    let ordinalNumber: [String] = ["첫", "두", "세", "네", "다섯", "여섯", "일곱", "여덟", "아홉", "열"]
    
    func start(_ routine: Routine, of body: BodyCondition) {
        do {
            let round = try inputRound()
            
            try repeatRoutine(course: routine, times: round, of: body)
        } catch RoutineError.invalidInput {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
            
            start(routine, of: body)
        } catch RoutineError.exceedingFatigue {
            print("""
            --------------
            피로도가 100 이상입니다. 루틴을 중단합니다.
            """)
            
            body.printCurrentBodyCondition()
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
    
    func repeatRoutine(course: Routine, times: Int, of body: BodyCondition) throws {
        for time in 1...times {
            print("\(ordinalNumber[time - 1]) 번째 \(course.name)을(를) 시작합니다.")
            
            for activity in activities {
                try exercise(activity, of: body)
            }
        }
        
        body.printCurrentBodyCondition()
    }
    
    func exercise(_ activity: Activity, of bodyCondition: BodyCondition) throws {
        print("<<\(activity.name)을(를) 시작합니다>>")
        
        activity.action(bodyCondition)
        
        guard bodyCondition.fatigue < 100 else {
            throw RoutineError.exceedingFatigue
        }
        
        print("--------------")
    }
}
