//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    var bodyCondition: BodyCondition
    
    init (name: String, bodyCondition: BodyCondition) {
        self.name = name
        self.bodyCondition = bodyCondition
    }
    
    func exercise(for set: Int, routine: Routine) {
        print("\(set)Set ", terminator: "")
        routine.startRoutine(based: bodyCondition)
    }
}
