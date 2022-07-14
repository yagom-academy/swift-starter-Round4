//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum RoutineError: Error {
    case fatigueOverflow
    case wrongInput
}

class BodyCondition {
    
}

class 상체근력: BodyCondition {
    var value: Int = 0 {
        didSet(oldNum) {
            let num = self.value - oldNum
            if num > 0 {
                print("상체근력이 \(num) 상승합니다.")
            } else if num == 0 {
                print("상체근력이 변하지 않았습니다.")
            } else {
                print("상체근력이 \(abs(num)) 하락합니다.")
            }
        }
    }
    
    func adjustValue(_ minimumValue: Int, _ maximumValue: Int) {
        self.value += Int.random(in: minimumValue...maximumValue)
    }
}

class 하체근력: BodyCondition {
    var value: Int = 0 {
        didSet(oldNum) {
            let num = self.value - oldNum
            if num > 0 {
                print("하체근력이 \(num) 상승합니다.")
            } else if num == 0 {
                print("하체근력이 변하지 않았습니다.")
            } else {
                print("하체근력이 \(abs(num)) 하락합니다.")
            }
        }
    }

    func adjustValue(_ minimumValue: Int, _ maximumValue: Int) {
        self.value += Int.random(in: minimumValue...maximumValue)
    }
}

class 근지구력: BodyCondition {
    var value: Int = 0 {
        didSet(oldNum) {
            let num = self.value - oldNum
            if num > 0 {
                print("근지구력이 \(num) 상승합니다.")
            } else if num == 0 {
                print("근지구력이 변하지 않았습니다.")
            } else {
                print("근지구력이 \(abs(num)) 하락합니다.")
            }
        }
    }
            
    func adjustValue(_ minimumValue: Int, _ maximumValue: Int) {
        self.value += Int.random(in: minimumValue...maximumValue)
    }
}

class 피로도: BodyCondition {
    var value: Int = 0 {
        didSet(oldNum) {
            let num = self.value - oldNum
            if num > 0 {
                print("피로도가 \(num) 상승합니다.")
            } else if num == 0 {
                print("피로도가 변하지 않았습니다.")
            } else {
                print("피로도가 \(abs(num)) 하락합니다.")
            }
        }
    }
    
    func adjustValue(_ minimumValue: Int, _ maximumValue: Int) {
        self.value += Int.random(in: minimumValue...maximumValue)
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

class Routine {
    let name: String
    let activities: Array<Activity>
    var fatigueOverflow: Bool {
        return fatigue.value > 100
    }
    
    init(_ name: String, _ activities: Array<Activity>) {
        self.name = name
        self.activities = activities
    }
    
    func doRoutine() throws {
        let input = readLine() ?? ""
        
        guard Int(input) ?? 0 > 0 else {
            throw RoutineError.wrongInput
        }
        print("--------------")
        for i in 1...(Int(input) ?? 1) {
            print("\(i) 번째 \(self.name)을(를) 시작합니다.")
            for act in self.activities {
                print("<<\(act.name)을(를) 시작합니다>>")
                act.action(bodyCondition)
                print("--------------")
                guard fatigueOverflow == false else {
                    throw RoutineError.fatigueOverflow
                }
            }
        }
        printCondition()
    }
}

func doActivity(_ act: Activity) {
    print("<<\(act.name)을(를) 시작합니다>>")
    act.action(bodyCondition)
    print("--------------")
}

func printCondition() {
    print("""
    현재의 컨디션은 다음과 같습니다.
    상체근력: \(upperBodyStrength.value)
    하체근력: \(lowerBodyStrength.value)
    근지구력: \(muscularEndurance.value)
    피로도: \(fatigue.value)
    --------------
    """)
}

func doRoutineCourse(_ routine: Routine) throws {
    print("루틴을 몇 번 반복할까요?")
    while true {
        do {
            try routine.doRoutine()
            return
        } catch RoutineError.fatigueOverflow {
            print("피로도가 100 이상입니다. 루틴을 중단합니다.")
            printCondition()
            return
        } catch RoutineError.wrongInput {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        }
    }
}

var bodyCondition = BodyCondition()
var upperBodyStrength = 상체근력()
var lowerBodyStrength = 하체근력()
var muscularEndurance = 근지구력()
var fatigue = 피로도()

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    upperBodyStrength.adjustValue(10, 20)
    fatigue.adjustValue(10, 20)
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    lowerBodyStrength.adjustValue(20, 30)
    fatigue.adjustValue(10, 20)
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    muscularEndurance.adjustValue(20, 30)
    upperBodyStrength.adjustValue(5, 10)
    lowerBodyStrength.adjustValue(5, 10)
    fatigue.adjustValue(20, 30)
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    fatigue.adjustValue(-10, -5)
})

var routine = Routine("hellRoutine", [윗몸일으키기, 스쿼트, 오래달리기, 동적휴식])

try doRoutineCourse(routine)
