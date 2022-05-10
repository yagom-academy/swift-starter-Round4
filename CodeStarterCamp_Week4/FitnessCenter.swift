//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by Seong A Oh on 2022/05/10.
//

import Foundation

class FitnessCenter {
    var goalBodyCondition: BodyCondition?
    var member: Person?
    var routine: [Routine]
    
    init(goal: BodyCondition, member: Person, routine: [Routine]) {
        self.goalBodyCondition = goal
        self.member = member
        self.routine = routine
    }
    
    convenience init(routine: [Routine] ) {
        self.init(goal: .init(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0),
                  member: .init(name: "", bodyCondition: .init(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)),
                  routine: routine)
    }
}
