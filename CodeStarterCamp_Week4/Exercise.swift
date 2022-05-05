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

let sitUp: Exercise = Exercise(name: "윗몸일으키기") { condition in
    condition.upperBodyStrength.increaseWeights(from: 10, to: 20)
    condition.fatigue.increaseWeights(from: 10, to: 20)
}

let squat: Exercise = Exercise(name: "스쿼트") { condition in
    condition.lowerBodyStrength.increaseWeights(from: 20, to: 30)
    condition.fatigue.increaseWeights(from: 10, to: 20)
}

let miniMarathon: Exercise = Exercise(name: "오래달리기") { condition in
    condition.endurancePower.increaseWeights(from: 20, to: 30)
    condition.upperBodyStrength.increaseWeights(from: 5, to: 10)
    condition.lowerBodyStrength.increaseWeights(from: 5, to: 10)
    condition.fatigue.increaseWeights(from: 20, to: 30)
}

let activeRest: Exercise = Exercise(name: "동적휴식") { condition in
    condition.fatigue.decreaseWeights(from: 5, to: 10)
}

let benchPress: Exercise = Exercise(name: "벤치프레스") { condition in
    condition.upperBodyStrength.increaseWeights(from: 20, to: 30)
    condition.fatigue.increaseWeights(from: 15, to: 20)
}
