//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by Jungmo Yu on 2021/12/31.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int = 0
    var lowerBodyStrength: Int = 0
    var muscularEndurance: Int = 0
    var fatigue: Int = 0
    
    func printBodyCondition() {
        print("상체근력: \(self.upperBodyStrength)")
        print("하체근력: \(self.lowerBodyStrength)")
        print("근지구력: \(self.muscularEndurance)")
        print("피로도: \(self.fatigue)")
    }
}

