//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let sitUp: Activity = Activity(name: "윗몸일으키기", action: {
    $0.upperBodyStrength += Int.random(in: 10...20)
    $0.fatigue += Int.random(in: 10...20)
})

let squat: Activity = Activity(name: "스쿼트", action: {
    $0.lowerBodyStrength += Int.random(in: 20...30)
    $0.fatigue += Int.random(in: 10...20)
})

let longRun: Activity = Activity(name: "오래달리기", action: {
    $0.muscularEndurance += Int.random(in: 20...30)
    $0.upperBodyStrength += Int.random(in: 5...10)
    $0.lowerBodyStrength += Int.random(in: 5...10)
    $0.fatigue += Int.random(in: 20...30)
})

let dynamicRest: Activity = Activity(name: "동적휴식", action: {
    $0.fatigue -= Int.random(in: 5...10)
})

let hangBoard: Activity = Activity(name: "행보드", action: {
    $0.upperBodyStrength += Int.random(in: 10...20)
    $0.muscularEndurance += Int.random(in: 10...20)
    $0.fatigue += Int.random(in: 10...20)
})

var bmoCondition = BodyCondition(
    upperBodyStrength: 20,
    lowerBodyStrength: 10,
    muscularEndurance: 30,
    fatigue: 15
)

func exercise(_ activity: Activity, bodyConditon: inout BodyCondition) {
    print("<<\(activity.name)을(를) 시작합니다>>")
    activity.action(&bodyConditon)
    bodyConditon.printCurrentBodyCondition()
}

exercise(squat, bodyConditon: &bmoCondition)
exercise(hangBoard, bodyConditon: &bmoCondition)
exercise(dynamicRest, bodyConditon: &bmoCondition)
