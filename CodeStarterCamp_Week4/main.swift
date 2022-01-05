//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let myRoutine = Routine(name: "hellRoutine", exercises: [squat, squat, situp, rest, running, rest, pilates])
var myBodyCondition = BodyCondition(upperMuscles: 0, lowerMuscles: 6, endurance: 0, fatigue: 0)

myRoutine.introduce()
myRoutine.run()
myBodyCondition.printBodyCondition()
