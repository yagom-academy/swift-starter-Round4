//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var myBodyCondition: BodyCondition = BodyCondition()
var myRoutine: Routine = Routine(name: "목요일!! 가즈아!")

let sitUp: Exercise = Exercise(name: "윗몸일으키기") {
    myBodyCondition.upperBodyStrength += sitUp.approveStatusRandomlyBetween(10, 20)
    myBodyCondition.fatigueLevel += sitUp.approveStatusRandomlyBetween(10, 20)
}

let squat: Exercise = Exercise(name: "스쿼트") {
    myBodyCondition.lowerBodyStrength += squat.approveStatusRandomlyBetween(20, 30)
    myBodyCondition.fatigueLevel += squat.approveStatusRandomlyBetween(10, 20)
}

let running: Exercise = Exercise(name: "오래달리기") {
    myBodyCondition.muscularEndurance += running.approveStatusRandomlyBetween(20, 30)
    myBodyCondition.upperBodyStrength += running.approveStatusRandomlyBetween(5, 10)
    myBodyCondition.lowerBodyStrength += running.approveStatusRandomlyBetween(5, 10)
    myBodyCondition.fatigueLevel += running.approveStatusRandomlyBetween(20, 30)
}

let recovery: Exercise = Exercise(name: "동적휴식") {
    myBodyCondition.fatigueLevel -= recovery.approveStatusRandomlyBetween(5, 10)
}

myRoutine.exercises.append(sitUp)
myRoutine.exercises.append(squat)
myRoutine.exercises.append(running)
myRoutine.exercises.append(recovery)

myRoutine.startRoutine(myRoutine.exercises)
