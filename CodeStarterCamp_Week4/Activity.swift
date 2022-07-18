//
//  activity.swift
//  CodeStarterCamp_Week4
//
//  Created by hanjongwoo on 2022/07/15.
//

import Foundation

struct Activity {
    let name: String
    let bodyConditions: [BodyCondition]
    let action: (Array<BodyCondition>) -> Void
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", bodyConditions: [upperStrength, fatigue], action: { (bodyConditions: Array<BodyCondition>) in
    for bodyCondition in bodyConditions {
        if bodyCondition is 상체근력 {
            bodyCondition.adjustRandomValue(10, 20)
        } else if bodyCondition is 피로도 {
            bodyCondition.adjustRandomValue(10, 20)
        }
        bodyCondition.adjustValue()
    }
})

let 스쿼트: Activity = Activity(name: "스쿼트", bodyConditions: [lowerStrength, fatigue], action: { bodyConditions in
    for bodyCondition in bodyConditions {
        if bodyCondition is 하체근력 {
            bodyCondition.adjustRandomValue(20, 30)
        } else if bodyCondition is 피로도 {
            bodyCondition.adjustRandomValue(10, 20)
        }
        bodyCondition.adjustValue()
    }
})

let 오래달리기: Activity = Activity(name: "오래달리기", bodyConditions: [muscularEndurance, upperStrength, lowerStrength, fatigue], action: { bodyConditions in
    for bodyCondition in bodyConditions {
        if bodyCondition is 상체근력 {
            bodyCondition.adjustRandomValue(5, 10)
        } else if bodyCondition is 하체근력 {
            bodyCondition.adjustRandomValue(5, 10)
        } else if bodyCondition is 피로도 {
            bodyCondition.adjustRandomValue(20, 30)
        } else if bodyCondition is 근지구력 {
            bodyCondition.adjustRandomValue(20, 30)
        }
        bodyCondition.adjustValue()
    }
})

let 동적휴식: Activity = Activity(name: "동적휴식", bodyConditions: [fatigue], action: { bodyConditions in
    for bodyCondition in bodyConditions {
        if bodyCondition is 피로도 {
            bodyCondition.adjustRandomValue(-10, -5)
        }
        bodyCondition.adjustValue()
    }
})
