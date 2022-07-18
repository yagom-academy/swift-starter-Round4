//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let myBodyCondition: BodyCondition = BodyCondition(upperBodyMuscleStrength: 100, lowerBodyMuscleStrength: 80, muscularEndurance: 80, fatigue: 0)

sitUp.action(myBodyCondition)
myBodyCondition.printCurrentBodyCondition()

sleep.action(myBodyCondition)
myBodyCondition.printCurrentBodyCondition()
