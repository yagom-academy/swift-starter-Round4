//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var name: String
    var 상체근력: Int
    var 하체근력: Int
    var 근지구력: Int
    var 피로도: Int
    
    var activity: Activity? {
        didSet {
            guard let activityName = activity?.name else {
                print("활동 이름값이 없습니다.")
                return
            }
            print("<<\(name)이(가) \(activityName)을(를) 시작합니다>>")
            activity?.action(self)
        }
    }
    
    init(name: String, 상체근력: Int = 0, 하체근력: Int = 0, 근지구력: Int = 0, 피로도: Int = 0) {
        self.name = name
        self.상체근력 = 상체근력
        self.하체근력 = 하체근력
        self.근지구력 = 근지구력
        self.피로도 = 피로도
    }
    
    func printCondition() {
        print("--------------")
        print("현재 컨디션은 다음과 같습니다.")
        print("상체근력: \(상체근력)")
        print("하체근력: \(하체근력)")
        print("근지구력: \(근지구력)")
        print("피로도: \(피로도)")
        print("--------------")
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기") { (bodyCondition: BodyCondition) -> Void in
    
    let 상체근력 = Int.random(in: 10...20)
    let 피로도 = Int.random(in: 10...20)
    
    print("상체근력이 \(상체근력) 상승합니다.")
    print("피로도가 \(피로도) 상승합니다.")
    
    bodyCondition.상체근력 += 상체근력
    bodyCondition.피로도 += 피로도
}

let 스쿼트: Activity = Activity(name: "스쿼트") { (bodyCondition: BodyCondition) -> Void in
    
    let 하체근력 = Int.random(in: 20...30)
    let 피로도 = Int.random(in: 10...20)
    
    print("하체근력이 \(하체근력) 상승합니다.")
    print("피로도가 \(피로도) 상승합니다.")
    
    bodyCondition.하체근력 += 하체근력
    bodyCondition.피로도 += 피로도
}

let 오래달리기: Activity = Activity(name: "오래달리기") { (bodyCondition: BodyCondition) -> Void in
    
    let 근지구력 = Int.random(in: 20...30)
    let 상체근력 = Int.random(in: 5...10)
    let 하체근력 = Int.random(in: 5...10)
    let 피로도 = Int.random(in: 20...30)
    
    print("근지구력이 \(근지구력) 상승합니다.")
    print("상체근력이 \(상체근력) 상승합니다.")
    print("하체근력이 \(하체근력) 상승합니다.")
    print("피로도가 \(피로도) 상승합니다.")
    
    bodyCondition.근지구력 += 근지구력
    bodyCondition.상체근력 += 상체근력
    bodyCondition.하체근력 += 하체근력
    bodyCondition.피로도 += 피로도
}

let 동적휴식: Activity = Activity(name: "동적휴식") {(bodyCondition: BodyCondition) -> Void in
    
    let 피로도 = Int.random(in: 5...10)
    
    print("피로도가 \(피로도) 감소합니다.")
    
    bodyCondition.피로도 -= 피로도
}

let 스트레칭: Activity = Activity(name: "스트레칭") {(bodyCondition: BodyCondition) -> Void in
    
    let 상체근력 = Int.random(in: 1...5)
    let 하체근력 = Int.random(in: 1...5)
    let 피로도 = Int.random(in: 1...5)
    
    print("상체근력이 \(상체근력) 상승합니다.")
    print("하체근력이 \(하체근력) 상승합니다.")
    print("피로도가 \(피로도) 감소합니다.")
    
    bodyCondition.상체근력 += 상체근력
    bodyCondition.하체근력 += 하체근력
    bodyCondition.피로도 -= 피로도
}

var dasanBodyCondition = BodyCondition(name: "다산")
dasanBodyCondition.activity = 윗몸일으키기
dasanBodyCondition.printCondition()

var namuBodyCondition = BodyCondition(name: "나무", 상체근력: 50, 하체근력: 50, 근지구력: 50, 피로도: 10)
namuBodyCondition.activity = 스트레칭
namuBodyCondition.printCondition()


