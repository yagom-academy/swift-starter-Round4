//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by mingmac on 2022/05/08.
//

import Foundation

class BodyCondition {
    var upperBodyMuscleStrength: Int
    var lowerBodyMuscleStrength: Int
    var muscularEndurance: Int
    var tiredness: Int
    
    init(upperBodyMuscleStrength: Int, lowerBodyMuscleStrength: Int, muscularEndurance: Int, tiredness: Int) {
        self.upperBodyMuscleStrength = upperBodyMuscleStrength
        self.lowerBodyMuscleStrength = lowerBodyMuscleStrength
        self.muscularEndurance = muscularEndurance
        self.tiredness = tiredness
    }
    
    func selectRandomStatusIndex(min: Int, max: Int) -> Int {
        let status = Int.random(in: min...max)
        return status
    }
    
    func changeStatusAfterSitup() {
        upperBodyMuscleStrength += selectRandomStatusIndex(min: 10, max: 20)
        tiredness += selectRandomStatusIndex(min: 10, max: 20)
    }
    
    func changeStatusAfterSquat() {
        lowerBodyMuscleStrength += selectRandomStatusIndex(min: 20, max: 30)
        tiredness += selectRandomStatusIndex(min: 10, max: 20)
    }
    
    func changeStatusAfterlongRunning() {
        upperBodyMuscleStrength += selectRandomStatusIndex(min: 5, max: 10)
        lowerBodyMuscleStrength += selectRandomStatusIndex(min: 5, max: 10)
        muscularEndurance += selectRandomStatusIndex(min: 20, max: 30)
        tiredness += selectRandomStatusIndex(min: 20, max: 30)
    }
    
    func changeStatusAfterActiveRest() {
        tiredness -= selectRandomStatusIndex(min: 5, max: 10)
    }
    
    func printMucleStatus() {
        print("--------------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyMuscleStrength)")
        print("하체근력: \(lowerBodyMuscleStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(tiredness)")
    }
}
