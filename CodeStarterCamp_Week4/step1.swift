//
//  step1.swift
//  CodeStarterCamp_Week4
//
//  Created by 한서영 on 2022/07/12.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int = 0
    var lowerBodyStrength: Int = 0
    var muscularEndurance: Int = 0
    var fatigue: Int = 0
    
    func changeCondition(_ conditionName: String, degree: Int) {
        switch (conditionName) {
        case "상체근력": self.upperBodyStrength += degree
        case "하체근력": self.lowerBodyStrength += degree
        case "근지구력": self.muscularEndurance += degree
        case "피로도": self.fatigue += degree
        default:
            <#code#>
        }
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { (bodyCondition: BodyCondition) in
    bodyCondition.changeCondition("상체근력", degree: Int.random(in: 10...20))
    bodyCondition.changeCondition("하체근력", degree: Int.random(in: 10...20))
})
