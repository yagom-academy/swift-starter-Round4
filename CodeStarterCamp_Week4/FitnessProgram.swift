//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by Dawn on 2023/03/24.
//

import Foundation

class FitnessProgram {
    let ordinalNumbers: [Int: String] = [1: "첫", 2: "두", 3: "셋", 4: "넷", 5: "다섯", 6: "여섯", 7: "일곱", 8: "여덟", 9: "아홉", 10: "열"]
    
    func executeFitnessProgram(user body: BodyCondition, with routine: Routine) {
        var isFirstRunning: Bool = true
        
        print("루틴을 몇 번 반복할까요?")
        while isFirstRunning {
            do {
                let input: Int = try inputRoutineTimes()
                try startRoutine(user: body, with: routine, times: input)
                isFirstRunning = false
            } catch RoutineError.invalidInput {
                print("잘못된 입력 형식입니다. 다시 입력해주세요.")
            } catch RoutineError.exceededTimes {
                print("최대 10까지만 입력가능합니다.")
            } catch RoutineError.exceededFatigue {
                print("피로도가 100 이상입니다. 루틴을 중단합니다.")
                body.printCurrentBodyCondition()
                break
            } catch {
                print("확인되지 않은 오류가 발생했습니다.")
            }
        }
    }
    
    func inputRoutineTimes() throws -> Int {
        guard let input = readLine(), let times = Int(input) else { throw RoutineError.invalidInput }
        guard times > 0 else { throw RoutineError.invalidInput }
        guard times <= 10 else { throw RoutineError.exceededTimes }
        
        return times
    }
    
    func startRoutine(user body: BodyCondition, with routine: Routine, times: Int) throws {
        print("--------------")
        for count in 1...times {
            print("\(convertToOrdinalNumber(from: count)) 번째 \(routine.name)을(를) 시작합니다.")
            for activity in routine.activities {
                if body.fatigue >= 100 {
                    throw RoutineError.exceededFatigue
                } else {
                    activity.action(body);
                    print("--------------")
                }
            }
        }
        body.printCurrentBodyCondition()
    }
    
    func convertToOrdinalNumber(from count: Int) -> String{
        return ordinalNumbers[count] ?? String(count)
    }
}
