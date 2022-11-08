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
            상체근력 = correctChangedValue(varName: "상체근력", oldValue: oldValue, currentValue: 상체근력)
            monitorChanges(varName: "상체근력", oldValue: oldValue, correctedValue: 상체근력)
        }
    }
    var 하체근력: Int {
        didSet(oldValue) {
            하체근력 = correctChangedValue(varName: "하체근력", oldValue: oldValue, currentValue: 하체근력)
            monitorChanges(varName: "하체근력", oldValue: oldValue, correctedValue: 하체근력)
        }
    }
    var 근지구력: Int {
        didSet(oldValue) {
            근지구력 = correctChangedValue(varName: "근지구력", oldValue: oldValue, currentValue: 근지구력)
            monitorChanges(varName: "근지구력", oldValue: oldValue, correctedValue: 근지구력)
        }
    }
    var 피로도: Int {
        didSet(oldValue) {
            피로도 = correctChangedValue(varName: "피로도", oldValue: oldValue, currentValue: 피로도)
            monitorChanges(varName: "피로도", oldValue: oldValue, correctedValue: 피로도)
        }
    }
    
    func correctChangedValue (varName: String, oldValue: Int, currentValue: Int) -> Int {
        var correctedValue: Int
        
        if currentValue < 0 {
            correctedValue = 0
        } else {
            correctedValue = currentValue
        }

        return correctedValue
    }
    
    func monitorChanges (varName: String, oldValue: Int, correctedValue: Int) {
        print("\(varName)", terminator: "")
        
        if varName.hasSuffix("력") {
            print("이 ", terminator: "")
        } else {
            print("가 ", terminator: "")
        }
        
        if correctedValue <= oldValue {
            print("\(oldValue - correctedValue) 하락합니다.")
        } else {
            print("\(correctedValue - oldValue) 상승합니다.")
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
    bodyCondition.상체근력 += Int.random(in: 10...20)
    bodyCondition.피로도 += Int.random(in: 10...20)
})
let 스쿼트: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<\(스쿼트.name)을(를) 시작합니다>>")
    bodyCondition.하체근력 += Int.random(in: 20...30)
    bodyCondition.피로도 += Int.random(in: 10...20)
})
let 오래달리기: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<\(오래달리기.name)을(를) 시작합니다>>")
    bodyCondition.상체근력 += Int.random(in: 5...10)
    bodyCondition.하체근력 += Int.random(in: 5...10)
    bodyCondition.근지구력 += Int.random(in: 20...30)
    bodyCondition.피로도 += Int.random(in: 20...30)
})
let 동적휴식: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<\(동적휴식.name)을(를) 시작합니다>>")
    bodyCondition.피로도 -= Int.random(in: 5...10)
})
let 동적음주: Activity = Activity(name: "동적음주", action: { bodyCondition in
    print("<<\(동적음주.name)을(를) 시작합니다>>")
    bodyCondition.상체근력 -= Int.random(in: 5...10)
    bodyCondition.하체근력 -= Int.random(in: 20...30)
    bodyCondition.근지구력 -= Int.random(in: 5...10)
    bodyCondition.피로도 += Int.random(in: 10...20)
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
