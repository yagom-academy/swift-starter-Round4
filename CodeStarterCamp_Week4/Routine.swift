//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 정선아 on 2022/05/08.
//

import Foundation

struct Routine {
    let routineName: String
    let exercises: [Exercise]
    
    init(routineName: String, exercises: [Exercise]) {
        self.routineName = routineName
        self.exercises = exercises
        }
}
