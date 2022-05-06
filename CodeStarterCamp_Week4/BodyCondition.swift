//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by Seong A Oh on 2022/05/06.
//

import Foundation

class BodyCondition {
    var name: String
    var upperBodyStrength: Int // 상체근력
    var lowerBodyStrength: Int // 하체근력
    var muscularEndurance: Int // 근지구력
    var fatigue: Int // 피로도
    
    init(name: String, upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.name = name
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
}
