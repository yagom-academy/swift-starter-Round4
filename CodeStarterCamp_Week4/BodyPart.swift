//
//  BodyPart.swift
//  CodeStarterCamp_Week4
//
//  Created by 맨태 on 1/25/24.
//

import Foundation

enum BodyPart {
    case upper
    case lower
    case stamina
    case fatigue
    
    var name: String {
        switch self {
        case .upper: return "상체근력"
        case .lower: return "하체근력"
        case .stamina: return "근지구력"
        case .fatigue: return "피로도"
        }
    }
}
