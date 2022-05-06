//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let 윗몸일으키기: Exercise = Exercise(name: "윗몸일으키기",
                                action: { (person: BodyCondition) in
    person.upperBodyStrength += Int.random(in: 10...20)
    person.fatigue += Int.random(in: 10...20)
})

let 스쿼트: Exercise = Exercise(name: "스쿼트",
                             action: { (person: BodyCondition) in
    person.lowerBodyStrength += Int.random(in: 20...30)
    person.fatigue += Int.random(in: 10...20)
})

let 오래달리기: Exercise = Exercise(name: "오래달리기",
                               action: { (person: BodyCondition) in
    person.muscularEndurance += Int.random(in: 20...30)
    person.upperBodyStrength += Int.random(in: 5...10)
    person.lowerBodyStrength += Int.random(in: 5...10)
    person.fatigue += Int.random(in: 20...30)
})

let 동적휴식: Exercise = Exercise(name: "동적휴식",
                              action: { (person: BodyCondition) in
    person.fatigue -= Int.random(in: 5...10)
})

let 줄넘기: Exercise = Exercise(name: "줄넘기",
                             action: { (person: BodyCondition) in
    person.muscularEndurance += Int.random(in: 5...15)
    person.fatigue += Int.random(in: 5...10)
})

let hellRoutine = Routine(name: "hellRoutine", exercises: [윗몸일으키기, 윗몸일으키기, 동적휴식, 스쿼트, 스쿼트, 동적휴식, 오래달리기, 오래달리기])
let lightRoutine = Routine(name: "lightRoutine", exercises: [윗몸일으키기, 동적휴식, 줄넘기, 스쿼트, 동적휴식])
