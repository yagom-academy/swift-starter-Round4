//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//예시 활동
let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    Activity.startActivity(activityType: .UpperBody, bodyCondition: bodyCondition, from: 10, to: 20)
    Activity.startActivity(activityType: .Fatigue, bodyCondition: bodyCondition, from: 10, to: 20)
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    Activity.startActivity(activityType: .LowerBody, bodyCondition: bodyCondition, from: 20, to: 30)
    Activity.startActivity(activityType: .Fatigue, bodyCondition: bodyCondition, from: 10, to: 20)
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    Activity.startActivity(activityType: .Muscular, bodyCondition: bodyCondition, from: 20, to: 30)
    Activity.startActivity(activityType: .UpperBody, bodyCondition: bodyCondition, from: 5, to: 10)
    Activity.startActivity(activityType: .LowerBody, bodyCondition: bodyCondition, from: 5, to: 10)
    Activity.startActivity(activityType: .Fatigue, bodyCondition: bodyCondition, from: 20, to: 30)
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    Activity.startActivity(activityType: .Relax, bodyCondition: bodyCondition, from: 5, to: 10)
})

let 취침: Activity = Activity(name: "취침", action: { bodyCondition in
    Activity.startActivity(activityType: .Relax,bodyCondition: bodyCondition, from: 50, to: 100)
})

let myBodyCodition: BodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)

let yourBodyCondition: BodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)

윗몸일으키기.exercise(bodyCondition: myBodyCodition)
스쿼트.exercise(bodyCondition: myBodyCodition)
오래달리기.exercise(bodyCondition: myBodyCodition)
동적휴식.exercise(bodyCondition: myBodyCodition)
취침.exercise(bodyCondition: myBodyCodition)

오래달리기.exercise(bodyCondition: yourBodyCondition)
취침.exercise(bodyCondition: yourBodyCondition)
