//
//  bodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 박세웅 on 2022/01/06.
//

import Foundation

class BodyCondition {
    var upperMuscles: Int
    var lowerMuscles: Int
    var endurance: Int
    var fatigue: Int
    
    init(upperMuscles: Int = 0, lowerMuscles: Int = 0, endurance: Int = 0, fatigue: Int = 0) {
        self.upperMuscles = upperMuscles
        self.lowerMuscles = lowerMuscles
        self.endurance = endurance
        self.fatigue = fatigue
    }
    
    func printBodyCondition() {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근육: \(upperMuscles)")
        print("하체근육: \(lowerMuscles)")
        print("근지구력: \(endurance)")
        print("피로도: \(fatigue)")
    }
}
