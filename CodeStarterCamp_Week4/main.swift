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
    
    func checkCurrentCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(self.upperBodyStrength)")
        print("하체근력: \(self.lowerBodyStrength)")
        print("근지구력: \(self.muscularEndurance)")
        print("피로도: \(self.fatigue)")
    }
}

struct Exercise {
    let name: String
    let action: () -> Void
}

var myBody = Bodycondition(upperBS: 50, lowerBS: 50, muscular: 50, fatigue: 0)
