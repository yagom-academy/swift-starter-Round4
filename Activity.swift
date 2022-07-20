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
        let range = min < max ? min...max : max...min
        condition.upperBodyStrength += Int.random(in: range) - (condition.upperBodyStrength / (5000 / max))
    }
    
    func lowerGrowth(condition: BodyCondition, min: Int, max: Int) {
        let range = min < max ? min...max : max...min
        condition.lowerBodyStrength += Int.random(in: range) - (condition.lowerBodyStrength / (5000 / max))
    }
    
    func enduranceGrowth(condition: BodyCondition, min: Int, max: Int) {
        let range = min < max ? min...max : max...min
        condition.muscularEndurance += Int.random(in: range) - (condition.muscularEndurance / (10000 / max))
    }
    
    func changeFatigue(condition: BodyCondition, min: Int, max: Int, rest: Bool = false) {
        if rest != true {
            let range = min < max ? min...max : max...min
            condition.fatigue += Int.random(in: range) + (condition.fatigue / 10)
        } else {
            let range = min < max ? min...max : max...min
            condition.fatigue += ((-1)*(Int.random(in: range))) + (condition.fatigue / 20)
        }
    }
}
