//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by tom on 2023/03/14.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        willSet { print("상체근력이 \(abs(upperBodyStrength - newValue)) 상승합니다.") }
    }
    var lowerBodyStrength: Int {
        willSet { print("하체근력이 \(abs(lowerBodyStrength - newValue)) 상승합니다.") }
    }
    var muscularEndurance: Int {
        willSet { print("근지구력이 \(abs(muscularEndurance - newValue)) 상승합니다.") }
    }
    var fatigue: Int {
        willSet {
            if newValue > fatigue {
                print("피로도가 \(abs(fatigue - newValue)) 상승합니다.")
            } else {
                print("피로도가 \(abs(fatigue - newValue)) 감소합니다.")
            }
        }
    }
    
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
