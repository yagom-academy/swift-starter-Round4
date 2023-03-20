//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by suyeon park on 2023/03/14.
//

import Foundation

//활동 타입
struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
    
    init(name: String, action: @escaping (BodyCondition) -> Void) {
        self.name = name
        self.action = action
    }
    
    static func startActivity(activityType: ActivityType, bodyCondition: BodyCondition, from start: Int, to end: Int) {
     
        let value = Int.random(in: start...end)
        
        switch(activityType) {
        case .UpperBody:
            bodyCondition.upperBodyStrength += value
        case .LowerBody:
            bodyCondition.lowerBodyStrength += value
        case .Muscular:
            bodyCondition.muscularEndurance += value
        case .Fatigue:
            bodyCondition.fatigue += value
        case .Relax:
            bodyCondition.fatigue -= value
        }
    }
    
    func exercise(bodyCondition: BodyCondition) {
        printStartMessage()
        action(bodyCondition)
    }
    
    private func printStartMessage() {
        print("<<\(name)을(를) 시작합니다>>")
    }
}







