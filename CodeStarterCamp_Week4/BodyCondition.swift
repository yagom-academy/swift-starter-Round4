//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by Wonbi on 2022/05/12.
//

import Foundation

class BodyCondition {
    var upperBodyMuscleStrength: Int = 0
    var lowerBodyMuscleStrength: Int = 0
    var musclerEndurance: Int = 0
    var tiredness: Int = 0
    
    func checkCondition() {
        print("""
              --------------
              현재의 컨디션은 다음과 같습니다.
              상체근력: \(upperBodyMuscleStrength)
              하체근력: \(lowerBodyMuscleStrength)
              근지구력: \(musclerEndurance)
              피로도: \(tiredness)
              """)
    }
}
