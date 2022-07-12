//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    mutating func buildUpperBodyStrength(from low: Int, to high: Int) {
        let randomNumber: Int
        randomNumber = Int.random(in: low...high)
        print("randomNumber : + \(randomNumber)")
        self.upperBodyStrength += randomNumber
        print("current upperBOdyStrength : \(self.upperBodyStrength)")
    }
    mutating func buildLowerBodyStrength() {
        
    }
    mutating func buildMuscularEndurance() {
        
    }
    mutating func reduceFatigue() {
        
    }
}

//활동 타입
struct Activity {
        let name: String
        let action: (BodyCondition) -> Void
}
var myBodyCondition: BodyCondition = BodyCondition(upperBodyStrength: 50, lowerBodyStrength: 50, muscularEndurance: 50, fatigue: 30)


//예시 활동
let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기",
                                                         action: { bodyCondition in
    print("-----------START STEP1-----------\n")
    print("<<<<<<In 윗몸일으키기>>>>>>")
        //BodyCondition에 영향을 주는 클로저 내용
    myBodyCondition.buildUpperBodyStrength(from: 10, to: 20)
    myBodyCondition.reduceFatigue()
    
})
윗몸일으키기.action(myBodyCondition)
