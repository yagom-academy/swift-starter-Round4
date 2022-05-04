//
//  Exercise.swift
//  CodeStarterCamp_Week4
//
//  Created by 이정민 on 2022/05/04.
//

import Foundation

struct Exercise {
    let name: String
    let action: (inout BodyCondition) -> Void
}

let 윗몸일으키기: Exercise = Exercise(name: "윗몸일으키기") { condition in
    condition.upperBodyStrength += Int.random(in: 10...20)
    condition.fatigue += Int.random(in: 10...20)
}

let 스쿼트: Exercise = Exercise(name: "스쿼트") { condition in
    condition.lowerBodyStrength += Int.random(in: 20...30)
    condition.fatigue += Int.random(in: 10...20)
}

let 오래달리기: Exercise = Exercise(name: "오래달리기") { condition in
    condition.endurancePower += Int.random(in: 20...30)
    condition.upperBodyStrength += Int.random(in: 5...10)
    condition.lowerBodyStrength += Int.random(in: 5...10)
    condition.fatigue += Int.random(in: 20...30)
}

let 동적휴식: Exercise = Exercise(name: "동적휴식") { condition in
    condition.fatigue -= Int.random(in: 5...10)
}

let 벤치프레스: Exercise = Exercise(name: "벤치프레스") { condition in
    condition.upperBodyStrength += Int.random(in: 20...30)
    condition.fatigue += Int.random(in: 15...20)
}
