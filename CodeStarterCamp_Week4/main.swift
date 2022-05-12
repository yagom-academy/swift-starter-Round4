//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
}

struct Exercise {
    let name: String
    let action: (BodyCondition) -> Void
}

struct Routine {
    let name: String
    var exercise: Array<Exercise> = []
}

func playExercise(routine: Routine, bodyCondition: BodyCondition) {
    print("--------------")
    print("\(routine.name)을 시작합니다.")
    
    for exercise in routine.exercise {
        print(exercise.name)
        exercise.action(bodyCondition)
    }
    printNowCondition(nowBodyCondition: bodyCondition)
}

func printNowCondition(nowBodyCondition: BodyCondition) {
    print("--------------")
    print("현재의 컨디션은 다음과 같습니다.")
    print("상체근력: \(nowBodyCondition.upperBodyStrength)")
    print("하체근력: \(nowBodyCondition.lowerBodyStrength)")
    print("근지구력: \(nowBodyCondition.muscularEndurance)")
    nowBodyCondition.fatigue < 0 ? print("피로도: 0") : print("피로도: \(nowBodyCondition.fatigue)")
}

var myBodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)
let myRoutine: Routine = Routine(name: "hellRoutine", exercise: [sitUp, sitUp, activeRest, squat, squat, activeRest, longRun, longRun])
playExercise(routine: myRoutine, bodyCondition: myBodyCondition)
