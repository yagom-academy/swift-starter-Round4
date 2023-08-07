//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    func checkBodyCondition() {
        print("현재의 컨디션은 다음과 같습니다")
        print("상체근력: \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigue)")
    }
}

struct Activity {
    let name: String
    let action: (inout BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기") { bodyCondition in
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
    
    print("상체근력이 \(bodyCondition.upperBodyStrength) 상승합니다.")
    print("피로도가 \(bodyCondition.fatigue) 상승합니다.")
}

let squat: Activity = Activity(name: "스쿼트") { bodyCondition in
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
    
    print("하체근력이 \(bodyCondition.lowerBodyStrength) 상승합니다.")
    print("피로도가 \(bodyCondition.fatigue) 상승합니다.")
}

let longRun: Activity = Activity(name: "오래달리기") { bodyCondition in
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
    
    printActivityEffects(name: "오래달리기", bodyCondition: bodyCondition)
}

let dynamicBreak: Activity = Activity(name: "동적휴식") { bodyCondition in
    let decreaseAmount = Int.random(in: 5...10)
        bodyCondition.fatigue -= decreaseAmount
        bodyCondition.fatigue = max(bodyCondition.fatigue, 0)
    
    print("피로도가 \(bodyCondition.fatigue) 하락합니다.")
}

func printActivityEffects(name: String, bodyCondition: BodyCondition) {
    print("<<\(name)을(를) 시작합니다>>")
    print("상체근력이 \(bodyCondition.upperBodyStrength) 상승합니다.")
    print("하체근력이 \(bodyCondition.lowerBodyStrength) 상승합니다.")
    print("근지구력이 \(bodyCondition.muscularEndurance) 상승합니다.")
    print("피로도가 \(bodyCondition.fatigue) 상승합니다.")
    print("--------------")
}

var myBodyCondition = BodyCondition(upperBodyStrength: 100, lowerBodyStrength: 50, muscularEndurance: 50, fatigue: 0)

print("<<윗몸일으키기를(을) 시작합니다>>")
sitUp.action(&myBodyCondition)
print("--------------")
myBodyCondition.checkBodyCondition()
print("--------------")
