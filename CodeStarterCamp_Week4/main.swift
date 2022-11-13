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
    var upperBoddyStrength: Int
    var lowerBoddyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(upper: Int, lower: Int, edurance: Int, fatigue: Int) {
        self.upperBoddyStrength = upper
        self.lowerBoddyStrength = lower
        self.muscularEndurance = edurance
        self.fatigue = fatigue
    }
}

/// Activity 타입을 설계합니다.
struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

/// Status 타입을 설계합니다.
enum Status: String {
    case upper = "상체근력", lower = "하체근력", endurance = "근지구력", fatigue = "피로도"
}

/// Harry의 BodyCondition 인스턴스를 생성합니다.
var bodyConditionOfHarry = BodyCondition(upper: 30, lower: 40, edurance: 60, fatigue: 60)


/// 각종 운동에 대한 Activity 인스턴스를 생성하고 내부에 클로져를 통해 해당 운동에 알맞는 상태를 증가 또는 하락시키는 함수 블럭을 설계합니다.
let situp: Activity = Activity(name: "윗몸일으키기", action: { BodyCondition in
    BodyCondition.upperBoddyStrength += randomGenerator(from: 10, to: 20, part: .upper, option: true)
    BodyCondition.lowerBoddyStrength += 0
    BodyCondition.muscularEndurance += 0
    BodyCondition.fatigue += randomGenerator(from: 10, to: 20, part: .fatigue, option: true)
})

let squat: Activity = Activity(name: "스쿼트", action: { BodyCondition in
    BodyCondition.upperBoddyStrength += 0
    BodyCondition.lowerBoddyStrength += randomGenerator(from: 20, to: 30, part: .lower, option: true)
    BodyCondition.muscularEndurance += 0
    BodyCondition.fatigue += randomGenerator(from: 10, to: 20, part: .fatigue, option: true)
})

let longrun: Activity = Activity(name: "오래 달리기", action: { BodyCondition in
    BodyCondition.upperBoddyStrength += randomGenerator(from: 5, to: 10, part: .upper, option: true)
    BodyCondition.lowerBoddyStrength += randomGenerator(from: 5, to: 10, part: .lower, option: true)
    BodyCondition.muscularEndurance += randomGenerator(from: 20, to: 30, part: .endurance, option: true)
    BodyCondition.fatigue += randomGenerator(from: 20, to: 30, part: .fatigue, option: true)
})

/// if 문을 지정한 이유는 피로도가 0 이하로 떨어져 - 값이 나오는 것을 방지하기 위함
let relaxation: Activity = Activity(name: "동적휴식", action: { BodyCondition in
    BodyCondition.fatigue += randomGenerator(from: 5, to: 10, part: .fatigue, option: false)
    if BodyCondition.fatigue < 0 {
        BodyCondition.fatigue = 0
    }
})
  
/// Activity 수행시 해당 운동에 알맞는 수치 범위와 상승, 하락 설정에 따라서 범위 내 랜덤 값을 반환하는 함수
func randomGenerator(from a: Int, to b: Int, part condition: Status, option updown: Bool) -> Int {
    var randomValue = Int.random(in: a...b)
    if updown == true {
        print("\(condition.rawValue)이(가) \(randomValue)만큼 상승합니다.")
    } else {
        print("\(condition.rawValue)이(가) \(randomValue)만큼 하락합니다.")
        randomValue = -randomValue
    }
    return randomValue
}

/// Activity를 수행하는 함수
func doActivity(to condition: BodyCondition, do activity: Activity) {
    print("\(activity.name)을(를) 시작합니다.")
    activity.action(condition)
}

/// 현상태 BodyCondtion을 체크하는 함수
func checkCurrenStatus(check condition: BodyCondition) {
    print("-----------------------")
    print("현재의 컨디션은 다음과 같습니다.")
    print("\(Status.upper.rawValue): \(condition.upperBoddyStrength)")
    print("\(Status.lower.rawValue): \(condition.lowerBoddyStrength)")
    print("\(Status.endurance.rawValue): \(condition.muscularEndurance)")
    print("\(Status.fatigue.rawValue): \(condition.fatigue)")
    print("-----------------------")
}

checkCurrenStatus(check: bodyConditionOfHarry)

doActivity(to: bodyConditionOfHarry, do: situp)
checkCurrenStatus(check: bodyConditionOfHarry)

doActivity(to: bodyConditionOfHarry, do: squat)
checkCurrenStatus(check: bodyConditionOfHarry)

doActivity(to: bodyConditionOfHarry, do: longrun)
checkCurrenStatus(check: bodyConditionOfHarry)

doActivity(to: bodyConditionOfHarry, do: relaxation)
checkCurrenStatus(check: bodyConditionOfHarry)



