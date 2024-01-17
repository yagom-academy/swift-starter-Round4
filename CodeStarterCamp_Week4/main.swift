//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BodyFit {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigueLevel: Int

    func showBodyFit() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigueLevel)")
        print("--------------")
    }
}

struct Exercise {
    let name: String
    let performExercise: (inout BodyFit) -> Void
}

let sitUp: Exercise = Exercise(name: "윗몸일으키기") { bodyFit in
    bodyFit.upperBodyStrength += Int.random(in: 10...20)
    bodyFit.fatigueLevel += Int.random(in: 10...20)
    showExerciseResult(sitUp.name, bodyFit.upperBodyStrength, bodyFit.fatigueLevel)
}

let squat: Exercise = Exercise(name: "스쿼트") { bodyFit in
    bodyFit.lowerBodyStrength += Int.random(in: 20...30)
    bodyFit.fatigueLevel += Int.random(in: 10...20)
    showExerciseResult(squat.name, bodyFit.lowerBodyStrength, bodyFit.fatigueLevel)
}

let longRun: Exercise = Exercise(name: "오래달리기") { bodyFit in
    bodyFit.muscularEndurance += Int.random(in: 20...30)
    bodyFit.upperBodyStrength += Int.random(in: 5...10)
    bodyFit.lowerBodyStrength += Int.random(in: 5...10)
    bodyFit.fatigueLevel += Int.random(in: 20...30)
    showExerciseResult(longRun.name, bodyFit.upperBodyStrength, bodyFit.lowerBodyStrength, bodyFit.muscularEndurance, bodyFit.fatigueLevel)
}

let dynamicRest: Exercise = Exercise(name: "동적휴식") { bodyFit in
    bodyFit.fatigueLevel -= Int.random(in: 5...10)
    showExerciseResult(dynamicRest.name, bodyFit.fatigueLevel)
}

var currentBodyFit = BodyFit(upperBodyStrength: 100, lowerBodyStrength: 70, muscularEndurance: 50, fatigueLevel: 10)

func showExerciseResult(_ exerciseName: String, _ values: Int...) {
    print("<<\(exerciseName)을(를) 시작합니다>>")
    values.forEach { print("\($0) 상승합니다.") }
    print("--------------")
}

sitUp.performExercise(&currentBodyFit)
currentBodyFit.showBodyFit()

squat.performExercise(&currentBodyFit)
currentBodyFit.showBodyFit()

longRun.performExercise(&currentBodyFit)
currentBodyFit.showBodyFit()

dynamicRest.performExercise(&currentBodyFit)
currentBodyFit.showBodyFit()
