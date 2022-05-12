//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let sitUp: Exercise = .sitUp
let squats: Exercise = .squats
let deadLift: Exercise = .deadLift
let benchPress: Exercise = .benchPress
let runningLongTime: Exercise = .runningLongTime
let activeRest: Exercise = .activeRest
let hellRoutine = Routine(name: "지옥의루틴", routineContents: [squats, squats, activeRest, benchPress, benchPress, deadLift, deadLift, activeRest, sitUp, sitUp, activeRest, runningLongTime])
var wonbi = BodyCondition()

hellRoutine.printRotineList()
hellRoutine.startRoutine(affecting: wonbi)
wonbi.checkCondition()
