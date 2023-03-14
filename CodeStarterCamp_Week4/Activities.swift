//
//  Activities.swift
//  CodeStarterCamp_Week4
//
//  Created by minsong kim on 2023/03/14.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기") { bodyCondition in
    print("<<\(윗몸일으키기.name)을(를) 시작합니다.>>")
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigability += Int.random(in: 10...20)
    bodyCondition.conditionCheck()
}

let 스쿼트: Activity = Activity(name: "스쿼트") { bodyCondition in
    print("<<\(스쿼트.name)을(를) 시작합니다.>>")
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigability += Int.random(in: 10...20)
    bodyCondition.conditionCheck()
}

let 오래달리기: Activity = Activity(name: "오래달리기") { bodyCondition in
    print("<<\(오래달리기.name)을(를) 시작합니다.>>")
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.fatigability += Int.random(in: 20...30)
    bodyCondition.conditionCheck()
}

let 동적휴식: Activity = Activity(name: "동적휴식") { bodyCondition in
    print("<<\(동적휴식.name)을(를) 시작합니다.>>")
    guard bodyCondition.fatigability >= 0 else {
        print("현재 피로도가 0 입니다.")
        return
    }
    for index in 1...10 {
        if bodyCondition.fatigability <= index {
            bodyCondition.fatigability -= Int.random(in: 1...index)
            break
        }
    }
    bodyCondition.conditionCheck()
}

