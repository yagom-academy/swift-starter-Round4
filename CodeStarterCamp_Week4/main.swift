//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigAbility: Int
    
    func presentCondition() {
        print("""
            --------------
            현재의 컨디션은 다음과 같습니다.
            상체근력: \(upperBodyStrength)
            하체근력: \(lowerBodyStrength)
            근지구력: \(muscularEndurance)
            피로도: \(fatigAbility)
            """)
    }
}

struct Exercise {
    let name: String
    let action: () -> Void
}

var bodyCondition: BodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigAbility: 0)

let 윗몸일으키기: Exercise = Exercise(name: "윗몸일으키기", action: {
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigAbility += Int.random(in: 10...20)
})

let 스쿼트: Exercise = Exercise(name: "스쿼트", action: {
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigAbility += Int.random(in: 10...20)
})

let 오래달리기: Exercise = Exercise(name: "오래달리기", action: {
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigAbility += Int.random(in: 20...30)
})

let 동적휴식: Exercise = Exercise(name: "동적휴식", action: {
    bodyCondition.fatigAbility -= Int.random(in: 5...10)
})
