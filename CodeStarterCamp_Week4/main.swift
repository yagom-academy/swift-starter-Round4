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
        
        guard let countString: String = readLine(), let count: Int = Int(countString) else {
            throw ProgramError.notNumber
        }
        guard count > 0 else {
            throw ProgramError.notNumber
        }
        return count
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
    
    func startRoutine(_ routine: Routine, by bodyCondition: BodyCondition) {
        do {
            try routine.executeRoutine(count: routine.inputRoutineCount(), for: bodyCondition)
        } catch ProgramError.notNumber {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        } catch ProgramError.overActivity {
            print("피로도가 100 이상입니다. 루틴을 중단합니다.")
            bodyCondition.checkBodyCondition()
        } catch {
            print(error)
        }
    }
}

let whalesBodyCondition: BodyCondition = BodyCondition(upper: 10, lower: 15, muscular: 20, fatigue: 0)
let newRoutine: Routine = Routine(name: "hellRoutine")
newRoutine.startRoutine(newRoutine, by: whalesBodyCondition)
