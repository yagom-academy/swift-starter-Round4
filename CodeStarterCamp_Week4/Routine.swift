//
//  r.swift
//  CodeStarterCamp_Week4
//
//  Created by suyeon park on 2023/03/19.
//

import Foundation

let fatigueMaginotLine = 100

struct Routine {
    
    let koreanNumber: Dictionary<Int, String> = [1:"첫", 2:"두", 3:"세", 4:"네", 5:"다섯", 6:"여섯", 7:"일곱", 8:"여덟", 9:"아홉", 10:"열"]
    
    let name: String
    let activities: [Activity]
    
    func start(body: BodyCondition) {
        print("루틴을 몇 번 반복할까요?")
        
        do {
            try doRoutine(bodyCondition: body)
        } catch RoutineError.exhaustion {
            print("피로도가 100 이상입니다. 루틴을 중단합니다.")
            printMyBodyCondition(bodyCondition: body)
        } catch RoutineError.invalidInput {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        } catch {
            print("알수없는 문제가 발생하였습니다.")
        }
    }
    
    private func doRoutine(bodyCondition: BodyCondition) throws {
        let times = Int(readLine() ?? "0") ?? 0
        
        guard times > 0 else {
            throw RoutineError.invalidInput
        }
        
        for count in 1...times {
            if bodyCondition.fatigue < fatigueMaginotLine {
                print("\(getKoreanNumber(index: count))번째 \(name)을(를) 시작합니다.")
            }
            for activity in activities {
                if bodyCondition.fatigue >= fatigueMaginotLine {
                    throw RoutineError.exhaustion
                }  else {
                    activity.exercise(bodyCondition: bodyCondition)
                }
                print("--------------")
            }
        }
        
        printMyBodyCondition(bodyCondition: bodyCondition)
    }
    
    private func printMyBodyCondition(bodyCondition: BodyCondition) {
        print("현재의 컨디션은 다음과 같습니다.\n상체근력:\(bodyCondition.upperBodyStrength)\n하체근력: \(bodyCondition.lowerBodyStrength)\n근지구력: \(bodyCondition.muscularEndurance)\n피로도: \(bodyCondition.fatigue)\n--------------")
    }
    
    private func getKoreanNumber(index: Int) -> String {
        return koreanNumber[index] ?? ""
    }
}
