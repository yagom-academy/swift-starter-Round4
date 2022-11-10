//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by ByungHoon Ann on 2022/11/09.
//

import Foundation

class Routine {
    let routineName: String
    let activities: [Activity]
    
    init(routineName: String, activities: [Activity]) {
        self.routineName = routineName
        self.activities = activities
    }
    
    /// readLine() 입력 값 Int로 변환
    /// - Returns: Int
    func inputRoutineCount() throws -> Int {
        guard let inputText = readLine() else {
            throw ActivityError.unknown
        }
        
        guard let totalRoutineCount = Int(inputText) else {
            throw ActivityError.unknown
        }
        
        guard totalRoutineCount > 0 else {
            throw ActivityError.onlyInteger
        }
        
        return totalRoutineCount
    }
    
    /// Int 값 KoreanNumber 열거형으로 변환
    /// - Parameter count: 변환할 Int
    /// - Returns: KoreanNumber 열거형
    func getKorenNumberText(count: Int) -> String {
        return KoreanNumber(rawValue: count)?.numberText ?? "\(count) 번째"
    }
    
    /// Activity 시작 함수
    /// - Parameter condition: BodyCondition
    func startActivity(condition: BodyCondition) throws {
        try activities.forEach {
            if condition.fatigue < 100 {
                $0.startExercise()
                $0.action(condition)
            } else {
                throw ActivityError.overFatigue
            }
        }
    }
    
    /// 루틴 시작 함수
    /// - Parameter condition: BodyCondition
    func startActivityRoutine(condition: BodyCondition) throws {
        do {
            print("루틴을 몇 번 반복할까요?")
            let totalRoutineCount = try inputRoutineCount()
            print("--------------")
            for routine in 1...totalRoutineCount {
                let routineText = getKorenNumberText(count: routine)
                print("\(routineText) \(routineName)을(를) 시작합니다.")
                try? startActivity(condition: condition)
            }
            condition.printCondition()
        } catch ActivityError.overFatigue {
            print(ActivityError.overFatigue.errorMessage)
            condition.printCondition()
        } catch ActivityError.onlyInteger {
            print(ActivityError.onlyInteger.errorMessage)
            try startActivityRoutine(condition: condition)
        } catch ActivityError.unknown {
            print(ActivityError.unknown.errorMessage)
            try startActivityRoutine(condition: condition)
        }
    }
}
