//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let sitUp = Exercise(name: "윗몸일으키기") {bodyCondition in
    bodyCondition.upperBodyMuscleStrength += Int.random(in: 10...20)
    bodyCondition.tiredness += Int.random(in: 10...20)
}
let squats = Exercise(name: "스쿼트") {bodyCondition in
    bodyCondition.lowerBodyMuscleStrength += Int.random(in: 20...30)
    bodyCondition.tiredness += Int.random(in: 10...20)
}
let deadLift = Exercise(name: "데드리프트") {bodyCondition in
    bodyCondition.upperBodyMuscleStrength += Int.random(in: 10...20)
    bodyCondition.lowerBodyMuscleStrength += Int.random(in: 10...20)
    bodyCondition.tiredness += Int.random(in: 10...20)
}
let benchPress = Exercise(name: "벤치프레스") {bodyCondition in
    bodyCondition.upperBodyMuscleStrength += Int.random(in: 20...30)
    bodyCondition.tiredness += Int.random(in: 10...20)
}
let runningLongTime = Exercise(name: "오래달리기") {bodyCondition in
    bodyCondition.upperBodyMuscleStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyMuscleStrength += Int.random(in: 10...20)
    bodyCondition.musclerEndurance += Int.random(in: 20...30)
    bodyCondition.tiredness += Int.random(in: 10...20)
}
let activeRest = Exercise(name: "동적휴식") {bodyCondition in
    bodyCondition.tiredness -= Int.random(in: 10...20)
}

let hellRoutine = Routine(name: "지옥의루틴", routineArray: [squats, squats, activeRest, benchPress, benchPress, deadLift, deadLift, activeRest, sitUp, sitUp, activeRest, runningLongTime])

var wonbi = BodyCondition()
hellRoutine.printRotineList()
hellRoutine.startRoutine(affecting: wonbi)
wonbi.checkCondition()


