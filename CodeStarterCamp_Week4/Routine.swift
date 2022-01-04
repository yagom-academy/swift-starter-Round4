//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by marisol on 2022/01/05.
//

import Foundation

class Routine {
    let name: String
    let exercises: [Exercise]
    
    init(name: String, exercises: [Exercise]) {
        self.name = name
        self.exercises = exercises
    }
}
