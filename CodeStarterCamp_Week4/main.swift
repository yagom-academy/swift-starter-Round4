//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

class BodyCondition {
    var upperBodyStrength: Int {
        willSet {
            print("상체근력이 \(newValue - upperBodyStrength) 상승합니다.")
        }
    }
    var lowerBodyStrength: Int {
        willSet {
            print("하체근력이 \(newValue - lowerBodyStrength) 상승합니다.")
        }
    }
    var muscularEndurance: Int {
        willSet {
            print("근지구력이 \(newValue - muscularEndurance) 상승합니다.")
        }
    }
    var fatigue: Int {
        willSet {
            if newValue > fatigue {
                print("피로도가 \(newValue - fatigue) 상승합니다.")
            } else {
                print("피로도가 \(fatigue - newValue) 하락합니다.")
            }
        }
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    
    func checkCurrent() {
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
}

let sitUp = Activity(name: "윗몸일으키기") { bodyCondition in
    print("<<윗몸일으키기를 시작합니다>>")
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
    bodyCondition.checkCurrent()
}

let squat = Activity(name: "스쿼트") { bodyCondition in
    print("<<스쿼트를 시작합니다>>")
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
    bodyCondition.checkCurrent()
}

let running = Activity(name: "오래달리기") { bodyCondition in
    print("<<오래달리기를 시작합니다>>")
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
    bodyCondition.checkCurrent()
}

let dyanamicRest = Activity(name: "동적휴식") { bodyCondition in
    print("<<동적휴식를 시작합니다>>")
    bodyCondition.fatigue -= Int.random(in: 5...10)
    bodyCondition.checkCurrent()
}

let pullUp = Activity(name: "턱걸이") { bodyCondition in
    print("<<턱걸이를 시작합니다>>")
    bodyCondition.upperBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
    bodyCondition.checkCurrent()
}

let pushUp = Activity(name: "팔굽혀펴기") { bodyCondition in
    print("<<팔굽혀펴기를 시작합니다>>")
    bodyCondition.upperBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
    bodyCondition.checkCurrent()
}

let bodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)
running.action(bodyCondition)
