//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int = 0 {
        didSet {
            print("상체근력이 \(upperBodyStrength - oldValue) 상승합니다.")
        }
    }
    var lowerBodyStrength: Int = 0 {
        didSet {
            print("하체근력이 \(lowerBodyStrength - oldValue) 상승합니다.")
        }
    }
    var muscularEndurance: Int = 0 {
        didSet {
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    var fatigue: Int = 0 {
        didSet {
            if fatigue - oldValue > 0 {
                print("피로도가 \(fatigue - oldValue) 상승합니다.")
            } else {
                print("피로도가 \(oldValue - fatigue) 하락합니다.")
                if fatigue <= 0 {
                    fatigue = 0
                }
            }
        }
    }
    
    func checkBody() {
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

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기") {
    print("<<윗몸일으키기을(를) 시작합니다>>")
    $0.upperBodyStrength += Int.random(in: 10...20)
    $0.fatigue += Int.random(in: 10...20)
    $0.checkBody()
}

let 스쿼트: Activity = Activity(name: "스쿼트") {
    print("<<스쿼트을(를) 시작합니다>>")
    $0.lowerBodyStrength += Int.random(in: 20...30)
    $0.fatigue += Int.random(in: 10...20)
    $0.checkBody()
}

let 오래달리기: Activity = Activity(name: "오래달리기") {
    print("<<오래달리기을(를) 시작합니다>>")
    $0.muscularEndurance += Int.random(in: 20...30)
    $0.upperBodyStrength += Int.random(in: 5...10)
    $0.lowerBodyStrength += Int.random(in: 5...10)
    $0.fatigue += Int.random(in: 20...30)
    $0.checkBody()
}

let 동적휴식: Activity = Activity(name: "동적휴식") {
    print("<<동적휴식을(를) 시작합니다>>")
    $0.fatigue -= Int.random(in: 5...10)
    $0.checkBody()
}

let 벤치프레스: Activity = Activity(name: "벤치프레스") {
    print("<<벤치프레스을(를) 시작합니다>>")
    $0.upperBodyStrength += Int.random(in: 20...30)
    $0.fatigue += Int.random(in: 10...20)
    $0.checkBody()
}

let 온라인게임: Activity = Activity(name: "온라인게임") {
    print("<<온라인게임을(를) 시작합니다>>")
    $0.fatigue += Int.random(in: 15...25)
    $0.checkBody()
}

var HotTtu: BodyCondition = BodyCondition()
동적휴식.action(HotTtu)
