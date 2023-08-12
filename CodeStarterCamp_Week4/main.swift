//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//


//step1

class BodyCondition {
    var upperBodyStrength = 0 {
        didSet {
            print("상체근력이 \(upperBodyStrength - oldValue) 상승합니다.")
        }
    }
    var lowerBodyStrength = 0 {
        didSet {
            print("하체근력이 \(lowerBodyStrength - oldValue) 상승합니다.")
        }
    }
    var muscularEndurance = 0 {
        didSet {
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    var fatigue = 0 {
        didSet {
            if oldValue > fatigue {
                print("피로도가 \(oldValue - fatigue) 하락합니다.")
            }else {
                print("피로도가 \(fatigue - oldValue) 상승합니다.")
            }
        }
    }
    
    func checkCondition() {
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

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { BodyCondition in
    print("<<윗몸일으키기을(를) 시작합니다>>")
    BodyCondition.upperBodyStrength += Int.random(in: 10...20)
    BodyCondition.fatigue += Int.random(in: 10...20)
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: { BodyCondition in
    print("<<스쿼트을(를) 시작합니다>>")
    BodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    BodyCondition.fatigue += Int.random(in: 10...20)
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: { BodyCondition in
    print("<<오래달리기을(를) 시작합니다>>")
    BodyCondition.muscularEndurance += Int.random(in: 20...30)
    BodyCondition.upperBodyStrength += Int.random(in: 5...10)
    BodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    BodyCondition.fatigue += Int.random(in: 20...30)
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { BodyCondition in
    print("<<동적휴식을(를) 시작합니다>>")
    BodyCondition.fatigue -= Int.random(in: 5...10)
})

var me: BodyCondition = BodyCondition()
윗몸일으키기.action(me)
동적휴식.action(me)
me.checkCondition()
