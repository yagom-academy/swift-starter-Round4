//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by Nat Kim on 2023/12/19.
//

import Foundation

enum ActivityType: String {
    case sitUp = "윗몸일으키기"
    case squat = "스쿼트"
    case longDistanceRunning = "오래달리기"
    case yoga = "요가"
    case dynamicRest = "동적휴식"
}

struct Activity {
    let name: ActivityType
    let action: (BodyCondition) -> Void
}

extension ActivityType {
    func performActivity(_ bodyCondition: inout BodyCondition) {
        bodyCondition.performActivity(self)
    }
}
