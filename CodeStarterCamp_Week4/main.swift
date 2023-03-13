//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var bodyCondition: BodyCondition = BodyCondition()

let sitUp: Activity = Activity(name: "윗몸일으키기") {
    print("<<윗몸일으키기을(를) 시작합니다.>>")
    $0.upperBodyStrength += Int.random(in: 10...20)
    $0.fatigability += Int.random(in: 10...20)
    print("--------------")
}

let squat: Activity = Activity(name: "스쿼트") {
    print("<<스쿼트을(를) 시작합니다.>>")
    $0.lowerBodyStrength += Int.random(in: 20...30)
    $0.fatigability += Int.random(in: 10...20)
    print("--------------")
}

let longRun: Activity = Activity(name: "오래달리기") {
    print("<<오래달리기을(를) 시작합니다.>>")
    $0.muscularEndurance += Int.random(in: 20...30)
    $0.upperBodyStrength += Int.random(in: 5...10)
    $0.lowerBodyStrength += Int.random(in: 5...10)
    $0.fatigability += Int.random(in: 20...30)
    print("--------------")
}

let dynamicBreak: Activity = Activity(name: "동적휴식") {
    print("<<동적휴식을(를) 시작합니다.>>")
    $0.fatigability += Int.random(in: -10...(-5))
    print("--------------")
}

bodyCondition.printMeasuredBodyCondition()
sitUp.action(bodyCondition)
bodyCondition.printMeasuredBodyCondition()
sitUp.action(bodyCondition)
squat.action(bodyCondition)
bodyCondition.printMeasuredBodyCondition()
