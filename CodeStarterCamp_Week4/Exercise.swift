//
//  Exercise.swift
//  CodeStarterCamp_Week4
//
//  Created by Wonbi on 2022/05/12.
//

import Foundation

enum Exercise {
    case sitUp
    case squats
    case deadLift
    case benchPress
    case runningLongTime
    case activeRest
    
    var name: String {
        switch self {
        case .sitUp:
            return "윗몸일으키기"
        case .squats:
            return "스쿼트"
        case .deadLift:
            return "데드리프트"
        case .benchPress:
            return "벤치프레스"
        case .runningLongTime:
            return "오래달리기"
        case .activeRest:
            return "동적휴식"
        }
    }
    
    var action: (BodyCondition) -> () {
        switch self {
        case .sitUp:
            return {bodyCondition in
                bodyCondition.upperBodyMuscleStrength += Int.random(in: 10...20)
                bodyCondition.tiredness += Int.random(in: 10...20)
            }
        case .squats:
            return {bodyCondition in
                bodyCondition.lowerBodyMuscleStrength += Int.random(in: 20...30)
                bodyCondition.tiredness += Int.random(in: 10...20)
            }
        case .deadLift:
            return {bodyCondition in
                bodyCondition.upperBodyMuscleStrength += Int.random(in: 10...20)
                bodyCondition.lowerBodyMuscleStrength += Int.random(in: 10...20)
                bodyCondition.tiredness += Int.random(in: 10...20)
            }
        case .benchPress:
            return {bodyCondition in
                bodyCondition.upperBodyMuscleStrength += Int.random(in: 20...30)
                bodyCondition.tiredness += Int.random(in: 10...20)
            }
        case .runningLongTime:
            return {bodyCondition in
                bodyCondition.upperBodyMuscleStrength += Int.random(in: 5...10)
                bodyCondition.lowerBodyMuscleStrength += Int.random(in: 10...20)
                bodyCondition.musclerEndurance += Int.random(in: 20...30)
                bodyCondition.tiredness += Int.random(in: 10...20)
            }
        case .activeRest:
            return {bodyCondition in
                bodyCondition.tiredness -= Int.random(in: 10...20)
            }
        }
    }
}
