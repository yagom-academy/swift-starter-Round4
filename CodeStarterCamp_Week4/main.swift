//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var 상체근력: Int = 0
    var 하체근력: Int = 0
    var 근지구력: Int = 0
    var 피로도: Int = 0
}

var bodyCondition: BodyCondition = BodyCondition()

func doExercise(exercise: Exercise) {
    let exerciseName = exercise.name
    let exerciseAction: Void = exercise.action()
    print("\(exerciseName)의 BodyCondition")
    print("상체근력 : \(bodyCondition.상체근력)")
    print("하체근력: \(bodyCondition.하체근력)")
    print("근지구력: \(bodyCondition.근지구력)")
    print("피로도: \(bodyCondition.피로도)\n")
}

doExercise(exercise: 윗몸일으키기)
doExercise(exercise: 철봉매달리기)
