//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 김인호 on 2022/05/04.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    mutating func changeCondition(of bodyPart: String, about intensity: Int) {
        switch bodyPart {
        case "upperBodyStrength":
            upperBodyStrength += intensity
        case "lowerBodyStrength":
            lowerBodyStrength += intensity
        case "muscularEndurance":
            muscularEndurance += intensity
        default:
            fatigue += intensity
        }
    }
    
    func showCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigue)")
    }
}
