//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by 서원지 on 2022/01/05.
//

import Foundation

final class Person {
    let name: String
    let bodyCondition: BodyCondition
    
    init(name: String, bodyCondition: BodyCondition ) {
        self.name = name
        self.bodyCondition = bodyCondition
    }
    
    func exersise(for set: Int, routine: Routine) throws {
        for setOrder in 1 ... set {
            try routine.start(for: setOrder)
        }
    }
}
