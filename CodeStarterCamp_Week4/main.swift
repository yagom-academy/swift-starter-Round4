//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/// BodyCondition 타입을 설계합니다.
class BodyCondition {
    var upperBodyStrength: Int {
        willSet {
            printChangedStatus(newData: newValue, currentData: upperBodyStrength, part: .upper)
        }
    }
    var lowerBodyStrength: Int {
        willSet {
            printChangedStatus(newData: newValue, currentData: lowerBodyStrength, part: .lower)
        }
    }
    var muscularEndurance: Int {
        willSet {
            printChangedStatus(newData: newValue, currentData: muscularEndurance, part: .endurance)
        }
    }
    var fatigue: Int {
        willSet {
            printChangedStatus(newData: newValue, currentData: fatigue, part: .fatigue)
        }
    }
    
    init(upper: Int, lower: Int, edurance: Int, fatigue: Int) {
        self.upperBodyStrength = upper
        self.lowerBodyStrength = lower
        self.muscularEndurance = edurance
        self.fatigue = fatigue
    }
    
    /// Property Observer 내부에서 값의 변화를 감지하여 값을 출력해줄 함수
    func printChangedStatus(newData: Int, currentData: Int, part: bodyStatus) {
            
        if newData > currentData {
            print("\(part.rawValue)이(가) \(newData - currentData)만큼 상승했습니다.")
        } else if newData == currentData {
        } else {
            print("\(part.rawValue)이(가) \(currentData - newData)만큼 하락했습니다.")
        }
    }
    
    /// 현상태 BodyCondtion을 체크하는 함수
    func checkCurrenStatus() {
        print("-----------------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("\(bodyStatus.upper.rawValue): \(upperBodyStrength)")
        print("\(bodyStatus.lower.rawValue): \(lowerBodyStrength)")
        print("\(bodyStatus.endurance.rawValue): \(muscularEndurance)")
        print("\(bodyStatus.fatigue.rawValue): \(fatigue)")
        print("-----------------------")
    }
}

/// Activity 타입을 설계합니다.
struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

/// bodyStatus 타입을 설계합니다.
enum bodyStatus: String {
    case upper = "상체근력", lower = "하체근력", endurance = "근지구력", fatigue = "피로도"
}

/// Harry의 BodyCondition 인스턴스를 생성합니다.
var bodyConditionOfHarry = BodyCondition(upper: 30, lower: 40, edurance: 60, fatigue: 60)


/// 각종 운동에 대한 Activity 인스턴스를 생성하고 내부에 클로져를 통해 해당 운동에 알맞는 상태를 증가 또는 하락시키는 함수 블럭을 설계합니다.
let situp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    bodyCondition.upperBodyStrength += randomGenerator(from: 10, to: 20, option: true)
    bodyCondition.lowerBodyStrength += 0
    bodyCondition.muscularEndurance += 0
    bodyCondition.fatigue += randomGenerator(from: 10, to: 20, option: true)
})

let squat: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    bodyCondition.upperBodyStrength += 0
    bodyCondition.lowerBodyStrength += randomGenerator(from: 20, to: 30, option: true)
    bodyCondition.muscularEndurance += 0
    bodyCondition.fatigue += randomGenerator(from: 10, to: 20, option: true)
})

let longrun: Activity = Activity(name: "오래 달리기", action: { bodyCondition in
    bodyCondition.upperBodyStrength += randomGenerator(from: 5, to: 10, option: true)
    bodyCondition.lowerBodyStrength += randomGenerator(from: 5, to: 10, option: true)
    bodyCondition.muscularEndurance += randomGenerator(from: 20, to: 30, option: true)
    bodyCondition.fatigue += randomGenerator(from: 20, to: 30, option: true)
})

/// if 문을 지정한 이유는 피로도가 0 이하로 떨어져 - 값이 나오는 것을 방지하기 위함
let relaxation: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    bodyCondition.fatigue += randomGenerator(from: 5, to: 10, option: false)
    if bodyCondition.fatigue < 0 {
        bodyCondition.fatigue = 0
    }
})
  
/// Activity 수행시 지정된 범위 만큼 랜덤한 수를 반환하는 함수
func randomGenerator(from a: Int, to b: Int, option updown: Bool) -> Int {
    var randomValue = Int.random(in: a...b)
    if updown == false {
        randomValue = -randomValue
    }
    return randomValue
}

/// Activity를 수행하는 함수
func doActivity(to condition: BodyCondition, do activity: Activity) {
    print("\(activity.name)을(를) 시작합니다.")
    activity.action(condition)
}

bodyConditionOfHarry.checkCurrenStatus()

doActivity(to: bodyConditionOfHarry, do: situp)
bodyConditionOfHarry.checkCurrenStatus()

doActivity(to: bodyConditionOfHarry, do: squat)
bodyConditionOfHarry.checkCurrenStatus()

doActivity(to: bodyConditionOfHarry, do: longrun)
bodyConditionOfHarry.checkCurrenStatus()

doActivity(to: bodyConditionOfHarry, do: relaxation)
bodyConditionOfHarry.checkCurrenStatus()


