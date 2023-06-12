//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: Activity 정의
let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기") { condition in
    print("<<\(윗몸일으키기.name)을(를) 시작합니다>>")
    condition.increaseUpperBodyCondition(by: getRandomStats(range: 10...20))
    condition.increaseFatigueLevel(by: getRandomStats(range: 10...20))
    condition.showMyBodyCondition()
}

let 스쿼트 = Activity(name: "스쿼트") { condition in
    print("<<\(스쿼트.name)을(를) 시작합니다>>")
    condition.increaseLowerBodyCondition(by: getRandomStats(range: 20...30))
    condition.increaseFatigueLevel(by: getRandomStats(range: 10...20))
    condition.showMyBodyCondition()
}

let 오래달리기 = Activity(name: "오래달리기") { condition in
    print("<<\(오래달리기.name)을(를) 시작합니다>>")
    condition.increaseUpperBodyCondition(by: getRandomStats(range: 5...10))
    condition.increaseLowerBodyCondition(by: getRandomStats(range: 5...10))
    condition.increaseMuscularEduranceCondition(by: getRandomStats(range: 20...30))
    condition.increaseFatigueLevel(by: getRandomStats(range: 20...30))
    condition.showMyBodyCondition()
}

let 동적휴식 = Activity(name: "동적휴식") { condition in
    print("<<\(동적휴식.name)을(를) 시작합니다>>")
    condition.increaseFatigueLevel(by: getRandomStats(range: -10 ... -5))
    condition.showMyBodyCondition()
}

func getRandomStats(range: ClosedRange<Int>) -> Int {
    Int.random(in: range)
}

// MARK: - 실행
var myBodyCondition = BodyCondition(upperBodyStrength: 10, lowerBodyStrength: 20, muscularEndurance: 20, fatigueLevel: 0)

윗몸일으키기.action(myBodyCondition)
동적휴식.action(myBodyCondition)
스쿼트.action(myBodyCondition)
