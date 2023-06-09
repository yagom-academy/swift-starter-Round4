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
    print("<<윗몸일으키기를 시작합니다>>")
    condition.updateBodyCondition(upperBodyStrength: getStats(10, 20), fatigueLevel: getStats(10, 20))
    }

let 스쿼트 = Activity(name: "스쿼트") { condition in
    print("<<스쿼트를 시작합니다>>")
    condition.updateBodyCondition(lowerBodyStrength: getStats(20, 30), fatigueLevel: getStats(10, 20))
}

let 오래달리기 = Activity(name: "오래달리기") { condition in
    print("<<오래달리기를 시작합니다>>")
    condition.updateBodyCondition(upperBodyStrength: getStats(5, 10), lowerBodyStrength: getStats(5, 10), muscularEdurance: getStats(20, 30), fatigueLevel: getStats(20, 30))
}

let 동적휴식 = Activity(name: "동적휴식") { condition in
    print("<<동적휴식을 시작합니다>>")
    condition.updateBodyCondition(fatigueLevel: getStats(-10, -5))
}

func getStats(_ start: Int, _ end: Int) -> Int {
    Int.random(in: start...end)
}

// MARK: - 실행
var myBodyCondition = BodyCondition(upperBodyStrength: 10, lowerBodyStrength: 20, muscularEndurance: 20, fatigueLevel: 0)

윗몸일으키기.action(myBodyCondition)
동적휴식.action(myBodyCondition)
스쿼트.action(myBodyCondition)
