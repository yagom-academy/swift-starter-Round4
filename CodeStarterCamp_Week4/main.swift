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

func printFitnessCenterErrorMessage(about error: FitnessCenterError) {
    print(newLineString)
    if error == .memberBeDrained {
        print("회원이 너무 힘들어서 도망갔습니다!!")
        exit(0)
    } else if error == .emptyMember {
        print("Error : empty member")
        exit(0)
    } else if error == .emptyGoalsBodyCondition {
        print("Error : empty goalsBodyCondition")
        exit(0)
    } else if error == .emptyChosenRoutine {
        print("Error : emptyChosenRoutine")
        exit(0)
    }
}

do {
    try yagomFitnessCenter.startFitnessKiosk()
} catch FitnessCenterError.memberBeDrained {
    printFitnessCenterErrorMessage(about: .memberBeDrained)
} catch FitnessCenterError.emptyGoalsBodyCondition {
    printFitnessCenterErrorMessage(about: .emptyGoalsBodyCondition)
} catch FitnessCenterError.emptyChosenRoutine {
    printFitnessCenterErrorMessage(about: .emptyChosenRoutine)
} catch FitnessCenterError.emptyMember {
    printFitnessCenterErrorMessage(about: .emptyMember)
}
