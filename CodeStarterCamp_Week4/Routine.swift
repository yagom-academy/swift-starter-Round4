//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by tom on 2023/03/15.
//

import Foundation


class Routine {
    let name: String
    var activities : [Activity]
    
    init(name: String, activities: [Activity]) {
        self.name = name
        self.activities = activities
    }
}
