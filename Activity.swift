//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by 이준영 on 2022/07/19.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
    
    func upperGrowth(condition: BodyCondition, min: Int, max: Int) {
        condition.upperBodyStrength += Int.random(in: min...max) - (condition.upperBodyStrength / (5000 / max))
    }
    
    func lowerGrowth(condition: BodyCondition, min: Int, max: Int) {
        condition.lowerBodyStrength += Int.random(in: min...max) - (condition.lowerBodyStrength / (5000 / max))
    }
    
    func enduranceGrowth(condition: BodyCondition, min: Int, max: Int) {
        condition.muscularEndurance += Int.random(in: min...max) - (condition.muscularEndurance / (10000 / max))
    }
    
    func changeFatigue(condition: BodyCondition, min: Int, max: Int, rest: Bool = false) {
        if rest != true {
            condition.fatigue += Int.random(in: min...max) + (condition.fatigue / 10)
        } else {
            condition.fatigue += ((-1)*(Int.random(in: min...max))) + (condition.fatigue / 20)
        }
    }
}
