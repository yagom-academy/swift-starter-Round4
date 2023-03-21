//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by suyeon park on 2023/03/14.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        didSet(oldValue) {
            printBodyStrength(activityType: .UpperBody, strength: (self.upperBodyStrength-oldValue))
        }
    }
    var lowerBodyStrength: Int {
        didSet(oldValue) {
            printBodyStrength(activityType: .LowerBody, strength: (self.lowerBodyStrength-oldValue))
        }
    }
    var muscularEndurance: Int {
        didSet(oldValue) {
            printBodyStrength(activityType: .Muscular, strength: (self.muscularEndurance-oldValue))
        }
    }
    var fatigue: Int {
        didSet(oldValue) {
            if oldValue > self.fatigue {
                print("피로도가 \(oldValue-self.fatigue) 하락합니다.")
            } else if oldValue < self.fatigue{
                print("피로도가 \(self.fatigue-oldValue) 상승합니다.")
            }
        }
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func printBodyStrength(activityType: ActivityType, strength: Int) {
        switch(activityType) {
        case .UpperBody:
            print("상체근력이 \(strength) 상승합니다.")
        case .LowerBody:
            print("하체근력이 \(strength) 상승합니다.")
        case .Muscular:
            print("근지구력이 \(strength) 상승합니다.")
        default: break
        }
    }
    
    func printMyBodyCondition() {
        print("현재의 컨디션은 다음과 같습니다.\n상체근력:\(upperBodyStrength)\n하체근력: \(lowerBodyStrength)\n근지구력: \(muscularEndurance)\n피로도: \(fatigue)\n--------------")
    }
}
