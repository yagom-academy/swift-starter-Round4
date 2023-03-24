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
            printIncrease("상체근력", increase: upperBodyStrength - oldValue)
        }
    }

    var lowerBodyStrength: Int = 0 {
        didSet {
            printIncrease("하체근력", increase: lowerBodyStrength - oldValue)
        }
    }

    var muscularEndurance: Int = 0 {
        didSet {
            printIncrease("근지구력", increase: muscularEndurance - oldValue)
        }
    }

    var fatigue: Int = 0 {
        didSet {
            if fatigue == 0 {
                print("피로도가 0이 되었습니다.")
            } else {
                printIncrease("피로도", increase: fatigue - oldValue)
            }
        }
    }

    func increaseUpperBodyStrength(by value: Int) {
        upperBodyStrength += value
    }

    func increaseLowerBodyStrength(by value: Int) {
        lowerBodyStrength += value
    }

    func increaseMuscularEndurance(by value: Int) {
        muscularEndurance += value
    }

    func increaseFatigue(by value: Int) {
        if fatigue + value < 0 {
            fatigue = 0
            return
        }
        fatigue += value
    }
    
    func decreaseFatigue(by value: Int) {
        if fatigue - value < 0 {
            fatigue = 0
            return
        }
        fatigue -= value
    }

    func printCondition() {
        print("""
        --------------
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(upperBodyStrength)
        하체근력: \(lowerBodyStrength)
        근지구력: \(muscularEndurance)
        피로도: \(fatigue)
        --------------
        """)
    }

    private func printIncrease(_ name: String, increase: Int) {
        if increase > 0 {
            print("\(name) 이(가) \(increase) 만큼 증가했습니다.")
        } else {
            print("\(name) 이(가) \(-increase) 만큼 감소했습니다.")
        }
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void

    func start(on condition: BodyCondition) {
        print("<<\(name)를(을) 시작합니다>>")
        action(condition)
        condition.printCondition()
    }
}

let sitUp: Activity = .init(name: "윗몸일으키기") { condition in
    condition.increaseUpperBodyStrength(by: Int.random(in: 10...20))
    condition.increaseFatigue(by: Int.random(in: 10...20))
}

let squat: Activity = .init(name: "스쿼트") { condition in
    condition.increaseLowerBodyStrength(by: Int.random(in: 20...30))
    condition.increaseFatigue(by: Int.random(in: 10...20))
}

let longRun: Activity = .init(name: "오래달리기") { condition in
    condition.increaseMuscularEndurance(by: Int.random(in: 20...30))
    condition.increaseUpperBodyStrength(by: Int.random(in: 5...10))
    condition.increaseLowerBodyStrength(by: Int.random(in: 5...10))
}

let dynamicBreak: Activity = .init(name: "동적휴식") { condition in
    condition.decreaseFatigue(by: Int.random(in: 5...10))
}
