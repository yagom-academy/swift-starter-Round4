//
//  Exercise.swift
//  CodeStarterCamp_Week4
//
//  Created by ByungHoon Ann on 2022/11/08.
//

import Foundation

enum Exercise: String, CaseIterable {
    case sitUp = "윗몸일으키기"
    case squat = "스쿼트"
    case longRun = "오래달리기"
    case dynamicBreak = "동적휴식"
    
    var muscularPart: String {
        switch self {
        case .sitUp:
            return "상체 근력"
        case .squat:
            return "하체 근력"
        case .longRun:
            return "근지구력"
        case .dynamicBreak:
            return "피로도"
        }
    }
    
    var upperMuscleStrength : Int {
        switch self {
        case .sitUp:
            return Int.random(in: 10...20)
        case .longRun:
            return Int.random(in: 5...10)
        default:
            return 0
        }
    }
    
    var lowerMuscleStrength : Int {
        switch self {
        case .squat:
            return Int.random(in: 20...30)
        case .longRun:
            return Int.random(in: 5...10)
        default:
            return 0
        }
    }
    
    var muscularEndurance: Int {
        switch self {
        case .longRun:
            return Int.random(in: 20...30)
        default:
            return 0
        }
    }
    
    var fatigue: Int {
        switch self {
        case .sitUp, .squat:
            return Int.random(in: 10...20)
        case .longRun:
            return Int.random(in: 20...30)
        case .dynamicBreak:
            return -Int.random(in: 5...10)
        }
    }
}
