//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var 상체근력: Int {
        didSet(oldValue) {
            if 상체근력 - oldValue > 0 {
                print("상체근력이 \(상체근력 - oldValue) 상승합니다.")
            } else {
                if 상체근력 < 0 {
                    상체근력 = 0
                }
                print("상체근력이 \(oldValue - 상체근력) 하락합니다.")
            }
        }
    }
    var 하체근력: Int {
        didSet(oldValue) {
            if 하체근력 - oldValue > 0 {
                print("하체근력이 \(하체근력 - oldValue) 상승합니다.")
            } else {
                if 하체근력 < 0 {
                    하체근력 = 0
                }
                print("하체근력이 \(oldValue - 하체근력) 하락합니다.")
            }
        }
    }
    var 근지구력: Int {
        didSet(oldValue) {
            if 근지구력 - oldValue > 0 {
                print("근지구력이 \(근지구력 - oldValue) 상승합니다.")
            } else {
                if 근지구력 < 0 {
                    근지구력 = 0
                }
                print("근지구력이 \(oldValue - 근지구력) 하락합니다.")
            }
        }
    }
    var 피로도: Int {
        didSet(oldValue) {
            if 피로도 - oldValue > 0 {
                print("피로도가 \(피로도 - oldValue) 상승합니다.")
            } else {
                if 피로도 < 0 {
                    피로도 = 0
                }
                print("피로도가 \(oldValue - 피로도) 하락합니다.")
            }
        }
    }

    func printCurrentCondition () {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(상체근력)")
        print("하체근력: \(하체근력)")
        print("근지구력: \(근지구력)")
        print("피로도: \(피로도)")
        print("--------------")
    }
    
    init (상체근력: Int = 0, 하체근력: Int = 0, 근지구력: Int = 0, 피로도: Int = 0) {
        self.상체근력 = 상체근력
        self.하체근력 = 하체근력
        self.근지구력 = 근지구력
        self.피로도 = 피로도
    }
}

struct Activity {
        let name: String
        let action: (BodyCondition) -> Void
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    print("<<\(윗몸일으키기.name)을(를) 시작합니다>>")
    bodyCondition.상체근력 += Int.random(in: 10..<21)
    bodyCondition.피로도 += Int.random(in: 10..<21)
})
let 스쿼트: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<\(스쿼트.name)을(를) 시작합니다>>")
    bodyCondition.하체근력 += Int.random(in: 20..<31)
    bodyCondition.피로도 += Int.random(in: 10..<21)
})
let 오래달리기: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<\(오래달리기.name)을(를) 시작합니다>>")
    bodyCondition.상체근력 += Int.random(in: 5..<11)
    bodyCondition.하체근력 += Int.random(in: 5..<11)
    bodyCondition.근지구력 += Int.random(in: 20..<31)
    bodyCondition.피로도 += Int.random(in: 20..<31)
})
let 동적휴식: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<\(동적휴식.name)을(를) 시작합니다>>")
    bodyCondition.피로도 -= Int.random(in: 5..<11)
})
let 동적음주: Activity = Activity(name: "동적음주", action: { bodyCondition in
    print("<<\(동적음주.name)을(를) 시작합니다>>")
    bodyCondition.상체근력 -= Int.random(in: 5..<11)
    bodyCondition.하체근력 -= Int.random(in: 20..<31)
    bodyCondition.근지구력 -= Int.random(in: 5..<11)
    bodyCondition.피로도 += Int.random(in: 10..<21)
})


var myBodyCondition: BodyCondition = BodyCondition()

// testing for each action...
윗몸일으키기.action(myBodyCondition)
오래달리기.action(myBodyCondition)
동적휴식.action(myBodyCondition)
동적음주.action(myBodyCondition)
myBodyCondition.printCurrentCondition()

// testing for 피로도 < 0 ...
for _ in 1...10 {
    동적휴식.action(myBodyCondition)
}
myBodyCondition.printCurrentCondition()
