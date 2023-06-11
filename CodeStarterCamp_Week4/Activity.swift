//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by ChoiKwangWoo on 2023/06/10.
//

import Foundation

enum ActivityType: CaseIterable {
    case situp
    case squat
    case running
    case rest
    
    var name: String {
        switch self {
        case .situp: return "윗몸일으키기"
        case .squat: return "스쿼트"
        case .running: return "오래달리기"
        case .rest: return "동적휴식"
        }
    }
    
    static func getActivity(from name: String) -> ActivityType? {
        let selectedActivity: ActivityType? = ActivityType.allCases.first{ "\($0.name)" == name }
        return selectedActivity
    }
}
