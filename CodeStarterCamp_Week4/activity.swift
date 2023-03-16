//
//  step1.swift
//  CodeStarterCamp_Week4
//
//  Created by MARY on 2023/03/14.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
    
    func start() {
        print("<<\(name)을(를) 시작합니다>>")
    }
}

let sitUp = Activity(name: "윗몸일으키기") {
    $0.upperBody += Int.random(in: 10...20)
    $0.fatigue += Int.random(in: 10...20)
}

let squat = Activity(name: "스쿼트") {
    $0.lowerBody += Int.random(in: 20...30)
    $0.fatigue += Int.random(in: 10...20)
}

let longRun = Activity(name: "오래달리기") {
    $0.endurance += Int.random(in: 20...30)
    $0.upperBody += Int.random(in: 5...10)
    $0.lowerBody += Int.random(in: 5...10)
    $0.fatigue += Int.random(in: 20...30)
}

let activeRest = Activity(name: "동적휴식") {
    $0.fatigue -= Int.random(in: 5...10)
}
