//
//  activity.swift
//  CodeStarterCamp_Week4
//
//  Created by Min Hyun on 2023/03/15.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

enum ActivityStorage {
    case sitUp, squat, running, activeRest, plank
    
    var activity: Activity {
        switch self {
        case.sitUp:
            return Activity(name: "윗몸일으키기", action: {
                $0.upperStrength += Int.random(in: 10...20)
                $0.fatigue += Int.random(in: 10...20)
            })
        case .squat:
            return Activity(name: "스쿼트", action: {
                $0.lowerStrength += Int.random(in: 20...30)
                $0.fatigue += Int.random(in: 10...20)
            })
        case .running:
            return Activity(name: "오래달리기", action: {
                $0.endurance += Int.random(in: 20...30)
                $0.upperStrength += Int.random(in: 5...10)
                $0.lowerStrength += Int.random(in: 5...10)
                $0.fatigue += Int.random(in: 20...30)
            })
        case .activeRest:
            return Activity(name: "동적휴식", action: {
                let randomNumber = Int.random(in: 5...10)
                guard randomNumber <= $0.fatigue else {
                    $0.fatigue = 0
                    return
                }
                $0.fatigue -= randomNumber
            })
        case .plank:
            return Activity(name: "플랭크", action: {
                $0.upperStrength += Int.random(in: 10...20)
                $0.fatigue += Int.random(in: 10...20)
            })
        }
    }
}
