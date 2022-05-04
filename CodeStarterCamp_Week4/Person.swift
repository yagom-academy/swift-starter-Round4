//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by 이정민 on 2022/05/04.
//

import Foundation

class Person {
    let name: String
    let routine: Routine
    var condition: BodyCondition
    
    init(name: String, routine: Routine) {
        self.name = name
        self.routine = routine
        self.condition = BodyCondition()
    }
}
