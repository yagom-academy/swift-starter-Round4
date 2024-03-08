//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

let myBodyCondition = BodyCondition()

let sitUp = Activity(name: Exercise.sitUp.rawValue, action: Exercise.sitUp.workOut)
let squat = Activity(name: Exercise.squat.rawValue, action: Exercise.squat.workOut)
let running = Activity(name: Exercise.running.rawValue, action: Exercise.running.workOut)
let rest = Activity(name: Exercise.rest.rawValue, action: Exercise.rest.workOut)

sitUp.takeExercise(with: myBodyCondition)
squat.takeExercise(with: myBodyCondition)
running.takeExercise(with: myBodyCondition)
rest.takeExercise(with: myBodyCondition)
