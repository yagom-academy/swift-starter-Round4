//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var bodyCondition: BodyCondition = BodyCondition()
var routine: Routine = Routine(name: "hellRoutine", activities: [.sitUp, .dynamicBreak, .squat])
var trainingManager = TrainingManager()

trainingManager.startExercise(of: routine, by: bodyCondition)
