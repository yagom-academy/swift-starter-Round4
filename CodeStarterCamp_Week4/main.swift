//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func executeAction(condition: Status, updown: Bool, random: Random) {
    if updown == true {
        print("\(condition.rawValue)이 \(random.value)만큼 상승합니다.")
    }  else {
        print("\(condition.rawValue)이 \(random.value)만큼 하락합니다.")
    }
    return 
}

func tobeActivity(condition: BodyCondition, activity: Activity) {
    print("<<\(activity.name)을 시작합니다.>>")
    activity.action(condition)
    print("------------")
    print("현재의 컨디션은 다음과 같습니다.")
    print("\(Status.upperBodyMuscle.rawValue): \(condition.upperBodyMuscle)")
    print("\(Status.lowerBodyMuscle.rawValue): \(condition.lowerBodyMuscle)")
    print("\(Status.muscularEndurance.rawValue): \(condition.muscularEndurance)")
    print("\(Status.fatigue.rawValue): \(condition.fatigue)")
    print("------------")
}


var myBodyCondition: BodyCondition = BodyCondition(upperBodyMuscle: 50, lowerBodyMuscle: 50, muscularEndurance: 50, fatigue: 50)

tobeActivity(condition: myBodyCondition, activity: situp)
tobeActivity(condition: myBodyCondition, activity: squat)
tobeActivity(condition: myBodyCondition, activity: longrun)
tobeActivity(condition: myBodyCondition, activity: activerest)



