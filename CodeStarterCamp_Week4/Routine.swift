//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by eve on 2023/03/14.
//

import Foundation

class Routine {
    let name: String
    let activities: [Activity]
    
    init(name: String, activities: [Activity]) {
        self.name = name
        self.activities = activities
    }
    
    func training(_ condition: BodyCondition, isRetry: Bool = false) {
        if !isRetry { print("루틴을 몇 번 반복할까요?") }
        do {
            try repeatExcercise(condition)
        } catch RoutineError.wrongType {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
            training(condition, isRetry: true)
        } catch RoutineError.wrongTimes {
            print("1에서 10 사이의 정수를 입력해주세요.")
            training(condition, isRetry: true)
        } catch RoutineError.overFatigue {
            print("피로도가 100 이상입니다. 루틴을 중단합니다.")
            condition.checkBody()
        } catch {
            print("오류가 발생하였습니다.")
        }
    }
    
    private func repeatExcercise(_ condition: BodyCondition) throws {
        guard let input = readLine(), let times = Int(input) else {
            throw RoutineError.wrongType
        }
        guard 0 < times && times <= 10 else {
            throw RoutineError.wrongTimes
        }
        print("--------------")
        
        for time in 0..<times {
            print("\(koreanCount[time]) 번째 \(name)을(를) 시작합니다.")
            Activity.doExercise(condition, activities: activities)
            if condition.fatigue >= 100 {
                throw RoutineError.overFatigue
            }
        }
        condition.checkBody()
    }
    
    private let koreanCount = ["첫", "두", "세", "네", "다섯", "여섯", "일곱", "여덟", "아홉", "열"]
}

enum RoutineError: Error {
    case wrongType
    case wrongTimes
    case overFatigue
}
