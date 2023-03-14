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

let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    bodyCondition.upperBody += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let squat: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    bodyCondition.lowerBody += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let longRun: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    bodyCondition.endurance += Int.random(in: 20...30)
    bodyCondition.upperBody += Int.random(in: 5...10)
    bodyCondition.lowerBody += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
})

let activeRest: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    bodyCondition.fatigue -= Int.random(in: 5...10)
})
