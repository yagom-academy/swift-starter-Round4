//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let upperBodyRoutine = Routine(routineName: "상체루틴", exercises: [sitUp, pullUp, pullUp, activeRest, pullUp, pullUp, activeRest])
let lowerBodyRoutine = Routine(routineName: "하체루틴", exercises: [squat, squat, activeRest, lunge, lunge, activeRest])
let hellRoutine = Routine(routineName: "hellRoutine", exercises: [sitUp, sitUp, activeRest, squat, squat, activeRest, longRun, longRun])
var yagomFitness = FitnessCenter(routineLists: [upperBodyRoutine, lowerBodyRoutine, hellRoutine])

yagomFitness.startExercise()

