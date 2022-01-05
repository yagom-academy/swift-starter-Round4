//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 서원지 on 2022/01/05.
//

import Foundation

final class BodyCondition {
    
    var upperBodyStrength = 0
    var lowerBodyStrength = 0
    var muscularEndurance = 0
    var fatigue = 0
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int,  muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func printBodyCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다 ")
        print("상체근력 : \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigue)")
    }
}
