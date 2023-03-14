//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/* Step 1: 활동을 만들어 진행해보자! */
let bodyCondition = BodyCondition(upperBodyStrength: 100, lowerBodyStrength: 80, muscularEndurance: 80, fatigue: 0)

let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let squat: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let longRun: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
})

let dynamicRest: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    if bodyCondition.fatigue > 0 {
        var changeStats = Int.random(in: 5...10)
        if bodyCondition.fatigue < changeStats {
            changeStats = bodyCondition.fatigue
        }
        bodyCondition.fatigue -= changeStats
    } else {
        print("피로도가 0 입니다.")
    }
})

let lunge: Activity = Activity(name: "런지", action: { bodyCondition in
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.muscularEndurance += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

sitUp.doExercise(bodyCondition)
lunge.doExercise(bodyCondition)
dynamicRest.doExercise(bodyCondition)
