//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let bodyCondition: BodyCondition = BodyCondition(upperbodystrength: 0, lowerbodystrength: 0, muscularendurance: 0, fatigue: 0)
let routine: Routine = Routine(name: "hellRoutine")

bodyCondition.nowCondition()
routine.start()
bodyCondition.nowCondition()
routine.start()
bodyCondition.nowCondition()
