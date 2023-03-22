//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum ActivityRoutineProgramError: Error {
    case notNumber
    case overActivity
}

struct Routine {
    var name: String
    var activities: [Activity] = [sitUp, squat, marathon, dynamicResting]
    let ordinalNumber: [String] = ["첫", "두", "세", "네", "다섯"]
}

struct Trainer {
    var name: String = "피티쌤"
    
    func inputRoutineCount() throws -> Int {
        print("루틴을 몇 번 반복할까요? :", terminator: " ")
        
        guard let countString: String = readLine(), let count: Int = Int(countString) else {
            throw ActivityRoutineProgramError.notNumber
        }
        guard count > 0 else {
            throw ActivityRoutineProgramError.notNumber
        }
        return count
    }
    
    func startRoutine(_ routine: Routine, to member: Member) {
        do {
            try member.executeRoutine(count: inputRoutineCount(), routine: routine)
        } catch ActivityRoutineProgramError.notNumber {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        } catch ActivityRoutineProgramError.overActivity {
            print("피로도가 100 이상입니다. 루틴을 중단합니다.")
            member.bodyCondition.checkBodyCondition()
        } catch {
            print(error)
        }
    }
}

struct Member {
    var name: String
    let bodyCondition: BodyCondition
    
    func executeRoutine(count: Int, routine: Routine) throws {
        var round: Int = 1
        
        while round <= count {
            print("\(routine.ordinalNumber[round-1]) 번째 \(routine.name)을(를) 시작합니다.")
            
            for activity in routine.activities {
                print("<<\(activity.name)을(를) 시작합니다>>")
                activity.action(bodyCondition)
                print("------------------------")
            
                guard bodyCondition.degreeOfFatigue < 100 else {
                    throw ActivityRoutineProgramError.overActivity
                }
            }
            round += 1
        }
        bodyCondition.checkBodyCondition()
    }
}

let whales: Member = Member(name: "Whales", bodyCondition: BodyCondition(upper: 10, lower: 15, muscular: 20, fatigue: 15))
let trainer = Trainer()
let newRoutine: Routine = Routine(name: "hellRoutine")

trainer.startRoutine(newRoutine, to: whales)
