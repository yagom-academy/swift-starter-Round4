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

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", bodyConditions: [상체근력(10, 20), 피로도(10, 20)], action: { (bodyConditions: Array<BodyCondition>) in
    for i in 0..<bodyConditions.count {
        bodyConditions[i].adjustValue()
        print(bodyConditions[0])
    }
})

let 스쿼트: Activity = Activity(name: "스쿼트", bodyConditions: [하체근력(20, 30), 피로도(10, 20)], action: { bodyConditions in
    for i in 0..<bodyConditions.count {
        bodyConditions[i].adjustValue()
    }
})

let 오래달리기: Activity = Activity(name: "오래달리기", bodyConditions: [근지구력(20, 30), 상체근력(5, 10), 하체근력(5, 10), 피로도(20, 30)], action: { bodyConditions in
    for i in 0..<bodyConditions.count {
        bodyConditions[i].adjustValue()
    }
})

let 동적휴식: Activity = Activity(name: "동적휴식", bodyConditions: [피로도(-10, -5)], action: { bodyConditions in
    for i in 0..<bodyConditions.count {
        bodyConditions[i].adjustValue()
    }
})
