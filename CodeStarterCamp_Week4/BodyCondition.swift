//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by tom on 2023/03/14.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        didSet { print("상체근력이 \(abs(oldValue - upperBodyStrength)) 상승합니다.") }
    }
    var lowerBodyStrength: Int {
        didSet { print("하체근력이 \(abs(oldValue - lowerBodyStrength)) 상승합니다.") }
    }
    var muscularEndurance: Int {
        didSet { print("근지구력이 \(abs(oldValue - muscularEndurance)) 상승합니다.") }
    }
    var fatigue: Int {
        didSet {
            if oldValue < fatigue {
                print("피로도가 \(abs(oldValue - fatigue)) 상승합니다.")
            } else {
                print("피로도가 \(abs(oldValue - fatigue)) 감소합니다.")
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
