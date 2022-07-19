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
    
    func growth(minimum: Int, maximum: Int, current: Int) -> Int {
        guard maximum > minimum  else { return 0 }
            return Int.random(in: minimum...maximum) - (current / (5000 / maximum))
    }
    
    func changeFatigue(minimum: Int, maximum: Int, rest: Bool = false, current: Int) -> Int {
        guard maximum > minimum else { return 0 }
        var fatigue = current / 10
        if rest == false {
            fatigue += Int.random(in: minimum...maximum)
        } else {
            fatigue -= Int.random(in: minimum...maximum)
        }
        return fatigue
    }
}
