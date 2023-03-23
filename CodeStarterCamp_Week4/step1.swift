//
//  step1.swift
//  CodeStarterCamp_Week4
//
//  Created by Appledayz on 2023/03/21.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int = 0 {
        didSet {
            let diff = upperBodyStrength - oldValue
            if diff > 0 {
                print("상체 근력이 \(diff)만큼 증가했습니다.")
            } else {
                print("상체 근력이 \(diff)만큼 감소했습니다.")
            }
        }
    }

    var lowerBodyStrength: Int = 0 {
        didSet {
            let diff = lowerBodyStrength - oldValue
            if diff > 0 {
                print("하체 근력이 \(diff)만큼 증가했습니다.")
            } else {
                print("하체 근력이 \(diff)만큼 감소했습니다.")
            }
        }
    }

    var coreStrength: Int = 0 {
        didSet {
            let diff = coreStrength - oldValue
            if diff > 0 {
                print("근지구력이 \(diff)만큼 증가했습니다.")
            } else {
                print("근지구력이 \(diff)만큼 감소했습니다.")
            }
        }
    }

    var fatigue: Int = 0 {
        didSet {
            let diff = fatigue - oldValue
            if diff > 0 {
                print("피로도가 \(diff)만큼 증가했습니다.")
            } else {
                print("피로도가 \(diff)만큼 감소했습니다.")
            }
        }
    }

    func increaseUpperBodyStrength(by value: Int) {
        upperBodyStrength += value
    }

    func increaseLowerBodyStrength(by value: Int) {
        lowerBodyStrength += value
    }

    func increaseCoreStrength(by value: Int) {
        coreStrength += value
    }

    func increaseFatigue(by value: Int) {
        if fatigue < -value {
            fatigue = 0; return
        }
        fatigue += value
    }

    func printCondition() {
        print("""
        --------------
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(upperBodyStrength)
        하체근력: \(lowerBodyStrength)
        근지구력: \(coreStrength)
        피로도: \(fatigue)
        --------------
        """)
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let 윗몸일으키기: Activity = .init(name: "윗몸일으키기") { condition in
    print("<<윗몸일으키기을(를)>> 시작합니다.")
    condition.increaseUpperBodyStrength(by: Int.random(in: 10 ... 20))
    condition.increaseFatigue(by: Int.random(in: 10 ... 20))
    condition.printCondition()
}

let 스쿼트: Activity = .init(name: "스쿼트") { condition in
    print("<<스쿼트를>> 시작합니다.")
    condition.increaseLowerBodyStrength(by: Int.random(in: 20 ... 30))
    condition.increaseFatigue(by: Int.random(in: 10 ... 20))
    condition.printCondition()
}

let 오래달리기: Activity = .init(name: "오래달리기") { condition in
    print("<<오래달리기를>> 시작합니다.")
    condition.increaseCoreStrength(by: Int.random(in: 20 ... 30))
    condition.increaseUpperBodyStrength(by: Int.random(in: 5 ... 10))
    condition.increaseLowerBodyStrength(by: Int.random(in: 5 ... 10))
    condition.printCondition()
}

let 동적휴식: Activity = .init(name: "동적휴식") { condition in
    print("<<동적휴식을>> 시작합니다.")
    condition.increaseFatigue(by: Int.random(in: -10 ... -5))
    condition.printCondition()
}
