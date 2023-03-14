//
//  step1.swift
//  CodeStarterCamp_Week4
//
//  Created by MARY on 2023/03/14.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp = Activity(name: "윗몸일으키기", action: { bodyCondition in
    print("<<윗몸일으키기 을(를) 시작합니다>>")
    bodyCondition.upperBody += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let squat = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<스쿼트 을(를) 시작합니다>>")
    bodyCondition.lowerBody += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let longRun = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<오래달리기 을(를) 시작합니다>>")
    bodyCondition.endurance += Int.random(in: 20...30)
    bodyCondition.upperBody += Int.random(in: 5...10)
    bodyCondition.lowerBody += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
})

let activeRest = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<동적휴식 을(를) 시작합니다>>")
    bodyCondition.fatigue -= Int.random(in: 5...10)
})
