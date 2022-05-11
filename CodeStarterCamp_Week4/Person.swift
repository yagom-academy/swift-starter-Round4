//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by 김인호 on 2022/05/09.
//

import Foundation

class Person {
    let name: String
    var bodyCondition = BodyCondition()
    
    init(name: String) {
        self.name = name
    }
    
    func exercise(for set: Int, routine: Routine, until goal: Int) throws {
        for _ in 1...set {
            try routine.runRoutine(with: &bodyCondition, until: goal)
        }
    }
}
