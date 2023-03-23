//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by Dean on 2023/03/23.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        didSet {
            print("상체근력이 \(self.upperBodyStrength - oldValue) 상승합니다")
        }
    }
    var lowerBodyStrength: Int {
        didSet {
            print("하체근력이 \(self.lowerBodyStrength - oldValue) 상승합니다")
        }
    }
    var muscleEndurance: Int {
        didSet {
            print("근지구력이 \(self.muscleEndurance - oldValue) 상승합니다")
        }
    }
    var fatigue: Int  {
        didSet {
            if oldValue > self.fatigue {
                print("피로도가 \(oldValue - self.fatigue) 감소합니다")
            } else {
                print("피로도가 \(self.fatigue - oldValue) 상승합니다")
            }
        }
    }
    
    func checkBodyCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(self.upperBodyStrength)")
        print("하체근력: \(self.lowerBodyStrength)")
        print("근지구력: \(self.muscleEndurance)")
        print("피로도: \(self.fatigue)")
        print("--------------")
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscleEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscleEndurance = muscleEndurance
        self.fatigue = fatigue
    }
}
