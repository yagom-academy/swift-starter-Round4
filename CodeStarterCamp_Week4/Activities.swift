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
    
    func action(_ member: BodyCondition) {
        switch self {
        case .sitUp:
            print("<<윗몸 일으키기을(를) 시작합니다.>>")
            member.upperBodyStrength += Int.random(in: 10...20)
            member.fatigability += Int.random(in: 10...20)
        case .squat:
            print("<<스쿼트을(를) 시작합니다.>>")
            member.lowerBodyStrength += Int.random(in: 20...30)
            member.fatigability += Int.random(in: 10...20)
        case .loongDistanceRunning:
            print("<<오래달리기을(를) 시작합니다.>>")
            member.upperBodyStrength += Int.random(in: 5...10)
            member.lowerBodyStrength += Int.random(in: 5...10)
            member.muscularEndurance += Int.random(in: 20...30)
            member.fatigability += Int.random(in: 20...30)
        case .pushUp:
            print("<<팔굽혀펴기을(를) 시작합니다.>>")
            member.upperBodyStrength += Int.random(in: 20...30)
            member.fatigability += Int.random(in: 15...20)
        case .DynamicResting:
            print("<<동적휴식을(를) 시작합니다.>>")
            member.fatigability -= Int.random(in: 5...10)
        }
    }
}
