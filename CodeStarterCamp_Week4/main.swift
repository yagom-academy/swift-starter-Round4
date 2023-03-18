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
    윗몸일으키기.printStartMessage(name: "윗몸일으키기")
    윗몸일으키기.startActivity(activityType: .UpperBody, bodyCondition: bodyCondition, from: 10, to: 20)
    윗몸일으키기.startActivity(activityType: .Fatigue, bodyCondition: bodyCondition, from: 10, to: 20)
    윗몸일으키기.printMyBodyCondition(bodyCondition: bodyCondition)
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    스쿼트.printStartMessage(name: "스쿼트")
    스쿼트.startActivity(activityType: .LowerBody, bodyCondition: bodyCondition, from: 20, to: 30)
    스쿼트.startActivity(activityType: .Fatigue, bodyCondition: bodyCondition, from: 10, to: 20)
    스쿼트.printMyBodyCondition(bodyCondition: bodyCondition)
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    오래달리기.printStartMessage(name: "오래달리기")
    오래달리기.startActivity(activityType: .Muscular, bodyCondition: bodyCondition, from: 20, to: 30)
    오래달리기.startActivity(activityType: .UpperBody, bodyCondition: bodyCondition, from: 5, to: 10)
    오래달리기.startActivity(activityType: .LowerBody, bodyCondition: bodyCondition, from: 5, to: 10)
    오래달리기.startActivity(activityType: .Fatigue, bodyCondition: bodyCondition, from: 20, to: 30)
    오래달리기.printMyBodyCondition(bodyCondition: bodyCondition)
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    동적휴식.printStartMessage(name: "동적휴식")
    동적휴식.startActivity(activityType: .Relax, bodyCondition: bodyCondition, from: 5, to: 10)
    동적휴식.printMyBodyCondition(bodyCondition: bodyCondition)
})

let 취침: Activity = Activity(name: "취침", action: { bodyCondition in
    취침.printStartMessage(name: "취침")
    취침.startActivity(activityType: .Relax,bodyCondition: bodyCondition, from: 50, to: 100)
    취침.printMyBodyCondition(bodyCondition: bodyCondition)
})

let myBody: BodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)

let yourBody: BodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)

//스쿼트.action(myBody)
//오래달리기.action(myBody)
//동적휴식.action(myBody)
//취침.action(myBody)
//
//오래달리기.action(yourBody)
//취침.action(yourBody)
