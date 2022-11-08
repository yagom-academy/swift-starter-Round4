//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: BodyCondition Type
class BodyCondition {
    var 상체근력: Int {
        didSet (oldValue) {
            if oldValue < self.상체근력 {
                print("상체근력이 \(self.상체근력 - oldValue)만큼 상승합니다.")
            } else {
                print("상체근력이 \(oldValue - self.상체근력)만큼 하강합니다.")
            }
        }
    }
    
    var 하체근력: Int {
        didSet (oldValue) {
            if oldValue < self.하체근력 {
                print("하체근력이 \(self.하체근력 - oldValue)만큼 상승합니다.")
            } else {
                print("하체근력이 \(oldValue - self.하체근력)만큼 하강합니다.")
            }
        }
    }
    
    var 근지구력: Int {
        didSet (oldValue) {
            if oldValue < self.근지구력 {
                print("근지구력 \(self.근지구력 - oldValue)만큼 상승합니다.")
            } else {
                print("근지구력 \(oldValue - self.근지구력)만큼 하강합니다.")
            }
        }
    }
    
    var 피로도: Int {
        didSet (oldValue) {
            if oldValue < self.피로도 {
                print("피로도 \(self.피로도 - oldValue)만큼 상승합니다.")
            } else {
                print("피로도 \(oldValue - self.피로도)만큼 하강합니다.")
            }
        }
    }
    
    func printCurrentBodyCondition() {
        print("""
        --------------
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(self.상체근력)
        하체근력: \(self.하체근력)
        근지구력: \(self.근지구력)
        피로도: \(self.피로도)
        -------------- \n
        """)
    }
    
    init(상체근력: Int = 20, 하체근력: Int = 20, 근지구력: Int = 20, 피로도: Int = 20) {
        self.상체근력 = 상체근력
        self.하체근력 = 하체근력
        self.근지구력 = 근지구력
        self.피로도 = 피로도
    }
}

// MARK: Activity Type
struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    print("<<\(윗몸일으키기.name) 을(를) 시작합니다>>")
    bodyCondition.상체근력 += Int.random(in: 10...20)
    bodyCondition.피로도 += Int.random(in: 10...20)
    bodyCondition.printCurrentBodyCondition()
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<\(스쿼트.name) 을(를) 시작합니다>>")
    bodyCondition.하체근력 += Int.random(in: 20...30)
    bodyCondition.피로도 += Int.random(in: 10...20)
    bodyCondition.printCurrentBodyCondition()
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<\(오래달리기.name) 을(를) 시작합니다>>")
    bodyCondition.상체근력 += Int.random(in: 5...10)
    bodyCondition.하체근력 += Int.random(in: 5...10)
    bodyCondition.근지구력 += Int.random(in: 20...30)
    bodyCondition.피로도 += Int.random(in: 20...30)
    bodyCondition.printCurrentBodyCondition()
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<\(동적휴식.name) 을(를) 시작합니다>>")
    bodyCondition.피로도 -= Int.random(in: 10...20)
    bodyCondition.printCurrentBodyCondition()
})

let 정적휴식: Activity = Activity(name: "정적휴식", action: { bodyCondition in
    print("<<\(정적휴식.name) 을(를) 시작합니다>>")
    bodyCondition.상체근력 -= Int.random(in: 5...10)
    bodyCondition.하체근력 -= Int.random(in: 5...10)
    bodyCondition.근지구력 -= Int.random(in: 5...10)
    bodyCondition.피로도 -= Int.random(in: 30...40)
    bodyCondition.printCurrentBodyCondition()
})

//MARK: 출력
var muri = BodyCondition()
윗몸일으키기.action(muri)
오래달리기.action(muri)
정적휴식.action(muri)
스쿼트.action(muri)
오래달리기.action(muri)
동적휴식.action(muri)
