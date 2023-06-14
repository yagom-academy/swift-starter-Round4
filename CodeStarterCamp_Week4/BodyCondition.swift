//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 심정민 on 2023/06/14.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigability: Int
    
    func printCondition() {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength)")
        print("상체근력: \(lowerBodyStrength)")
        print("상체근력: \(muscularEndurance)")
        print("상체근력: \(fatigability)")
        print("--------------")
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigability: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigability = fatigability
    }
}
