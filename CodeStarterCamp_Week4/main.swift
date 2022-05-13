//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
/*

let exercise: Array<Exercise> = [sitUp, activeRest, yoga]
var personRoutine = Routine(routineName: "hellroutine", exercises: exercise)

person.checkBodyCondition()
 */
let hellRoutineExercise: Array<Exercise> = [sitUp, sitUp, activeRest, legRaise, legRaise, activeRest, burpee, burpee]
var hellRoutine = Routine(routineName: "hellRoutine", exercises: hellRoutineExercise)

let ohMyGodRoutineExercise: Array<Exercise> = [sitUp, squats, run, sitUp, squats, run, activeRest, legRaise, legRaise, burpee, run, activeRest, yoga]
var ohMyGodRoutine = Routine(routineName: "ohMyGodRoutine", exercises: ohMyGodRoutineExercise)

let person = BodyCondition(upperBodyMuscleStrength: 10, lowerBodyMuscleStrength: 10, muscleEndurance: 10, fatigue: 3)

var yagom = Person(name: "yagom", bodyCondition: person)

var yagomFitnessCenter = FitnessCenter(name: "야곰", routine: [hellRoutine, ohMyGodRoutine])

try yagomFitnessCenter.runRoutine()
