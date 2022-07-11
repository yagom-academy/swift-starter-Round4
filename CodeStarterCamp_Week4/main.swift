//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var 상체근력: Int = 0
    var 하체근력: Int = 0
    var 근지구력: Int = 0
    var 피로도: Int = 0
    
    func 상체근력강화(_ num: Int) {
        상체근력 += num
    }
    func 하체근력강화(_ num: Int) {
        하체근력 += num
    }
    func 근지구력강화(_ num: Int) {
        근지구력 += num
    }
    func 피로도변경(_ num: Int) {
        피로도 += num
    }
    func printCondition() {
        print("""
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(상체근력)
        하체근력: \(하체근력)
        근지구력: \(근지구력)
        피로도: \(피로도)
        --------------
        """)
    }
}

struct Activity {
        let name: String
        let action: (BodyCondition, String) -> Void
}

var bodyCondition = BodyCondition()

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기",
    action: { (bodyCondition: BodyCondition, name: String) in
    
    let randomNumbers = [Int.random(in: 10...20), Int.random(in: 10...20)]
    bodyCondition.상체근력강화(randomNumbers[0])
    bodyCondition.피로도변경(randomNumbers[1])
    
    print("""
    <<\(name)을(를) 시작합니다>>
    상체근력이 \(randomNumbers[0]) 상승합니다.
    피로도가 \(randomNumbers[1]) 상승합니다.
    --------------
    """)
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: { (bodyCondition: BodyCondition, name: String) in
    
    let randomNumbers = [Int.random(in: 20...30), Int.random(in: 10...20)]
    bodyCondition.하체근력강화(randomNumbers[0])
    bodyCondition.피로도변경(randomNumbers[1])
    
    print("""
    <<\(name)을(를) 시작합니다>>
    하체근력이 \(randomNumbers[0]) 상승합니다.
    피로도가 \(randomNumbers[1]) 상승합니다.
    --------------
    """)
})

let 오래달리기: Activity = Activity(name: "윗몸일으키기", action: { (bodyCondition: BodyCondition, name: String) in
    
    let randomNumbers = [Int.random(in: 20...30), Int.random(in: 5...10), Int.random(in: 5...10), Int.random(in: 20...30)]
    bodyCondition.근지구력강화(randomNumbers[0])
    bodyCondition.상체근력강화(randomNumbers[1])
    bodyCondition.하체근력강화(randomNumbers[2])
    bodyCondition.피로도변경(randomNumbers[3])
    
    print("""
    <<\(name)을(를) 시작합니다>>
    근지구력이 \(randomNumbers[0]) 상승합니다.
    상체근력이 \(randomNumbers[1]) 상승합니다.
    하체근력이 \(randomNumbers[2]) 상승합니다.
    피로도가 \(randomNumbers[3]) 상승합니다.
    --------------
    """)
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { (bodyCondition: BodyCondition, name: String) in
    
    let randomNumber = Int.random(in: (-10)...(-5))
    bodyCondition.피로도변경(randomNumber)
    
    print("""
    <<\(name)을(를) 시작합니다>>
    피로도가 \(abs(randomNumber)) 하락합니다.
    --------------
    """)
})

윗몸일으키기.action(bodyCondition, 윗몸일으키기.name)
스쿼트.action(bodyCondition,스쿼트.name)
오래달리기.action(bodyCondition,오래달리기.name)
동적휴식.action(bodyCondition, 동적휴식.name)
bodyCondition.printCondition()
