//
//  TypeOfActivity.swift
//  CodeStarterCamp_Week4
//
//  Created by 김예림 on 2023/06/13.
//

import Foundation

enum TypesOfActivity {
    case sitUps, squat, longRun, activeRest
    
}

extension TypesOfActivity: CustomStringConvertible {
    var description: String {
        switch self {
        case .sitUps:
            return "윗몸일으키기"
        case .squat:
            return "스쿼트"
        case .longRun:
            return "오래달리기"
        case .activeRest:
            return "동적휴식"
        }
        
    }
}
