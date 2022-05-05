//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var myBodyCondition = BodyCondition(upperBodyStrength: 30, lowerBodyStrength: 30, muscleEndurance: 10)
let emptyRoutine = Routine(name: "Empty")
let upperBodyRoutine = Routine(name: "Upper Body", exercises: pushUp, dip, chinUp, activeRest, chinUp, dip, pushUp)
let lowerBodyRoutine = Routine(name: "Lower Body", exercises: squatting, squatting, squatting, activeRest, lunge, lunge, lunge)
let wholeBodyRoutine = Routine(name: "Whole Body", exercises: longRun, activeRest, pushUp, dip, chinUp, activeRest, squatting, lunge, activeRest, sitUp)

myBodyCondition = emptyRoutine.startRoutine(based: myBodyCondition)
myBodyCondition = upperBodyRoutine.startRoutine(based: myBodyCondition)
