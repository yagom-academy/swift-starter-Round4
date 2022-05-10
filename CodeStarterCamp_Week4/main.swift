//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let buildinglowerRoutine: Routine = Routine(called: "Build Lower Routine", exercises: [squat, squat, activeRest, miniMarathon, activeRest])
let buildingUpperRoutine: Routine = Routine(called: "Build Upper Routine", exercises: [benchPress, activeRest, benchPress, activeRest, miniMarathon])

let fitnessPrograms: [Routine] = [buildingUpperRoutine, buildinglowerRoutine]
let yagomFitnessCenter = FitnessCenter(routineList: fitnessPrograms)

func startExercise(at fitnessCenter: FitnessCenter) {
    fitnessCenter.register()
    fitnessCenter.workOut()
}

startExercise(at: yagomFitnessCenter)
