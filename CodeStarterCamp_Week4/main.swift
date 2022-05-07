//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var myBodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, musclarEndurance: 0, fatigue: 0)
var hellRoutine = Routine(name: "hellRoutine")

hellRoutine.addExercise(exercise: sitUp)
hellRoutine.addExercise(exercise: sitUp)
hellRoutine.addExercise(exercise: activeRest)
hellRoutine.addExercise(exercise: squat)
hellRoutine.addExercise(exercise: squat)
hellRoutine.addExercise(exercise: activeRest)
hellRoutine.addExercise(exercise: longDistance)
hellRoutine.addExercise(exercise: longDistance)

hellRoutine.run(whose: myBodyCondition, do: hellRoutine.exercises)
myBodyCondition.showStatus()
