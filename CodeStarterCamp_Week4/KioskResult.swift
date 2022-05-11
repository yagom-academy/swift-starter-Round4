//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class KioskResult {
    let name: String
    let bodyCondition: BodyCondition
    let chosenRoutine: Routine
    let decidedNumberOfSet: Int
    
    init(name: String, bodyCondition: BodyCondition, chosenRoutine: Routine, decidedNumberOfSet: Int) {
        self.name = name
        self.bodyCondition = bodyCondition
        self.chosenRoutine = chosenRoutine
        self.decidedNumberOfSet = decidedNumberOfSet
    }
}
