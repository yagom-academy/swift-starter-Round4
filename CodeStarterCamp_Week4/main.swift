//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func executeAction(a: Int, b: Int, condtion: Status, energy: Int) -> Int{
    let randomResult = Int.random(in: a...b)
    if energy >= 5 {
        print("\(condtion.rawValue)이 \(randomResult)만큼 상승합니다.")
    }  else {
        print("\(condtion.rawValue)이 \(randomResult)만큼 하락합니다.")
    }
    return randomResult
}

func tobeActivity(condition: BodyCondition, activity: Activity) {
    print("<<\(activity.name)을 시작합니다.>>")
    activity.action(condition)
}

func currentBodyCondition(condtion: BodyCondition) {
    print("------------")
    print("현재의 컨디션은 다음과 같습니다.")
    print("\(Status.upperBodyMuscle.rawValue): \(condtion.upperBodyMuscle)")
    print("\(Status.lowerBodtMuscle.rawValue): \(condtion.lowerBodtMuscle)")
    print("\(Status.muscularEndurance.rawValue): \(condtion.muscularEndurance)")
    print("\(Status.fatigue.rawValue): \(condtion.fatigue)")
    print("------------")
}

var myBodyCondition: BodyCondition = BodyCondition(upperBodyMuscle: 50, lowerBodtMuscle: 50, muscularEndurance: 50, fatigue: 50)

tobeActivity(condition: myBodyCondition, activity: situp)
currentBodyCondition(condtion: myBodyCondition)

tobeActivity(condition: myBodyCondition, activity: squat)
currentBodyCondition(condtion: myBodyCondition)

tobeActivity(condition: myBodyCondition, activity: longrun)
currentBodyCondition(condtion: myBodyCondition)

tobeActivity(condition: myBodyCondition, activity: activerest)
currentBodyCondition(condtion: myBodyCondition)


