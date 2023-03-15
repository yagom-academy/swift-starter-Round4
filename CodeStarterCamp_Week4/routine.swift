//
//  routine.swift
//  CodeStarterCamp_Week4
//
//  Created by Min Hyun on 2023/03/15.
//

import Foundation

class Routine {
    var name: String
    var activities: Array<Activity>
    let numberCount: Array<String> = ["첫", "두", "세", "네", "다섯", "여섯", "일곱", "여덟", "아홉", "열"]
    
    init(name: String, activities: Array<Activity>) {
        self.name = name
        self.activities = activities
    }
    
    func inputRepeatTime() throws -> Int {
        print("루틴을 몇 번 반복할까요?")
        guard let repeatTime = Int(readLine() ?? "error") else {
            throw YagomFitnessError.inputTypeIncorrect
        }
        guard 0 < repeatTime && repeatTime <= 10 else {
            throw YagomFitnessError.inputOutOfRange
        }
        return repeatTime
    }
    
    func repeatRoutine(of body: BodyCondition, for repeatTime: Int) throws {
        print("--------------")
        for round in (0..<repeatTime) {
            print("\(numberCount[round]) 번째 \(self.name)을(를) 시작합니다.")
            for activity in activities {
                body.exercise(activity)
                if body.fatigue > 100 {
                    throw YagomFitnessError.fatigueOverLimit
                }
            }
        }
    }
    
    func startRoutine(of body: BodyCondition) {
        var repeatTime: Int = 0
        while repeatTime == 0 {
            do {
                let input: Int = try inputRepeatTime()
                repeatTime = input
            } catch YagomFitnessError.inputTypeIncorrect {
                print("잘못된 입력 형식입니다. 다시 입력해주세요.")
            } catch {
                print("루틴 횟수는 1~10 사이로 입력 가능합니다.")
            }
        }
        do {
            try repeatRoutine(of: body, for: repeatTime)
        } catch {
                print("피로도가 100 이상입니다. 루틴을 중단합니다.")
        }
        body.checkBodyConditionStatus()
    }
}
