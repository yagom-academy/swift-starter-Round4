//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 맨태 on 1/25/24.
//

import Foundation

class BodyCondition {
    private var condition: Health = .good
    private var upperBody: Int = 50
    private var lowerBody: Int = 50
    private var stamina: Int = 50
    private var fatigue: Int = 0 {
        didSet {
            if fatigue < 0 { fatigue = 0 }
            updateCondition()
        }
    }
    
    private func updateCondition() {
        switch fatigue {
        case 0..<100: condition = .good
        case 100..<150: condition = .bad
        default: condition = .injury
        }
    }
    
    func healedInjury() {
        fatigue = 0
    }
    
    func updateHealthPoint(to bodyPart: BodyPart, with value: Int) {
        if condition == .injury {
            print("심각한 부상을 입었기 때문에 동작을 수행할 수 없습니다. 병원에 가야 합니다.")
            return
        }
        
        var activityInfoText: String = "\(bodyPart.name)이(가) \(abs(value)) "
        activityInfoText += value < 0 ? "하락합니다." : "상승합니다."
        
        switch bodyPart {
        case .upper: 
            upperBody += value
        case .lower: 
            lowerBody += value
        case .stamina:
            stamina += value
        case .fatigue:
            fatigue += value
        }
        
        print(activityInfoText)
    }
    
    func printStatus() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBody)")
        print("하체근력: \(lowerBody)")
        print("근지구력: \(stamina)")
        print("피로도: \(fatigue)")
        print("--------------")
        
    }
}
