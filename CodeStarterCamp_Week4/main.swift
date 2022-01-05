//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var myBodyCondition = BodyCondition()
let myRoutine = Routine(name: "hellRoutine", exercises: [squat, squat, situp, rest, running, rest, pilates])

var todayCondition = myBodyCondition
myRoutine.introduce()
myRoutine.run()
todayCondition.printBodyCondition()
