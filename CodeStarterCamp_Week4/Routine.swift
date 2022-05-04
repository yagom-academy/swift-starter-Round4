//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 이정민 on 2022/05/04.
//

import Foundation

struct Routine {
    let routineName: String
    let exercises: [Exercise]
    
    init(called routineName: String, exercises: [Exercise]) {
        self.routineName = routineName
        self.exercises = exercises
    }
}
