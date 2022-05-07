//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by Jiyoung Lee on 2022/05/07.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var musclarEndurance: Int
    var fatigue: Int
    
    func showStatus() {
        print("""
        --------------
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(bodyCondition.upperBodyStrength)
        하체근력: \(bodyCondition.lowerBodyStrength)
        근지구력: \(bodyCondition.musclarEndurance)
        피로도: \(bodyCondition.fatigue)
        """)
    }
}
