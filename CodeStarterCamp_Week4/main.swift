//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum ProgramError: Error {
    case notNumber
    case overActivity
}

struct Routine {
    var name: String
    var activities: [Activity] = [sitUp, squat, marathon, dynamicResting]
    let ordinalNumber: [String] = ["첫", "두", "세", "네", "다섯"]
    
    func inputRoutineCount() throws -> Int {
        print("루틴을 몇 번 반복할까요? :", terminator: " ")
        let count: Int? = Int(readLine() ?? "nil")
        let count2: Int = count ?? 0
        guard count2 > 0 else {
            throw ProgramError.notNumber
        }
        return count2
    }

    func executeRoutine(count: Int, for bodyCondition: BodyCondition) throws {
        var round: Int = 1
        while round <= count {
            print("\(ordinalNumber[round-1]) 번째 \(self.name)을(를) 시작합니다.")
            activities[0].action(bodyCondition)
            activities[3].action(bodyCondition)
            activities[1].action(bodyCondition)
            guard bodyCondition.degreeOfFatigue < 100 else {
                
                throw ProgramError.overActivity
            }
            round += 1
        }
        bodyCondition.checkBodyCondition()
    }
}

let bodyCondition: BodyCondition = BodyCondition(upper: 10, lower: 15, muscular: 20, fatigue: 0)
let newRoutine: Routine = Routine(name: "hellRoutine")

do {
    try newRoutine.executeRoutine(count: newRoutine.inputRoutineCount(), for: bodyCondition)
} catch ProgramError.notNumber {
    print("잘못된 입력 형식입니다. 다시 입력해주세요.")
} catch ProgramError.overActivity { // 여기서 잡아보자
    print("피로도가 100 이상입니다. 루틴을 중단합니다.")
    bodyCondition.checkBodyCondition()
} catch {
    print(error)
}


