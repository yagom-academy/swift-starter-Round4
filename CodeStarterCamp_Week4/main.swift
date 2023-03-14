//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var upperStrength: Int {
        didSet {
            printChangedCondition(of: "상체근력", from: oldValue, to: upperStrength)
        }
    }
    var lowerStrength: Int {
        didSet {
            printChangedCondition(of: "하체근력", from: oldValue, to: lowerStrength)
        }
    }
    var endurance: Int {
        didSet {
            printChangedCondition(of: "근지구력", from: oldValue, to: endurance)
        }
    }
    var fatigue: Int {
        didSet {
            printChangedCondition(of: "피로도", from: oldValue, to: fatigue)
        }
    }
    
    init(upperStrength: Int, lowerStrength: Int, endurance: Int, fatigue: Int) {
        self.upperStrength = upperStrength
        self.lowerStrength = lowerStrength
        self.endurance = endurance
        self.fatigue = fatigue
    }
    
    func exercise(_ activity: Activity) {
        print("<<\(activity.name)을(를) 시작합니다>>")
        activity.action(self)
        self.checkBodyConditionStatus()
    }
    
    func printChangedCondition(of bodyPart: String, from oldStatus: Int, to newStatus: Int) {
        if oldStatus > newStatus {
            print("\(bodyPart)이(가) \(oldStatus - newStatus) 감소합니다.")
        } else {
            print("\(bodyPart)이(가) \(newStatus - oldStatus) 증가합니다.")
        }
    }
    
    func checkBodyConditionStatus() {
        let currentBodyStatus: String = """
        --------------
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(self.upperStrength)
        하체근력: \(self.lowerStrength)
        근지구력: \(self.endurance)
        피로도: \(self.fatigue)
        --------------
        
        """
        print(currentBodyStatus)
    }
}


struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기") {
    $0.upperStrength += Int.random(in: 10...20)
    $0.fatigue += Int.random(in: 10...20)
}
let squat: Activity = Activity(name: "스쿼트") {
    $0.lowerStrength += Int.random(in: 20...30)
    $0.fatigue += Int.random(in: 10...20)
}
let running: Activity = Activity(name: "오래달리기") {
    $0.endurance += Int.random(in: 20...30)
    $0.upperStrength += Int.random(in: 5...10)
    $0.lowerStrength += Int.random(in: 5...10)
    $0.fatigue += Int.random(in: 20...30)
}
let activeRest: Activity = Activity(name: "동적휴식") {
    $0.fatigue -= Int.random(in: 5...10)
}
let plank: Activity = Activity(name: "플랭크") {
    $0.upperStrength += Int.random(in: 10...20)
    $0.fatigue += Int.random(in: 10...20)
}



let myBody = BodyCondition(upperStrength: 100, lowerStrength: 80, endurance: 80, fatigue: 0)
myBody.exercise(squat)
myBody.exercise(sitUp)
myBody.exercise(plank)
myBody.exercise(activeRest)
myBody.exercise(running)
myBody.exercise(activeRest)
myBody.exercise(sitUp)

