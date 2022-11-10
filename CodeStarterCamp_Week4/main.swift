//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum ActivityError: Error {
      case overFatigue
      case invalidInput
}

class BodyCondition {
    var 상체근력: Int {
        didSet(oldValue) {
            상체근력 = correctChangedValue(varName: "상체근력", oldValue: oldValue, currentValue: 상체근력)
            monitorChanges(varName: "상체근력", oldValue: oldValue, correctedValue: 상체근력)
        }
    }
    var 하체근력: Int {
        didSet(oldValue) {
            하체근력 = correctChangedValue(varName: "하체근력", oldValue: oldValue, currentValue: 하체근력)
            monitorChanges(varName: "하체근력", oldValue: oldValue, correctedValue: 하체근력)
        }
    }
    var 근지구력: Int {
        didSet(oldValue) {
            근지구력 = correctChangedValue(varName: "근지구력", oldValue: oldValue, currentValue: 근지구력)
            monitorChanges(varName: "근지구력", oldValue: oldValue, correctedValue: 근지구력)
        }
    }
    var 피로도: Int {
        didSet(oldValue) {
            피로도 = correctChangedValue(varName: "피로도", oldValue: oldValue, currentValue: 피로도)
            monitorChanges(varName: "피로도", oldValue: oldValue, correctedValue: 피로도)
        }
    }
    
    func correctChangedValue (varName: String, oldValue: Int, currentValue: Int) -> Int {
        var correctedValue: Int
        
        if currentValue < 0 {
            correctedValue = 0
        } else {
            correctedValue = currentValue
        }

        return correctedValue
    }
    
    func monitorChanges (varName: String, oldValue: Int, correctedValue: Int) {
        if correctedValue != oldValue {
            print("\(varName)", terminator: "")
            
            if varName.hasSuffix("력") {
                print("이 ", terminator: "")
            } else {
                print("가 ", terminator: "")
            }
            
            if correctedValue <= oldValue {
                print("\(oldValue - correctedValue) 하락합니다.")
            } else {
                print("\(correctedValue - oldValue) 상승합니다.")
            }
        }
    }

    func printCurrentCondition () {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(상체근력)")
        print("하체근력: \(하체근력)")
        print("근지구력: \(근지구력)")
        print("피로도: \(피로도)")
        print("--------------")
    }
    
    init (상체근력: Int = 0, 하체근력: Int = 0, 근지구력: Int = 0, 피로도: Int = 0) {
        self.상체근력 = 상체근력
        self.하체근력 = 하체근력
        self.근지구력 = 근지구력
        self.피로도 = 피로도
    }
}

func checkInputCount (inputCountRoutines: String?) throws -> Int {
    var returnInt = 0
    if let inputToString = inputCountRoutines, let inputToInt = Int(inputToString) {
            guard inputToInt >= 1 && inputToInt < 100 else {
                throw ActivityError.invalidInput
            }
            returnInt = inputToInt
        } else {
            throw ActivityError.invalidInput
        }
    
    return returnInt
}

func doActivity (bodyCondition: BodyCondition, activityName: String, 상체근력: ClosedRange<Int>, 하체근력: ClosedRange<Int>, 근지구력: ClosedRange<Int>, 피로도: ClosedRange<Int>) {
    print("<<\(activityName)을(를) 시작합니다>>")
    bodyCondition.상체근력 += Int.random(in: 상체근력)
    bodyCondition.하체근력 += Int.random(in: 하체근력)
    bodyCondition.근지구력 += Int.random(in: 근지구력)
    bodyCondition.피로도 += Int.random(in: 피로도)
    print("--------------")
}

func changeNumToOrdinal (num: Int) -> String {
    var returnOrdinal = ""
    
    if num >= 10 && num < 100 {
        switch num / 10 {
        case 1:
            returnOrdinal = "열"
        case 2:
            returnOrdinal = "스물"
        case 3:
            returnOrdinal = "서른"
        case 4:
            returnOrdinal = "마흔"
        case 5:
            returnOrdinal = "쉰"
        case 6:
            returnOrdinal = "예순"
        case 7:
            returnOrdinal = "일흔"
        case 8:
            returnOrdinal = "여든"
        case 9:
            returnOrdinal = "아흔"
        default:
            returnOrdinal = ""
        }
    }
    
    switch num % 10 {
    case 1:
        if num < 10 {
             returnOrdinal += "첫 "
        } else {
            returnOrdinal += "한 "
        }
    case 2:
        returnOrdinal += "두 "
    case 3:
        returnOrdinal += "세 "
    case 4:
        returnOrdinal += "네 "
    case 5:
        returnOrdinal += "다섯 "
    case 6:
        returnOrdinal += "여섯 "
    case 7:
        returnOrdinal += "일곱 "
    case 8:
        returnOrdinal += "여덟 "
    case 9:
        returnOrdinal += "아홉 "
    default:
        returnOrdinal += ""
    }
        
    return returnOrdinal
}

func startRoutines (countRoutines: Int, routine: Routine, mybodyCondition: BodyCondition) {
    do {
        for countRoutine in 1...countRoutines {
            print("\(changeNumToOrdinal(num: countRoutine))번째 \(routine.name)을(를) 시작합니다.")
            for routineActivity in routine.activities {
                try routineActivity.action(myBodyCondition)
            }
        }
    } catch {
        print("피로도가 100 이상입니다. 루틴을 중단합니다.")
    }
}

func takeInputCount () -> Int {
    var countRoutines = 0
    print("루틴을 몇 번 반복할까요?")

    do {
        repeat {
            do {
                let inputCountRoutines = readLine()
                countRoutines = try checkInputCount(inputCountRoutines: inputCountRoutines)
            } catch {
                print("잘못된 입력 형식입니다. 다시 입력해주세요.")
            }
        } while countRoutines == 0
    }
    
    return countRoutines
}

struct Routine {
    let name: String
    let activities: [Activity]
    
    init(name: String, activities: [Activity]) {
        self.name = name
        self.activities = activities
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) throws -> Void
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition throws in
    doActivity(bodyCondition: bodyCondition, activityName: 스쿼트.name, 상체근력: 10...20, 하체근력: 0...0, 근지구력: 0...0, 피로도: 10...20)
    guard bodyCondition.피로도 < 100 else {
        throw ActivityError.overFatigue
    }
})
        
let 스쿼트: Activity = Activity(name: "스쿼트", action: { bodyCondition throws in
    doActivity(bodyCondition: bodyCondition, activityName: 스쿼트.name, 상체근력: 0...0, 하체근력: 20...30, 근지구력: 0...0, 피로도: 10...20)
    guard bodyCondition.피로도 < 100 else {
        throw ActivityError.overFatigue
    }
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: { bodyCondition throws in
    doActivity(bodyCondition: bodyCondition, activityName: 스쿼트.name, 상체근력: 5...10, 하체근력: 5...10, 근지구력: 20...30, 피로도: 20...30)
    guard bodyCondition.피로도 < 100 else {
        throw ActivityError.overFatigue
    }
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    doActivity(bodyCondition: bodyCondition, activityName: 스쿼트.name, 상체근력: 0...0, 하체근력: 0...0, 근지구력: 0...0, 피로도: (-10)...(-5))
    guard bodyCondition.피로도 < 100 else {
        throw ActivityError.overFatigue
    }
})

let 동적음주: Activity = Activity(name: "동적음주", action: { bodyCondition throws in
    doActivity(bodyCondition: bodyCondition, activityName: 스쿼트.name, 상체근력: (-10)...(-5), 하체근력: (-30)...(-20), 근지구력: (-10)...(-5), 피로도: 10...20)
    guard bodyCondition.피로도 < 100 else {
        throw ActivityError.overFatigue
    }
})

// Testing...
var myBodyCondition: BodyCondition = BodyCondition()
let hellRoutine = Routine(name: "hellRoutine", activities: [윗몸일으키기, 동적휴식, 스쿼트])

let countRoutines = takeInputCount()
startRoutines(countRoutines: countRoutines, routine: hellRoutine, mybodyCondition: myBodyCondition)
myBodyCondition.printCurrentCondition()


