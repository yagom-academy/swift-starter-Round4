//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let newLineString = "------------------------------------------"

let emptyRoutine = Routine(name: "Empty")
let upperBodyRoutine = Routine(name: "Upper Body", exercises: pushUp, activeRest, dip, activeRest, chinUp, activeRest, chinUp, dip, pushUp)
let lowerBodyRoutine = Routine(name: "Lower Body", exercises: squatting, squatting,  activeRest, squatting, activeRest, lunge, lunge, activeRest, lunge)
let wholeBodyRoutine = Routine(name: "Whole Body", exercises: longRun, activeRest, pushUp, activeRest, dip, chinUp, activeRest, squatting, activeRest, lunge, activeRest, sitUp)

var yagomFitnessCenter = FitnessCenter(name: "야곰", routines: upperBodyRoutine, lowerBodyRoutine, wholeBodyRoutine)

yagomFitnessCenter.startFitnessKiosk()
