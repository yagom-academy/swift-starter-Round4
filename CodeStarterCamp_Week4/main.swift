//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    let name: String
    var upperBodyStrength: Int = 200 { // 한번에 들 수 있는 무게: 20kg인 상태일 때 200
        didSet {
            self.printChangeInCondition(condition: "상체근력이", amountOfChange: (upperBodyStrength - oldValue))
        }
    }
    var lowerBodyStrength: Int = 200 {
        didSet {
            self.printChangeInCondition(condition: "하체근력이", amountOfChange: (lowerBodyStrength - oldValue))
        }
    }
    var muscularEndurance: Int = 200 { // 지속적으로 들 수 있는 무게: 상체와 하체의 합보다 클 수 없게끔 계산식 설계할 것
        didSet {
            self.printChangeInCondition(condition: "근지구력이", amountOfChange: (muscularEndurance - oldValue))
        }
    }
    var fatigue: Int = 0 {
        didSet {
            self.printChangeInCondition(condition: "피로도가", amountOfChange: (fatigue - oldValue))
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    func doActivity(activity: Activity) {
        if self.fatigue < 100 {
            print("<<\(activity.name)을(를) 시작합니다>>")
            activity.action(self)
        } else {
            print("\(self.name)은(는) 너무 피곤해서 \(activity.name)을(를) 할 수 없다.")
        }
        checkBodyCondition()
    }
    
    private func printChangeInCondition(condition property: String, amountOfChange: Int) {
        if amountOfChange > 0 {
            print("\(property) \(amountOfChange) 상승합니다.")
        } else {
            print("\(property) \(amountOfChange) 감소합니다.")
        }
    }
    
    func checkBodyCondition() {
        print("""
--------------
현재 \(self.name)의 컨디션은 다음과 같습니다.
상체근력: \(self.upperBodyStrength)
하체근력: \(self.lowerBodyStrength)
근지구력: \(self.muscularEndurance)
피로도: \(self.fatigue)
--------------
""")
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let gundy: BodyCondition = .init(name: "건디")

let sitUP: Activity = .init(name: "윗몸일으키기", action: {
    $0.upperBodyStrength += Int.random(in: 10...20) - ($0.upperBodyStrength / 250) // 성장할수록 증량은 줄어듬
    $0.fatigue += Int.random(in: 10...20) + ($0.fatigue / 10) // 피곤할수록 더욱 쉽게 피로해짐
})

let squat: Activity = .init(name: "스쿼트", action: {
    $0.lowerBodyStrength += Int.random(in: 20...30) - ($0.lowerBodyStrength / 200)
    $0.fatigue += Int.random(in: 10...20) + ($0.fatigue / 10)
})

let longDistanceRunning: Activity = .init(name: "오래달리기", action: {
    $0.upperBodyStrength += Int.random(in: 5...10) - ($0.upperBodyStrength / 500)
    $0.lowerBodyStrength += Int.random(in: 5...10) - ($0.lowerBodyStrength / 500)
    $0.muscularEndurance += Int.random(in: 20...30) - (($0.upperBodyStrength + $0.lowerBodyStrength) / 350)
    $0.fatigue += Int.random(in: 20...30) + ($0.fatigue / 10)
})

let activeRest: Activity = .init(name: "동적휴식", action: {
    $0.fatigue += ((-1) * Int.random(in: 5...10)) + ($0.fatigue / 20) // 피곤할수록 피로회복력 저하
})

gundy.doActivity(activity: sitUP)
gundy.doActivity(activity: squat)
gundy.doActivity(activity: longDistanceRunning)
gundy.doActivity(activity: activeRest)
gundy.fatigue = 100
gundy.doActivity(activity: sitUP)
