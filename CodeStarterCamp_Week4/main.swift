//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

enum ExerciseError: Error {
    case highFatigueError // 100이상의 피로도
    case incorrectInputError // 예상치 못한 입력값
}

struct Routine {
    let name: String
    let activities: [Activity]
    
    init(name: String, activities: [Activity]) {
        self.name = name
        self.activities = activities
    }
}

class BodyCondition {
    var upperBodyMuscle = 50 {
        willSet(newValue) {
            print("상체 근력이 \(newValue - upperBodyMuscle) 상승합니다")
        }
    }
    
    var lowerBodyMuscle = 60 {
        willSet(newValue) {
            print("하체 근력이 \(newValue - lowerBodyMuscle) 상승합니다")
        }
    }
    
    var endurance = 30 {
        willSet(newValue) {
            print("근지구력이 \(newValue - endurance) 상승합니다")
        }
    }
    
    var fatigue = 15 {
        willSet(newValue) {
            if newValue > fatigue {
                print("피로도가 \(newValue - fatigue) 상승합니다")
            } else {
                print("피로도가 \(fatigue - newValue) 하락합니다")
            }
        }
    }
    
    func printBodyCondition() {
        print("""
        현재의 컨디션은 다음과 같습니다
        상체근력: \(self.upperBodyMuscle)
        하체근력: \(self.lowerBodyMuscle)
        근지구력: \(self.endurance)
        피로도: \(self.fatigue)
        ----------------
        """)
    }
}

func checkCorrectInput(readData: String?) throws -> Int {
    var intData: Int = 0
    if let stringData = readData {
        intData = Int(stringData) ?? 0
        guard intData > 0 else {
            throw ExerciseError.incorrectInputError
        }
    } else {
        throw ExerciseError.incorrectInputError
    }
    
    return intData
}

func readNumRoutine() -> Int {
    print("루틴을 몇번 반복할까요?")
    while true {
        let numRoutineData = readLine()
        do {
            let numRoutine = try checkCorrectInput(readData: numRoutineData)
            return numRoutine
        } catch ExerciseError.incorrectInputError {
            print("잘못된 입력 형식입니다 다시 입력해주세요")
        } catch {
            print(error)
        }
    }
}

func doExercise(activity: Activity, body: BodyCondition) throws -> Void {
    print("<<\(activity.name)을(를) 시작합니다>>")
    activity.action(body)
    print("----------------")
    
    guard body.fatigue < 100 else {
        throw ExerciseError.highFatigueError
    }
}

func exerciseRoutines(numRoutine: Int, routines: Routine, person: BodyCondition) {
    for num in 1...numRoutine {
        print("\(num) 번째 \(routines.name)을(를) 시작합니다")
        for routine in routines.activities {
            do {
                try doExercise(activity: routine, body: person)
            } catch ExerciseError.highFatigueError {
                print("""
                      피로도가 100 이상입니다. 루틴을 중단합니다.
                      \(person.printBodyCondition())
                      """)
                return
            } catch {
                print("Error")
                return
            }
        }
    }
    print(person.printBodyCondition())
}

let sitUp = Activity(name: "윗몸일으키기", action: { (bodyCondition) -> Void in
    bodyCondition.upperBodyMuscle += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
} )

let squat = Activity(name: "스쿼트", action: { (bodyCondition) -> Void in
    bodyCondition.lowerBodyMuscle += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
} )

let running = Activity(name: "오래달리기", action: { (bodyCondition) -> Void in
    bodyCondition.endurance += Int.random(in: 20...30)
    bodyCondition.upperBodyMuscle += Int.random(in: 5...10)
    bodyCondition.lowerBodyMuscle += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
} )

let rest = Activity(name: "동적휴식", action: { (bodyCondition) -> Void in
    bodyCondition.fatigue -= Int.random(in: 5...10)
} )

var leon = BodyCondition()
let routines = Routine(name: "First Routine", activities: [sitUp, rest, running, squat])
let numRoutine = readNumRoutine()

exerciseRoutines(numRoutine: numRoutine, routines: routines, person: leon)
