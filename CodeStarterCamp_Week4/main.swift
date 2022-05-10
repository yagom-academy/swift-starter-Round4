//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var myBodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)
var hellRoutine = Routine(name: "hellRoutine")

hellRoutine.addExercise(exercise: sitUp)
hellRoutine.addExercise(exercise: sitUp)
hellRoutine.addExercise(exercise: activeRest)
hellRoutine.addExercise(exercise: squat)
hellRoutine.addExercise(exercise: squat)
hellRoutine.addExercise(exercise: activeRest)
hellRoutine.addExercise(exercise: longDistance)
hellRoutine.addExercise(exercise: longDistance)

//hellRoutine.run()
//myBodyCondition.showStatus()

var ohMyGodRoutine = Routine(name: "ohMyGodRoutine")

ohMyGodRoutine.addExercise(exercise: pushUp)
ohMyGodRoutine.addExercise(exercise: pushUp)
ohMyGodRoutine.addExercise(exercise: pushUp)
ohMyGodRoutine.addExercise(exercise: activeRest)
ohMyGodRoutine.addExercise(exercise: squat)
ohMyGodRoutine.addExercise(exercise: squat)
ohMyGodRoutine.addExercise(exercise: squat)

var yagomFitness = FitnessCenter(name: "야곰")
yagomFitness.addRoutine(routine: hellRoutine)
yagomFitness.addRoutine(routine: ohMyGodRoutine)

var yagomBodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)

let yagom = Person(name: "yagom", bodyCondition: yagomBodyCondition)
yagomFitness.register(member: yagom)

try yagomFitness.runFitnessProgram(member: yagom)
