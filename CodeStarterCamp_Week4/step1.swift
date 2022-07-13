//
//  step1.swift
//  CodeStarterCamp_Week4
//
//  Created by smfc on 12/7/2022.
//

import Foundation
import SwiftUI

struct BodyCondition {
    var upperBodyMuscleStrength: Int = Int.random(in: 10...20)
    var lowerBodyMuscleStrength: Int = Int.random(in: 10...20)
    var muscularEndurance: Int = Int.random(in: 10...20)
    var bodyFatigue: Int = Int.random(in: 10...20)
    
    mutating func changeUpperBodyMuscleStrength(add number: Int) {
        self.upperBodyMuscleStrength += number
    }
    
    mutating func changeLowerBodyMuscleStrength(add number: Int) {
        self.lowerBodyMuscleStrength += number
    }
    
    mutating func changeMuscularEndurance(add number: Int) {
        self.muscularEndurance += number
    }
    
    mutating func plusBodyFatigue(number: Int) {
        self.bodyFatigue += number
    }
    
    mutating func minusBodyFatigue(number: Int) {
        self.bodyFatigue -= number
    }
    
    func printCondition() {
        print("""
        --------------
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(upperBodyMuscleStrength)
        하체근력: \(lowerBodyMuscleStrength)
        근지구력: \(muscularEndurance)
        피로도: \(bodyFatigue)
        --------------
        """)
    }
}

var conditonOfJae: BodyCondition = BodyCondition()
