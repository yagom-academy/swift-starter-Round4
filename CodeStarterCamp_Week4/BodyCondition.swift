//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by tom on 2023/03/14.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func check(_ bodyCondition: BodyCondition) {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(bodyCondition.upperBodyStrength)")
        print("하체근력: \(bodyCondition.lowerBodyStrength)")
        print("근지구력: \(bodyCondition.muscularEndurance)")
        print("피로도: \(bodyCondition.fatigue)")
    }
}
