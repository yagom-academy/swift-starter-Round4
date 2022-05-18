//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// deprecated: for STEP 1
//var myBodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)

var hellRoutine = Routine(name: "hellRoutine")

hellRoutine.addExercise(exercise: sitUp)
hellRoutine.addExercise(exercise: sitUp)
hellRoutine.addExercise(exercise: activeRest)
hellRoutine.addExercise(exercise: squat)
hellRoutine.addExercise(exercise: squat)
hellRoutine.addExercise(exercise: activeRest)
hellRoutine.addExercise(exercise: longDistance)
hellRoutine.addExercise(exercise: longDistance)

// deperecated: for STEP 1
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
ohMyGodRoutine.addExercise(exercise: activeRest)
ohMyGodRoutine.addExercise(exercise: sitUp)
ohMyGodRoutine.addExercise(exercise: sitUp)
ohMyGodRoutine.addExercise(exercise: sitUp)


var yagomFitness = FitnessCenter(name: "야곰")
yagomFitness.addRoutine(routine: hellRoutine)
yagomFitness.addRoutine(routine: ohMyGodRoutine)

// Exercise 실행 시 어떤 bodyCondition 객체의 값이 변경되는지 알아보기 위해 값 설정
var bodyCondition = BodyCondition(upperBodyStrength: 10, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)

var yagom = Person(name: "yagom", bodyCondition: bodyCondition)
yagomFitness.register(member: yagom)

try yagomFitness.runFitnessProgram(member: yagom)

// Exercise 실행 시 어떤 bodyCondition 객체의 값이 변경되었는지 확인
//bodyCondition.showStatus()
//yagom.bodyCondition.showStatus()
