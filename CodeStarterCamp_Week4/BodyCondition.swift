//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 정선아 on 2022/05/08.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(startingPoint: Int) {
        self.upperBodyStrength = startingPoint
        self.lowerBodyStrength = startingPoint
        self.muscularEndurance = startingPoint
        self.fatigue = startingPoint
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func checkYourCondition() {
        print("🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigue)")
        print("🛣🛣🛣🛣🛣🛣🛣🛣🛣🛣🛣🛣🛣🛣")
    }
}
