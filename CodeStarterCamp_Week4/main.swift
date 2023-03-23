//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    print("<<윗몸일으키기를 시작합니다>>")
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
    bodyCondition.checkBodyCondition()
})

let squat: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<스쿼트를 시작합니다>>")
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
    bodyCondition.checkBodyCondition()
})

let running: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<오래달리기를 시작합니다>>")
    bodyCondition.muscleEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
    bodyCondition.checkBodyCondition()
})

let rest: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<동적휴식을 시작합니다>>")
    bodyCondition.fatigue -= Int.random(in: 5...10)
    bodyCondition.checkBodyCondition()
})

var dean: BodyCondition = BodyCondition(upperBodyStrength: 20, lowerBodyStrength: 20, muscleEndurance: 30, fatigue: 10)

squat.action(dean)
running.action(dean)
