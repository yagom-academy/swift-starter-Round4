//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var upperBodyStrength = 0 {
        didSet(oldValue) {
            print("상체근력이 \(self.upperBodyStrength - oldValue) 상승합니다.")
        }
    }

    var lowerBodyStrength = 0 {
        didSet(oldValue) {
            print("하체근력이 \(self.lowerBodyStrength - oldValue) 상승합니다.")
        }
    }

    var muscularEndurance = 0 {
        didSet(oldValue) {
            print("근지구력이 \(self.muscularEndurance - oldValue) 상승합니다.")
        }
    }

    var fatigue = 0 {
        didSet(oldValue) {
            if fatigue > 0, fatigue >= oldValue {
                print("피로도가 \(self.fatigue - oldValue) 상승합니다.")
            } else if fatigue >= 0, fatigue < oldValue {
                print("피로도가 \(oldValue - self.fatigue) 감소합니다.")
            } else {
                fatigue = 0
                print("컨디션 최상! 더 이상 피로도가 감소하지 않습니다.")
            }
        }
    }

    func checkCondition() {
        print("""
    현재의 컨디션은 다음과 같습니다.
    상체근력: \(self.upperBodyStrength)
    하체근력: \(self.lowerBodyStrength)
    근지구력: \(self.muscularEndurance)
    피로도: \(self.fatigue)
    --------------
    """)
    }

    func addRandomIntUpperStrength(from a: Int, to b: Int) {
        self.upperBodyStrength += Int.random(in: a...b)
    }

    func addRandomIntLowerStrength(from a: Int, to b: Int) {
        self.lowerBodyStrength += Int.random(in: a...b)
    }

    func addRandomIntMuscularEndurance(from a: Int, to b: Int) {
        self.muscularEndurance += Int.random(in: a...b)
    }

    func addRandomIntFatigue(from a: Int, to b: Int) {
        self.fatigue += Int.random(in: a...b)
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp = Activity(name: "윗몸일으키키", action: { bodyCondition in
    print("<<\(sitUp.name)을(를) 시작합니다>>")
    bodyCondition.addRandomIntUpperStrength(from: 10, to: 20)
    bodyCondition.addRandomIntFatigue(from: 10, to: 20)
    print("--------------")
})

let squat = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<\(squat.name)을(를) 시작합니다>>")
    bodyCondition.addRandomIntLowerStrength(from: 20, to: 30)
    bodyCondition.addRandomIntFatigue(from: 10, to: 20)
    print("--------------")
})

let running = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<\(running.name)을(를) 시작합니다>>")
    bodyCondition.addRandomIntMuscularEndurance(from: 20, to: 30)
    bodyCondition.addRandomIntUpperStrength(from: 5, to: 10)
    bodyCondition.addRandomIntLowerStrength(from: 5, to: 10)
    bodyCondition.addRandomIntFatigue(from: 20, to: 30)
    print("--------------")
})

let dynamicBreak = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<\(dynamicBreak.name)을(를) 시작합니다>>")
    bodyCondition.addRandomIntFatigue(from: -10, to: -5)
    print("--------------")
})

let climbing = Activity(name: "클라이밍", action: { bodyCondition in
    print("\(climbing.name)을(를) 시작합니다>>")
    bodyCondition.addRandomIntUpperStrength(from: 5, to: 10)
    bodyCondition.addRandomIntLowerStrength(from: 5, to: 10)
    bodyCondition.addRandomIntMuscularEndurance(from: 10, to: 20)
    bodyCondition.addRandomIntFatigue(from: 5, to: 10)
    print("--------------")
})


// MARK: STEP2 야곰 피트니스, 지옥의 헬스 트레이닝
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
    
    func doRoutine(_ bodyCondition: BodyCondition) throws {
        for count in 0...self.activities.count - 1 {
            self.activities[count].action(bodyCondition)
            guard bodyCondition.fatigue < 100 else {
                throw RoutineError.overFatigueLimit
            }
        }
    }
    
    func repeatRoutine(_ bodyCondition: BodyCondition) throws {
        let round = try self.inputRound()
        print("--------------")
        
        for round in 0...round - 1 {
            print("\(ordinalNumber[round]) 번째 \(self.name)을(를) 시작합니다.")
            try self.doRoutine(bodyCondition)
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


let rowan = BodyCondition()
let hellRoutine = Routine(name: "hellRoutine", member: rowan, activities: [sitUp, dynamicBreak, squat])

print("루틴을 몇 번 반복할까요?")
startRoutine(hellRoutine)
