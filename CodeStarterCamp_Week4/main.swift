//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let sitUp: Exercise = Exercise(name: "윗몸일으키기",
                                action: { (person: BodyCondition) in
    person.upperBodyStrength += Int.random(in: 10...20)
    person.fatigue += Int.random(in: 10...20)
})

let squat: Exercise = Exercise(name: "스쿼트",
                             action: { (person: BodyCondition) in
    person.lowerBodyStrength += Int.random(in: 20...30)
    person.fatigue += Int.random(in: 10...20)
})

let longRun: Exercise = Exercise(name: "오래달리기",
                               action: { (person: BodyCondition) in
    person.muscularEndurance += Int.random(in: 20...30)
    person.upperBodyStrength += Int.random(in: 5...10)
    person.lowerBodyStrength += Int.random(in: 5...10)
    person.fatigue += Int.random(in: 20...30)
})

let dynamicBreak: Exercise = Exercise(name: "동적휴식",
                              action: { (person: BodyCondition) in
    person.fatigue -= Int.random(in: 5...10)
})

let jumpRope: Exercise = Exercise(name: "줄넘기",
                             action: { (person: BodyCondition) in
    person.muscularEndurance += Int.random(in: 5...15)
    person.fatigue += Int.random(in: 5...10)
})

let hellRoutine = Routine(name: "지옥 루틴", exercises: [sitUp, sitUp, dynamicBreak, squat, squat, dynamicBreak, longRun, longRun])
let lightRoutine = Routine(name: "가벼운 루틴", exercises: [sitUp, dynamicBreak, jumpRope, squat, dynamicBreak])

let kimYuna = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)
let songGain = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)

kimYuna.exercise(routine: hellRoutine)
songGain.exercise(routine: lightRoutine)
