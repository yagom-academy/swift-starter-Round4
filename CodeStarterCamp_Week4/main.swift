//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: STEP2 야곰 피트니스, 지옥의 헬스 트레이닝
let rowan = BodyCondition()

var hellRoutine = Routine(name: "hellRoutine", member: rowan, activities: [sitUp, dynamicBreak, climbing, dynamicBreak])

<<<<<<< HEAD
print("루틴을 몇 번 반복할까요?")
startRoutine(hellRoutine)
=======
// MARK: STEP2 야곰 피트니스, 지옥의 헬스 트레이닝
enum RoutineError: Error {
    case overFatigueLimit
    case wrongInput
    case overRoutineLimit
}

let ordinalNumber: Array<String> = ["첫", "두", "세", "네", "다섯", "여섯", "일곱", "여덟", "아홉", "열"]

struct Routine {
    let name: String
    let activities: Array<Activity> = [sitUp, dynamicBreak, climbing, dynamicBreak]
    let member: BodyCondition
    
    mutating func repeatRoutine(_ bodyCondition: BodyCondition) throws {
        var roundUInt: UInt?
        if let round = readLine() {
            roundUInt = UInt(round)
            guard let checkRound = roundUInt, type(of: checkRound) == UInt.self else {
                throw RoutineError.wrongInput
            }
        }
        print("--------------")
        
        if let range = roundUInt {
            for round in 0...range-1 {
                guard round < 10 else {
                    throw RoutineError.overRoutineLimit
                }
                
                let number = Int(round)
                print("\(ordinalNumber[number]) 번째 \(self.name)을(를) 시작합니다.")
                for count in 0...self.activities.count-1 {
                    self.activities[count].action(self.member)
                    guard self.member.fatigue < 100 else {
                        throw RoutineError.overFatigueLimit
                    }
                }
            }
            bodyCondition.checkCondition()
        }
    }
}

var hellRoutine = Routine(name: "hellRoutine", member: rowan)

func startRoutine() throws {
    print("루틴을 몇 번 반복할까요?")
    do {
        try hellRoutine.repeatRoutine(hellRoutine.member)
    } catch RoutineError.overFatigueLimit {
        print("피로도가 100 이상입니다. 루틴을 중단합니다.")
        hellRoutine.member.checkCondition()
    } catch RoutineError.wrongInput {
        print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        try hellRoutine.repeatRoutine(hellRoutine.member)
    } catch RoutineError.overRoutineLimit {
        print("루틴 반복 횟수 최대치 10회를 초과했습니다. 루틴을 중단합니다.")
        hellRoutine.member.checkCondition()
    }
}

try startRoutine()
>>>>>>> 1c0914f (WEEK4_STEP2 수정 - worngInput오류부분)
