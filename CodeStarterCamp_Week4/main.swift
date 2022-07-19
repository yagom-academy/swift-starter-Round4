//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let gundy: BodyCondition = .init(name: "건디")

let sitUp: Activity = .init(name: "윗몸일으키기", action: {
    $0.upperBodyStrength += sitUp.growth(minimum: 10, maximum: 20, current: $0.upperBodyStrength)
    $0.fatigue += sitUp.changeFatigue(minimum: 10, maximum: 20, current: $0.fatigue)
})

let squat: Activity = .init(name: "스쿼트", action: {
    $0.lowerBodyStrength += squat.growth(minimum: 20, maximum: 30, current: $0.lowerBodyStrength)
    $0.fatigue += squat.changeFatigue(minimum: 10, maximum: 20, current: $0.fatigue)
})

let longDistanceRunning: Activity = .init(name: "오래달리기", action: {
    $0.upperBodyStrength += longDistanceRunning.growth(minimum: 5, maximum: 10, current: $0.upperBodyStrength)
    $0.lowerBodyStrength += longDistanceRunning.growth(minimum: 5, maximum: 10, current: $0.lowerBodyStrength)
    $0.muscularEndurance += longDistanceRunning.growth(minimum: 20, maximum: 30, current: $0.muscularEndurance / 2)
    $0.fatigue += longDistanceRunning.changeFatigue(minimum: 20, maximum: 30, current: $0.fatigue)
})

let activeRest: Activity = .init(name: "동적휴식", action: {
    $0.fatigue += activeRest.changeFatigue(minimum: 5, maximum: 10, rest: true, current: $0.fatigue)
})

gundy.doActivity(sitUp)
gundy.doActivity(squat)
gundy.doActivity(longDistanceRunning)
gundy.doActivity(activeRest)
gundy.fatigue = 100
gundy.doActivity(sitUp)

