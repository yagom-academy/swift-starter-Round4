//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var bodyCondition: BodyCondition = BodyCondition(upperbodystrength: 0, lowerbodystrength: 0, muscularendurance: 0, fatigue: 0)
var routine: Routine = Routine(name: "루틴")

routine.start()
bodyCondition.nowCondition()

let input: String? = readLine()

print("입력값은 \(input)입니다")

