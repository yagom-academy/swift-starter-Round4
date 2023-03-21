//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        didSet {
            print("상체근력이 \(upperBodyStrength - oldValue) 상승합니다.")
        }
    }
    var lowerBodyStrength: Int {
        didSet {
            print("하체근력이 \(lowerBodyStrength - oldValue) 상승합니다.")
        }
    }
    var muscularEndurance: Int {
        didSet {
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    var fatigue: Int{
        didSet {
            if fatigue > oldValue {
                print("피로도가 \(fatigue - oldValue) 상승합니다.")
            } else {
                print("피로도가 \(oldValue - fatigue) 감소합니다.")
            }
        }
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func conditionCheck() {
        print("""
            현재의 컨디션은 다음과 같습니다.
            상체근력: \(upperBodyStrength)
            하체근력: \(lowerBodyStrength)
            근지구력: \(muscularEndurance)
            피로도: \(fatigue)
            ----------
            """
        )
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    print("<<\(sitUp.name)을(를) 시작합니다.>>")
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
    print("----------")
})

let squat: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<\(squat.name)을(를) 시작합니다.>>")
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
    print("----------")
})

let longRun: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<\(longRun.name)을(를) 시작합니다.>>")
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 20...30)
    print("----------")
})

let dynamicBreak: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<\(dynamicBreak.name)을(를) 시작합니다.>>")
    bodyCondition.fatigue -= Int.random(in: 5...10)
    print("----------")
})

let myBody = BodyCondition(upperBodyStrength: 10, lowerBodyStrength: 10, muscularEndurance: 10, fatigue: 0)

sitUp.action(myBody)
squat.action(myBody)
longRun.action(myBody)
dynamicBreak.action(myBody)
myBody.conditionCheck()
