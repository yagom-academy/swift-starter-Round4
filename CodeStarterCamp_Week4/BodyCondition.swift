//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by Lee minyeol on 2023/06/14.
//

import Foundation

class BodyCondition {
    var upperBodyMuscle: Int
    var lowerBodyMuscle: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(upperBodyMuscle: Int, lowerBodyMuscle: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyMuscle = upperBodyMuscle
        self.lowerBodyMuscle = lowerBodyMuscle
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
}
