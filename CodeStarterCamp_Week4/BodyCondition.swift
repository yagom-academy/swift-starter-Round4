//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscleEndurance: Int
    var tiredness = 0
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscleEndurance: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscleEndurance = muscleEndurance
    }
    
    func increaseUpperBodyStrength(by amount: Int) {
        upperBodyStrength += amount
    }
    
    func declineUpperBodyStrength(by amount: Int) {
        upperBodyStrength -= amount
        if upperBodyStrength < 0 {
            upperBodyStrength = 0
        }
    }
    
    func increaseLowerBodyStrength(by amount: Int) {
        lowerBodyStrength += amount
    }
    
    func declineLowerBodyStrength(by amount: Int) {
        lowerBodyStrength -= amount
        if lowerBodyStrength < 0 {
            lowerBodyStrength = 0
        }
    }
    
    func increaseMuscleEndurance(by amount: Int) {
        muscleEndurance += amount
    }
    
    func declineMuscleEndurance(by amount: Int) {
        muscleEndurance -= amount
        if muscleEndurance < 0 {
            muscleEndurance = 0
        }
    }
    
    func increaseTiredness(by amount: Int) {
        tiredness += amount
    }
    
    func declineTiredness(by amount: Int) {
        tiredness -= amount
        if tiredness < 0 {
            tiredness = 0
        }
    }
    
    func informBodyCondition(){
        let informationOfBodyCondition = """
상체근력 : \(upperBodyStrength)
하체근력 : \(lowerBodyStrength)
근지구력 : \(muscleEndurance)
피로도  : \(tiredness)
"""
        print(newLineString)
        print(informationOfBodyCondition)
    }
}
