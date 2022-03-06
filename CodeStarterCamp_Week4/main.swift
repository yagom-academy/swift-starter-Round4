//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let randomNum: (Int, Int) -> Int
randomNum = { (from: Int, to: Int) -> Int in
    return Int.random(in: from...to)
}

class Bodycondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(upperBS: Int = 0, lowerBS: Int = 0, muscular: Int = 0, fatigue: Int = 0) {
        self.upperBodyStrength = upperBS
        self.lowerBodyStrength = lowerBS
        self.muscularEndurance = muscular
        self.fatigue = fatigue
    }
}
