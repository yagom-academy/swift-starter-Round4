//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by suyeon park on 2023/03/14.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int {
        didSet {
            if self.fatigue < 0 {
                self.fatigue = 0
            }
        }
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
}
