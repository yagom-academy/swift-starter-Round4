//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let bodyCondition: BodyCondition = BodyCondition(upperbodystrength: 0, lowerbodystrength: 0, muscularendurance: 0, fatigue: 0)
let goalsBodyCondition: BodyCondition = BodyCondition(upperbodystrength: -1, lowerbodystrength: -1, muscularendurance: -1, fatigue: -1)
let upperBodyExcercises: Routine = Routine(name: "upperBodyExcercises")
let lowerBodyExcercises: Routine = Routine(name: "lowerBodyExcercises")
let person: Person = Person(name: "")
let yagomFitnessCenter : FitnessCenter = FitnessCenter(goalsBodyCondition: goalsBodyCondition, member: person)

yagomFitnessCenter.noMemberCheck()
yagomFitnessCenter.handlilgUpperbodystrength()
yagomFitnessCenter.handlilgLowerbodystrength()
yagomFitnessCenter.handlilgMuscularendurance()
yagomFitnessCenter.handlilgFatigue()
yagomFitnessCenter.finalGoalsBodyCondition()
person.excerciseLoop()
