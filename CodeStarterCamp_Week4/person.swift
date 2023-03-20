//
//  person.swift
//  CodeStarterCamp_Week4
//
//  Created by MARY on 2023/03/18.
//

import Foundation

enum Errors: Error {
    case exhaust
    case invalidInput
}

struct Person {
    let name: String
    var bodyCondition: BodyCondition
    
    func doWorkout(routine: Routine) {
        let numberInKorean: [String] = ["첫", "두", "세", "네", "다섯", "여섯", "일곱", "여덟", "아홉", "열"]
        
        do {
            let times = try getNumberOfRepetition()
            print("--------------")
            for time in 1...times {
                print("\(numberInKorean[time-1]) 번째 \(routine.name)을(를) 시작합니다.")
                try doSingleRoutine(activities: routine.activities)
            }
        } catch Errors.invalidInput {
            print("최대 입력 시도 횟수 초과")
        } catch Errors.exhaust {
            print("피로도가 100 이상입니다. 루틴을 중단합니다.")
        } catch {
            print(error)
        }
        
        bodyCondition.check()
    }
    
    private func getNumberOfRepetition() throws -> Int {
        for trial in 1...5 {
            trial == 1 ? print("루틴을 몇 번 반복할까요?") : print("다시 입력해주세요.")

            guard let times = readLine(), let times = Int(times) else {
                print("잘못된 입력 형식입니다.", terminator: " ")
                continue
            }
            
            guard isInRange(times: times) else {
                print("루틴 횟수는 0보다 크고 10보다 같거나 작아야합니다.", terminator: " ")
                continue
            }
            
            return times
        }
        
        throw Errors.invalidInput
    }
        
    private func isInRange(times: Int) -> Bool {
        1...10 ~= times
    }
  
    private func doSingleRoutine(activities: [Activity]) throws {
        for activity in activities {
            guard isExausted() == false else { throw Errors.exhaust }
            
            print("<<\(activity.name)을(를) 시작합니다>>")
            activity.action(bodyCondition)
            print("--------------")
        }
    }
    
    private func isExausted() -> Bool {
        100... ~= bodyCondition.fatigue
    }
    
}
