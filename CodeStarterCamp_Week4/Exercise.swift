//
//  Exercise.swift
//  CodeStarterCamp_Week4
//
//  Created by 홍승주 on 2022/05/05.
//

import Foundation

struct Exercise {
    let name: String
    let action: () -> Void
}

let sitUp: Exercise = Exercise(name: "윗몸일으키기") {
    person.upperBodyMuscleStrength += Int.random(in: 10...20)
    person.fatigue += Int.random(in: 10...20)
}
let squats: Exercise = Exercise(name: "스쿼트") {
    person.lowerBodyMuscleStrength += Int.random(in: 20...30)
    person.fatigue += Int.random(in: 10...20)
}
let run: Exercise = Exercise(name: "오래달리기") {
    person.muscleEndurance += Int.random(in: 20...30)
    person.upperBodyMuscleStrength += Int.random(in: 5...10)
    person.lowerBodyMuscleStrength += Int.random(in: 5...10)
    person.fatigue += Int.random(in: 20...30)
}
let activeRest: Exercise = Exercise(name: "동적휴식") {
    person.fatigue -= Int.random(in: 5...10)
    if person.fatigue < 0 {
        person.fatigue = 0
    }
}
// 추가 동작
let yoga: Exercise = Exercise(name: "요가") {
    person.upperBodyMuscleStrength += Int.random(in: 3...7)
    person.lowerBodyMuscleStrength += Int.random(in: 3...7)
    person.muscleEndurance += Int.random(in: 0...5)
    person.fatigue += Int.random(in: 1...5)
}
