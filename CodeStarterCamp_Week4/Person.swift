//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by 정선아 on 2022/05/10.
//

import Foundation

struct Person {
    var name: String
    let bodyCondition: BodyCondition
    
    init(name: String, bodyCondition: BodyCondition) {
        self.name = name
        self.bodyCondition = bodyCondition
    }
    
    func doExercise(for set: Int, routine: Routine) {
        
    }
}
