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
    sitUp.upperGrowth(condition: $0, min: 10, max: 20)
    sitUp.changeFatigue(condition: $0, min: 10, max: 20)
})

let squat: Activity = .init(name: "스쿼트", action: {
    squat.lowerGrowth(condition: $0, min: 20, max: 30)
    squat.changeFatigue(condition: $0, min: 10, max: 20)
})

let longDistanceRunning: Activity = .init(name: "오래달리기", action: {
    longDistanceRunning.upperGrowth(condition: $0, min: 5, max: 10)
    longDistanceRunning.lowerGrowth(condition: $0, min: 5, max: 10)
    longDistanceRunning.enduranceGrowth(condition: $0, min: 20, max: 30)
    longDistanceRunning.changeFatigue(condition: $0, min: 20, max: 30)
})

let activeRest: Activity = .init(name: "동적휴식", action: {
    activeRest.changeFatigue(condition: $0, min: 5, max: 10, rest: true)
})

gundy.doActivity(sitUp)
gundy.doActivity(squat)
gundy.doActivity(longDistanceRunning)
gundy.doActivity(activeRest)
gundy.fatigue = 100
gundy.doActivity(sitUp)

