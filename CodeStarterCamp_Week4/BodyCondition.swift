//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 이정민 on 2022/05/04.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int = 0
    var lowerBodyStrength: Int = 0
    var endurancePower: Int = 0
    var fatigue: Int = 0
}

extension Int {
    mutating func increaseWeights(from start: Int, to end: Int) {
        self = self + Int.random(in: start...end)
    }
    
    mutating func decreaseWeights(from start: Int, to end: Int) {
        self = self - Int.random(in: start...end)
    }
}
