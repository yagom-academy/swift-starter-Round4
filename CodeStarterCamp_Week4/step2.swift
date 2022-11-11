//
//  step2.swift
//  CodeStarterCamp_Week4
//
//  Created by 김경준 on 2022/11/11.
//

import Foundation

enum RoutineError: Error {
    case overFatigueLimit
    case wrongInput
    case overRoutineLimit
}

let ordinalNumber: Array<String> = ["첫", "두", "세", "네", "다섯", "여섯", "일곱", "여덟", "아홉", "열"]

struct Routine {
    let name: String
    var activities: Array<Activity> = []
    let member: BodyCondition
    
    func inputRound() throws -> Int {
        guard let round = readLine(), round != "0" else {
            throw RoutineError.wrongInput
        }
        guard let roundInt = Int(round), roundInt > 0 else {
            throw RoutineError.wrongInput
        }
        guard roundInt <= 10 else {
            throw RoutineError.overRoutineLimit
        }
        return roundInt
    }
    
    func doRoutine() throws {
        for count in 0...self.activities.count - 1 {
            self.activities[count].action(self.member)
            guard self.member.fatigue < 100 else {
                throw RoutineError.overFatigueLimit
            }
        }
    }
    
    func repeatRoutine(_ bodyCondition: BodyCondition) throws {
        var round = try self.inputRound()
        print("--------------")
        
        for round in 0...round - 1 {
            let number = round
            print("\(ordinalNumber[number]) 번째 \(self.name)을(를) 시작합니다.")
            try self.doRoutine()
        }
        bodyCondition.checkCondition()
    }
    
    init(name: String, member: BodyCondition, activities: Array<Activity>) {
        self.name = name
        self.member = member
        self.activities = activities
    }
}

func startRoutine(_ routine: Routine) {
    do {
        try routine.repeatRoutine(routine.member)
    } catch RoutineError.overFatigueLimit {
        print("피로도가 100 이상입니다. 루틴을 중단합니다.")
        routine.member.checkCondition()
    } catch RoutineError.wrongInput {
        print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        startRoutine(routine)
    } catch RoutineError.overRoutineLimit {
        print("루틴 반복 횟수는 최대 10회 입니다. 다시 입력해주세요.")
        startRoutine(routine)
    } catch {
        print(error)
    }
}
