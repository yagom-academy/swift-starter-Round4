//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by Lee minyeol on 2023/06/14.
//

import Foundation

class BodyCondition {
    var upperBodyMuscle: Int
    var lowerBodtMuscle: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(upperBodyMuscle: Int, lowerBodtMuscle: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyMuscle = upperBodyMuscle
        self.lowerBodtMuscle = lowerBodtMuscle
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
}
