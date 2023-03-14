//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let tomBodyCondition = BodyCondition(upperBodyStrength: 40, lowerBodyStrength: 40, muscularEndurance: 40, fatigue: 0)
let tomActivity = Activity(name: "") { bodyCondition in }


let sitUp = Activity(name: "윗몸일으키기", action: { bodyCondition in
    let nowUpperBodyStrength = bodyCondition.upperBodyStrength
    let nowFatigue = bodyCondition.fatigue
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
    print("상체근력이 \(abs(nowUpperBodyStrength - tomBodyCondition.upperBodyStrength)) 상승합니다.")
    print("피로도가 \(abs(nowFatigue - tomBodyCondition.fatigue)) 상승합니다.")
})

let squat = Activity(name: "스쾃트", action: { bodyCondition in
    let nowLowerBodyStrength = bodyCondition.lowerBodyStrength
    let nowFatigue = bodyCondition.fatigue
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
    print("하체근력이 \(abs(nowLowerBodyStrength - tomBodyCondition.lowerBodyStrength)) 상승합니다.")
    print("피로도가 \(abs(nowFatigue - tomBodyCondition.fatigue)) 상승합니다.")
})

let longRun = Activity(name: "오래달리기", action: { bodyCondition in
    let nowUpperBodyStrength = bodyCondition.upperBodyStrength
    let nowLowerBodyStrength = bodyCondition.lowerBodyStrength
    let nowMuscularEndurance = bodyCondition.muscularEndurance
    let nowFatigue = bodyCondition.fatigue
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
    print("상체근력이 \(abs(nowUpperBodyStrength - tomBodyCondition.upperBodyStrength)) 상승합니다.")
    print("하체근력이 \(abs(nowLowerBodyStrength - tomBodyCondition.lowerBodyStrength)) 상승합니다.")
    print("근지구력이 \(abs(nowMuscularEndurance - tomBodyCondition.muscularEndurance)) 상승합니다.")
    print("피로도가 \(abs(nowFatigue - tomBodyCondition.fatigue)) 상승합니다.")
})

let dynamicResting = Activity(name: "동적휴식", action: { bodyCondition in
    let nowFatigue = bodyCondition.fatigue
    bodyCondition.fatigue -= Int.random(in: 5...10)
    print("피로도가 \(abs(nowFatigue - tomBodyCondition.fatigue)) 감소합니다.")
})

tomActivity.exerciseStart(activity: squat, bodyCondition: tomBodyCondition)
tomActivity.exerciseStart(activity: sitUp, bodyCondition: tomBodyCondition)
tomBodyCondition.check(tomBodyCondition)




