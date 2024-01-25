//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let sitUp: Activity = Activity(name: "윗몸일으키기") { body in
    print("<<윗몸일으키기를 시작합니다>>")
    
    body.updateHealthPoint(to: .upper, with: Int.random(in: 10...20))
    body.updateHealthPoint(to: .fatigue, with: Int.random(in: 10...20))
    body.printStatus()
}

let squat: Activity = Activity(name: "스쿼트") { body in
    print("<<스쿼트를 시작합니다>>")
    
    body.updateHealthPoint(to: .lower, with: Int.random(in: 20...30))
    body.updateHealthPoint(to: .fatigue, with: Int.random(in: 10...20))
    body.printStatus()
}

let running: Activity = Activity(name: "오래달리기") { body in
    print("<<오래달리기를 시작합니다>>")
    
    body.updateHealthPoint(to: .upper, with: Int.random(in: 5...10))
    body.updateHealthPoint(to: .lower, with: Int.random(in: 5...10))
    body.updateHealthPoint(to: .stamina, with: Int.random(in: 20...30))
    body.updateHealthPoint(to: .fatigue, with: Int.random(in: 20...30))
    body.printStatus()
}

let rest: Activity = Activity(name: "동적휴식") { body in
    print("<<동적휴식을 시작합니다>>")
    
    body.updateHealthPoint(to: .fatigue, with: Int.random(in: 5...10) * (-1))
    body.printStatus()
}

let misterLee = Person(name: "Lee", weight: 170, height: 70, nationality: "Korea")
sitUp.action(misterLee)
squat.action(misterLee)
running.action(misterLee)
rest.action(misterLee)


