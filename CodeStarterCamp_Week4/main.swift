//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var bodyCondition: BodyCondition = BodyCondition()
var routine: Routine = Routine(routineName: "hellRoutine", activities: [.sitUp, .dynamicBreak, .squat])
var trainingManager = TrainingManager.shared

trainingManager.startExercise(of: routine, who: bodyCondition)
