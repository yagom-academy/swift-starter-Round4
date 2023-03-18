//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by Daehoon Lee on 2023/03/15.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int = 94 {
        didSet(oldValue) {
            print("상체근력이 \(upperBodyStrength - oldValue) 상승합니다.")
        }
    }
    var lowerBodyStrength: Int = 40 {
        didSet(oldValue) {
            print("하체근력이 \(lowerBodyStrength - oldValue) 상승합니다.")
        }
    }
    var muscularEndurance: Int = 90 {
        didSet(oldValue) {
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    var fatigability: Int = 8 {
        didSet(oldValue) {
            if fatigability >= oldValue {
                print("피로도가 \(fatigability - oldValue) 상승합니다.")
            } else {
                print("피로도가 \(oldValue - fatigability) 하락합니다.")
            }
        }
    }
    
    func printMeasuredBodyCondition() {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(self.upperBodyStrength)")
        print("하체근력: \(self.lowerBodyStrength)")
        print("근지구력: \(self.muscularEndurance)")
        print("피로도: \(self.fatigability)")
        print("--------------")
    }
    
    func warnExcessiveFatigue() throws {
        guard self.fatigability < 100 else {
            throw HealthTrainingError.overFatigability
        }
    }
}
