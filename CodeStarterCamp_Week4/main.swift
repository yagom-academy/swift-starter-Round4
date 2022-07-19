//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let sitUp: Activity = Activity(name: "윗몸일으키기",
                               action: { (bodyCondition: BodyCondition) in
    print("<<윗몸일으키기를 시작합니다.>>")
    bodyCondition.raiseUpperBodyMuscleStrength(Int.random(in: 10...20))
    bodyCondition.raiseFatigue(Int.random(in: 10...20))
    print("--------------")
})

let squat: Activity = Activity(name: "스쿼트",
                               action: { (bodyCondition: BodyCondition) in
    print("<<스쿼트를 시작합니다.>>")
    bodyCondition.raiseLowerBodyMuscleStrength(Int.random(in: 20...30))
    bodyCondition.raiseFatigue(Int.random(in: 10...20))
    print("--------------")
})

let longRun: Activity = Activity(name: "오래달리기",
                                 action: { (bodyCondition: BodyCondition) in
    print("<<오래달리기를 시작합니다.>>")
    bodyCondition.raiseMuscularEndurance(Int.random(in: 20...30))
    bodyCondition.raiseUpperBodyMuscleStrength(Int.random(in: 5...10))
    bodyCondition.raiseLowerBodyMuscleStrength(Int.random(in: 5...10))
    bodyCondition.raiseFatigue(Int.random(in: 10...20))
    print("--------------")
})

let dynamicRest: Activity = Activity(name: "동적휴식") {
    (bodyCondition: BodyCondition) in
    print("<<동적휴식을 시작합니다.>>")
    bodyCondition.dropFatigue(Int.random(in: 5...10))
    print("--------------")
}

let sleep: Activity = Activity(name: "잠자기") {
    print("<<잠자기를 시작합니다.>>")
    $0.dropFatigue(Int.random(in: 20...30))
    print("--------------")
}

let myBodyCondition: BodyCondition = BodyCondition(upperBodyMuscleStrength: 100,
                                                   lowerBodyMuscleStrength: 80,
                                                   muscularEndurance: 80,
                                                   fatigue: 0)

var hellRoutine = Routine(name: "hellRoutine",
                          activities: [sitUp, dynamicRest, squat])

hellRoutine.doRoutine(bodyCondition: myBodyCondition)
