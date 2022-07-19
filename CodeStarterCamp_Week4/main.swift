//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let myBody: BodyCondition = BodyCondition()

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { (BodyCondition) in
    윗몸일으키기.printStartActivity()
    
    BodyCondition.changeCondition(.상체근력, degree: Int.random(in: 10...20))
    BodyCondition.changeCondition(.하체근력, degree: Int.random(in: 10...20))
    
    BodyCondition.printTotalCondition()
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: { (BodyCondition) in
    스쿼트.printStartActivity()
    
    BodyCondition.changeCondition(.하체근력, degree: Int.random(in: 20...30))
    BodyCondition.changeCondition(.피로도, degree: Int.random(in: 10...20))
    
    BodyCondition.printTotalCondition()
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: { (BodyCondition) in
    오래달리기.printStartActivity()
    
    BodyCondition.changeCondition(.근지구력, degree: Int.random(in: 20...30))
    BodyCondition.changeCondition(.상체근력, degree: Int.random(in: 5...10))
    BodyCondition.changeCondition(.하체근력, degree: Int.random(in: 5...10))
    BodyCondition.changeCondition(.피로도, degree: Int.random(in: 20...30))
    
    BodyCondition.printTotalCondition()
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { (BodyCondition) in
    동적휴식.printStartActivity()
    
    BodyCondition.changeCondition(.피로도, degree: Int.random(in: -10 ...  -5))
    
    BodyCondition.printTotalCondition()
})


윗몸일으키기.action(myBody)
스쿼트.action(myBody)
오래달리기.action(myBody)
동적휴식.action(myBody)
