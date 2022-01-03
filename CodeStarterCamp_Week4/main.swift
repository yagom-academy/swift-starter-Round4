//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var publicBodyCondition: BodyCondition = BodyCondition()
var yagomFitness: FitnessCenter = FitnessCenter(name: "YagomFitness")


do {
    try yagomFitness.startTraining()
} catch FitnessError.NoMember {
    print("No Member Error!!")
} catch {}


yagomFitness.member = Person()
do {
    try yagomFitness.startTraining()
} catch FitnessError.NoMember {
    print("No Member Error!!")
} catch {}
