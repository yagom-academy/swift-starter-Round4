//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by Dawn on 2023/03/20.
//

import Foundation

struct Routine {
    let name: String
    let activities: [Activity]
    let routineCount: [Int: String] = [1: "첫", 2: "두", 3: "셋", 4: "넷", 5: "다섯", 6: "여섯", 7: "일곱", 8: "여덟", 9: "아홉", 10: "열"]
    
    init(name: String, activities: [Activity]) {
        self.name = name
        self.activities = activities
    }
    
    func startRoutine(body: BodyCondition) {
        var isFirstRunning: Bool = true
        
        print("루틴을 몇 번 반복할까요?")
        while isFirstRunning {
            do {
                try isFirstRunning = playRoutine(body)
            } catch RoutineError.invalidInput {
                print("잘못된 입력 형식입니다. 다시 입력해주세요.")
            } catch RoutineError.exceededTimes {
                print("최대 10까지만 입력가능합니다.")
            } catch RoutineError.exceededFatigue {
                print("피로도가 100 이상입니다. 루틴을 중단합니다.")
                body.checkBodyCondition()
                break
            } catch {
                print("확인되지 않은 오류가 발생했습니다.")
            }
        }
    }

    func playRoutine(_ body: BodyCondition) throws -> Bool {
        guard let input = readLine(), let times = Int(input) else { throw RoutineError.invalidInput }
        guard times > 0 else { throw RoutineError.invalidInput }
        guard times <= 10 else { throw RoutineError.exceededTimes }

        print("--------------")
        for count in 1...times {
            print("\(getKoreanCount(count)) 번째 \(name)을(를) 시작합니다.")
            for activity in activities {
                if body.fatigue >= 100 {
                    throw RoutineError.exceededFatigue
                } else {
                    activity.action(body);
                    print("--------------")
                }
            }
        }
        body.checkBodyCondition()
        return false
    }

    func getKoreanCount(_ count: Int) -> String{
        return routineCount[count] ?? String(count)
    }
}

let routine = Routine(name: "hellRoutine", activities: [sitUp, dynamicBreak, squat])
