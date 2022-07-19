//
//  bodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by junho lee on 2022/07/19.
//

import Foundation

class BodyCondition {
    private var upperBodyMuscleStrength: Int {
        didSet {
            print("상체근력이 \(upperBodyMuscleStrength - oldValue) 상승합니다.")
        }
    }
    private var lowerBodyMuscleStrength: Int {
        didSet {
            print("하체근력이 \(lowerBodyMuscleStrength - oldValue) 상승합니다.")
        }
    }
    private var muscularEndurance: Int {
        didSet {
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    private var fatigue: Int {
        didSet {
            if fatigue > oldValue {
                print("피로도가 \(fatigue - oldValue) 상승합니다.")
            } else {
                print("피로도가 \(oldValue - fatigue) 하락합니다.")
            }
        }
    }
    
    init(upperBodyMuscleStrength: Int,
         lowerBodyMuscleStrength: Int,
         muscularEndurance: Int,
         fatigue: Int) {
        self.upperBodyMuscleStrength = upperBodyMuscleStrength
        self.lowerBodyMuscleStrength = lowerBodyMuscleStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func raiseUpperBodyMuscleStrength(_ strength: Int) {
        self.upperBodyMuscleStrength += strength
    }
    
    func raiseLowerBodyMuscleStrength(_ strength: Int) {
        self.lowerBodyMuscleStrength += strength
    }
    
    func raiseMuscularEndurance(_ endurance: Int) {
        self.muscularEndurance += endurance
    }
    
    func raiseFatigue(_ fatigue: Int) {
        self.fatigue += fatigue
    }
    
    func dropFatigue(_ fatigue: Int) {
        self.fatigue = fatigue > self.fatigue ? 0 : self.fatigue - fatigue
    }
    
    func printCurrentBodyCondition() {
        print("현재의 컨디션은 다음과 같습니다.",
              "상체근력: \(self.upperBodyMuscleStrength)",
              "하체근력: \(self.lowerBodyMuscleStrength)",
              "근지구력: \(self.muscularEndurance)",
              "피로도: \(self.fatigue)",
              "--------------"
              ,separator: "\n")
    }
}
