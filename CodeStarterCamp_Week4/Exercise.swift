//
//  Exercise.swift
//  CodeStarterCamp_Week4
//
//  Created by Seong A Oh on 2022/05/06.
//

import Foundation

struct Exercise {
    let name: String
    let action: (BodyCondition) -> Void
}

class Routine {
    var name: String
    var exercises: [Exercise]
    
    init(name: String, exercises: [Exercise]) {
        self.name = name
        self.exercises = exercises
    }
}
