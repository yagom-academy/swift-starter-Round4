//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var redmango = Person(name: "redmango")
var som = personalTrainer(routine: Routine(name: "hellRoutine",
                                           activities: [sitUp, stretching, squats, longRun]))
var consoleManager = ConsoleManager()

som.startRoutine(to: redmango)
redmango.bodyCondition.checkCondition()


