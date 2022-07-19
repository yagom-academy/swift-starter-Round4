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
        if min < max {
            condition.upperBodyStrength += Int.random(in: min...max) - (condition.upperBodyStrength / (5000 / max))
        } else {
            condition.upperBodyStrength += Int.random(in: max...min) - (condition.upperBodyStrength / (5000 / max))
        }
    }
    
    func lowerGrowth(condition: BodyCondition, min: Int, max: Int) {
        if min < max {
            condition.lowerBodyStrength += Int.random(in: min...max) - (condition.lowerBodyStrength / (5000 / max))
        } else {
            condition.lowerBodyStrength += Int.random(in: max...min) - (condition.lowerBodyStrength / (5000 / max))
        }
    }
    
    func enduranceGrowth(condition: BodyCondition, min: Int, max: Int) {
        if min < max {
            condition.muscularEndurance += Int.random(in: min...max) - (condition.muscularEndurance / (10000 / max))
        } else {
            condition.muscularEndurance += Int.random(in: max...min) - (condition.muscularEndurance / (10000 / max))
        }
    }
    
    func changeFatigue(condition: BodyCondition, min: Int, max: Int, rest: Bool = false) {
        if rest != true {
            if min < max {
                condition.fatigue += Int.random(in: min...max) + (condition.fatigue / 10)
            } else {
                condition.fatigue += Int.random(in: max...min) + (condition.fatigue / 10)
            }
        } else {
            if min < max {
                condition.fatigue += ((-1)*(Int.random(in: min...max))) + (condition.fatigue / 20)
            } else {
                condition.fatigue += ((-1)*(Int.random(in: max...min))) + (condition.fatigue / 20)
            }
        }
    }
}
