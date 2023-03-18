//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by Daehoon Lee on 2023/03/15.
//

import Foundation

enum Activity {
    case sitUp
    case squat
    case longRun
    case dynamicBreak
    
    var name: String {
        switch self {
        case .sitUp:
            return "윗몸일으키기"
        case .squat:
            return "스쿼트"
        case .longRun:
            return "오래달리기"
        case .dynamicBreak:
            return "동적휴식"
        }
    }
    
    var action: (BodyCondition) throws -> Void {
        switch self {
        case .sitUp:
            return {
                print("<<\(self.name)을(를) 시작합니다.>>")
                try $0.warnExcessiveFatigue()
                $0.upperBodyStrength += 13
                $0.fatigability += 18
                print("--------------")
            }
        case .squat:
            return {
                print("<<\(self.name)을(를) 시작합니다.>>")
                try $0.warnExcessiveFatigue()
                $0.lowerBodyStrength += 20
                $0.fatigability += 25
                print("--------------")
            }
        case .longRun:
            return {
                print("<<\(self.name)을(를) 시작합니다.>>")
                try $0.warnExcessiveFatigue()
                $0.muscularEndurance += Int.random(in: 20...30)
                $0.upperBodyStrength += Int.random(in: 5...10)
                $0.lowerBodyStrength += Int.random(in: 5...10)
                $0.fatigability += Int.random(in: 20...30)
                print("--------------")
            }
        case .dynamicBreak:
            return {
                print("<<\(self.name)을(를) 시작합니다.>>")
                try $0.warnExcessiveFatigue()
                $0.fatigability += -7
                print("--------------")
            }
        }
    }
}
