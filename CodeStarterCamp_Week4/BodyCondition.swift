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
    
    mutating func changeCondition(of bodyPart: Int, about intensity: Int) {
        switch bodyPart {
        case upperBodyStrength:
            upperBodyStrength += intensity
        case lowerBodyStrength:
            lowerBodyStrength += intensity
        case muscularEndurance:
            muscularEndurance += intensity
        case fatigue:
            fatigue += intensity
        default:
            return
        }
    }
    
    func showCondition() {
        let conditionInformation = """
            --------------
            현재의 컨디션은 다음과 같습니다.
            상체근력: \(upperBodyStrength)
            하체근력: \(lowerBodyStrength)
            근지구력: \(muscularEndurance)
            피로도: \(fatigue)
            """
        print(conditionInformation)
    }
}
