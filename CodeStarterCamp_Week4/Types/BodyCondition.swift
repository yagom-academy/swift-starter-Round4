//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by Jungmo Yu on 2021/12/31.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: UInt = 0
    var lowerBodyStrength: UInt = 0
    var muscularEndurance: UInt = 0
    var fatigue: Int = 0
    
    func printBodyCondition() {
        print("상체근력: \(self.upperBodyStrength)")
        print("하체근력: \(self.lowerBodyStrength)")
        print("근지구력: \(self.muscularEndurance)")
        print("피로도: \(self.fatigue)")
    }
}

