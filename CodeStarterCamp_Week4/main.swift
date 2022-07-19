//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func buildUpperBodyStrength(_ randomNumber: Int) {
        self.upperBodyStrength += randomNumber
        showIncreasedMessage("상체근력", for: randomNumber)
    }
    func buildLowerBodyStrength(_ randomNumber: Int) {
        self.lowerBodyStrength += randomNumber
        showIncreasedMessage("하체근력", for: randomNumber)
    }
    func buildMuscularEndurance(_ randomNumber: Int) {
        self.muscularEndurance += randomNumber
        showIncreasedMessage("근지구력", for: randomNumber)
    }
    func increaseFatigue(_ randomNumber: Int) {
        self.fatigue += randomNumber
        showIncreasedMessage("피로도", for: randomNumber)
    }
    func reduceFatigue(_ randomNumber: Int) {
        self.fatigue -= randomNumber
        print("피로도가 \(randomNumber) 하락합니다.")
    }
    
    func showIncreasedMessage(_ result: String, for number : Int) {
        print("\(result)이(가) \(number) 상승합니다")
    }
    
    func showCurrentCondition() {
        print("""
------------------------
현재의 컨디션은 다음과 같습니다.
상체근력: \(upperBodyStrength)
하체근력: \(lowerBodyStrength)
근지구력: \(muscularEndurance)
피로도: \(fatigue)
------------------------
""")
    }
}

//활동 타입
struct Activity {
        let name: String
        let action: (BodyCondition) -> Void
}
var myBodyCondition: BodyCondition = BodyCondition(upperBodyStrength: 50, lowerBodyStrength: 50, muscularEndurance: 50, fatigue: 30)

func random(_ from: Int, _ to: Int) -> Int {
    return Int.random(in: from...to)
}
//예시 활동
let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기") {
    $0.buildUpperBodyStrength(random(10, 20))
    $0.increaseFatigue(random(10,20))
}

let 스쿼트: Activity = Activity(name: "스쿼트") {
    $0.buildLowerBodyStrength(random(20, 30))
    $0.increaseFatigue(random(10, 20))
}
let 오래달리기: Activity = Activity(name: "오래달리기") {
    $0.buildMuscularEndurance(random(20, 30))
    $0.buildUpperBodyStrength(random(5, 10))
    $0.buildLowerBodyStrength(random(5, 10))
    $0.increaseFatigue(random(20, 30))
}
let 동적휴식: Activity = Activity(name: "동적휴식") {
    $0.buildLowerBodyStrength(random(5, 10))
}

func workOut(who bodyCondition: BodyCondition , _ act: Activity) {
    print("<<\(act.name)을(를) 시작합니다>>")
    act.action(bodyCondition)
    bodyCondition.showCurrentCondition()
}



workOut(who: myBodyCondition, 윗몸일으키기)
workOut(who: myBodyCondition, 스쿼트)
