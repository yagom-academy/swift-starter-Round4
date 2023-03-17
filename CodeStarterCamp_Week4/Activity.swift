//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by suyeon park on 2023/03/14.
//

import Foundation


//활동 타입
struct Activity {
    
    enum ActivityType {
        case UpperBody, LowerBody, Muscular, Fatigue, Relax
    }
    
    let name: String
    let action: (BodyCondition) -> Void
    
    func startActivity(activityType: ActivityType, bodyCondition: BodyCondition, from start: Int, to end: Int) {
        let value = Int.random(in: start...end)
        
        switch(activityType) {
        case .UpperBody:
            printBodyStrength(activityType: activityType, strength: value)
            bodyCondition.upperBodyStrength += value
        case .LowerBody:
            printBodyStrength(activityType: activityType, strength: value)
            bodyCondition.lowerBodyStrength += value
        case .Muscular:
            printBodyStrength(activityType: activityType, strength: value)
            bodyCondition.muscularEndurance += value
        case .Fatigue:
            print("피로도가 \(value) 상승합니다.")
            bodyCondition.fatigue += value
        case .Relax:
            print("피로도가 \(value) 하락합니다.")
            bodyCondition.fatigue -= value
        }
    }
    
    func printStartMessage(name: String) {
        print("<<\(name)을(를) 시작합니다>>")
    }

    func printMyBodyCondition(bodyCondition: BodyCondition) {
        print("--------------\n현재의 컨디션은 다음과 같습니다.\n상체근력:\(bodyCondition.upperBodyStrength)\n하체근력: \(bodyCondition.lowerBodyStrength)\n근지구력: \(bodyCondition.muscularEndurance)\n피로도: \(bodyCondition.fatigue)\n--------------")
    }
    
    private func printBodyStrength(activityType: ActivityType, strength: Int) {
        switch(activityType) {
        case .UpperBody:
            print("상체근력이 \(strength) 상승합니다.")
        case .LowerBody:
            print("하체근력이 \(strength) 상승합니다.")
        case .Muscular:
            print("근지구력이 \(strength) 상승합니다.")
        default: break
        }
    }
}







