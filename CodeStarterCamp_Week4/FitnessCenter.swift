//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by 정선아 on 2022/05/10.
//

import Foundation

class FitnessCenter {
    let name: String
    var targetBodyCondition: BodyCondition
    var member: Person?
    var listOfRoutine: [Routine]
    
    init(name: String, targetBodyCondition: BodyCondition, listOfRoutine: [Routine]) {
        self.name = name
        self.listOfRoutine = listOfRoutine
        self.targetBodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)
    }
    
    convenience init(name: String, listOfRoutine: [Routine]) {
        self.init(name: name, targetBodyCondition: BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0), listOfRoutine: listOfRoutine)
    }
}
