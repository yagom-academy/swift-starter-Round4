//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 서원지 on 2022/01/05.
//

import Foundation

final class BodyCondition {
    
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int,  muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
}
