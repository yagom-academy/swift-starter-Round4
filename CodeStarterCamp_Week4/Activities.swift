//
//  Activities.swift
//  CodeStarterCamp_Week4
//
//  Created by minsong kim on 2023/03/14.
//

import Foundation

enum Activity {
    case sitUp, squat, loongDistanceRunning, pushUp, DynamicResting
    
    var name: String {
        switch self {
        case .sitUp:
            return "윗몸 일으키기"
        case .squat:
            return "스쿼트"
        case .loongDistanceRunning:
            return "오래 달리기"
        case .pushUp:
            return "팔굽혀펴기"
        case .DynamicResting:
            return "동적휴식"
        }
    }
    
    func action(_ type: BodyCondition) {
        switch self {
        case .sitUp: do {
            print("<<윗몸 일으키기을(를) 시작합니다.>>")
            type.upperBodyStrength += Int.random(in: 10...20)
            type.fatigability += Int.random(in: 10...20)
            type.conditionCheck()
            return 
        }
        case .squat: do {
            print("<<스쿼트을(를) 시작합니다.>>")
            type.lowerBodyStrength += Int.random(in: 20...30)
            type.fatigability += Int.random(in: 10...20)
            type.conditionCheck()
        }
        case .loongDistanceRunning: do {
            print("<<오래달리기을(를) 시작합니다.>>")
            type.upperBodyStrength += Int.random(in: 5...10)
            type.lowerBodyStrength += Int.random(in: 5...10)
            type.muscularEndurance += Int.random(in: 20...30)
            type.fatigability += Int.random(in: 20...30)
            type.conditionCheck()
        }
        case .pushUp: do {
            print("<<팔굽혀펴기을(를) 시작합니다.>>")
            type.upperBodyStrength += Int.random(in: 20...30)
            type.fatigability += Int.random(in: 15...20)
        }
        case .DynamicResting: do {
            print("<<동적휴식을(를) 시작합니다.>>")
            guard type.fatigability >= 0 else {
                print("현재 피로도가 0 입니다.")
                return
            }
            for index in 1...10 {
                if type.fatigability <= index {
                    type.fatigability -= Int.random(in: 1...index)
                    break
                }
            }
            type.conditionCheck()
        }
        }
    }
}
