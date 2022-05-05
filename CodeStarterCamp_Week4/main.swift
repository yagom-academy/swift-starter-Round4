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

let 윗몸일으키기: Exercise = Exercise(name: "윗몸일으키기") {
    myBodyCondition.상체근력 += 윗몸일으키기.approveStatusRandomlyBetween(10, 20)
    myBodyCondition.피로도 += 윗몸일으키기.approveStatusRandomlyBetween(10, 20)
}

let 스쿼트: Exercise = Exercise(name: "스쿼트") {
    myBodyCondition.하체근력 += 스쿼트.approveStatusRandomlyBetween(20, 30)
    myBodyCondition.피로도 += 스쿼트.approveStatusRandomlyBetween(10, 20)
}

let 오래달리기: Exercise = Exercise(name: "오래달리기") {
    myBodyCondition.근지구력 += 오래달리기.approveStatusRandomlyBetween(20, 30)
    myBodyCondition.상체근력 += 오래달리기.approveStatusRandomlyBetween(5, 10)
    myBodyCondition.하체근력 += 오래달리기.approveStatusRandomlyBetween(5, 10)
    myBodyCondition.피로도 += 오래달리기.approveStatusRandomlyBetween(20, 30)
}

let 동적휴식: Exercise = Exercise(name: "동적휴식") {
    myBodyCondition.피로도 -= 동적휴식.approveStatusRandomlyBetween(5, 10)
}

myRoutine.exercises.append(윗몸일으키기)
myRoutine.exercises.append(스쿼트)
myRoutine.exercises.append(오래달리기)
myRoutine.exercises.append(동적휴식)

myRoutine.startRoutine(myRoutine.exercises)
