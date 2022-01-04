//  main.swift
//  CodeStarterCamp_Week4
//  Created by quokka
//  Copyright © yagom academy. All rights reserved.

import Foundation

let kaui = Person(name: "quokka", bodyCondition: quokka)
var quokka = BodyCondition(uppperBodyStrength: 0, lowerBodyStrength: 0,
                           muscularEndurance: 0, fatigue: 0)
let sitUp = Exercise(name: Exercises.sitUp.name) {
    print("\(sitUp.name)")
    quokka.uppperBodyStrength += Int.random(in: 10...20)
    quokka.fatigue += Int.random(in: 10...20)
}
let squart = Exercise(name: Exercises.squart.name) {
    print("\(squart.name)")
    quokka.lowerBodyStrength += Int.random(in: 20...30)
    quokka.fatigue += Int.random(in: 10...20)
}
let runLong = Exercise(name: Exercises.runLong.name) {
    print("\(runLong.name)")
    quokka.muscularEndurance += Int.random(in: 20...30)
    quokka.uppperBodyStrength += Int.random(in: 5...10)
    quokka.lowerBodyStrength += Int.random(in: 5...10)
    quokka.fatigue += Int.random(in: 20...30)
}
let pushUp = Exercise(name: Exercises.pushUp.name) {
    print("\(pushUp.name)")
    quokka.fatigue -= Int.random(in: 5...10)
}
let activeRest = Exercise(name: Exercises.activeRest.name) {
    print("\(activeRest.name)")
    quokka.uppperBodyStrength += Int.random(in: 10...15)
    quokka.fatigue += Int.random(in: 5...10)
}

let upperBodyExercise = Routine(name: Routines.uppperBodyExercise.name,
                                exercises: [pushUp, sitUp,
                                            pushUp, sitUp,
                                            activeRest])
let lowerBodyStrength = Routine(name: Routines.lowerBodyExercise.name,
                                exercises: [squart, squart,
                                            activeRest, squart,
                                            squart, activeRest])
let strengthTraining = Routine(name: Routines.aerobicExercise.name, exercises: [runLong,runLong,activeRest])
var yagomFitnessCenter = FitnessCenter(goalBodyCondition: kaui.bodyCondition, member: kaui,
                                       routines: [upperBodyExercise, lowerBodyStrength,         strengthTraining])

do {
    try yagomFitnessCenter.startFitnessProgram(member: yagomFitnessCenter.member, routines: yagomFitnessCenter.routines, at: yagomFitnessCenter)
} catch FitnessCenter.Errors.canNotFindMember {
    print(FitnessCenter.Errors.canNotFindMember.description)
} catch FitnessCenter.Errors.wrongInput {
    print(FitnessCenter.Errors.wrongInput.description)
} catch FitnessCenter.Errors.fatigueIsOver {
    print(FitnessCenter.Errors.fatigueIsOver.description)
} catch FitnessCenter.Errors.wasNotGoalIn {
    print(FitnessCenter.Errors.wasNotGoalIn.description)
} catch FitnessCenter.Errors.doesntNotFindRoutineNumber {
    print(FitnessCenter.Errors.doesntNotFindRoutineNumber.description)
}
