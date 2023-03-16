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

struct Exercise {
    let sitUp: Activity = Activity(name: "윗몸일으키기") {
        $0.upperStrength += Int.random(in: 10...20)
        $0.fatigue += Int.random(in: 10...20)
    }
    let squat: Activity = Activity(name: "스쿼트") {
        $0.lowerStrength += Int.random(in: 20...30)
        $0.fatigue += Int.random(in: 10...20)
    }
    let running: Activity = Activity(name: "오래달리기") {
        $0.endurance += Int.random(in: 20...30)
        $0.upperStrength += Int.random(in: 5...10)
        $0.lowerStrength += Int.random(in: 5...10)
        $0.fatigue += Int.random(in: 20...30)
    }
    let activeRest: Activity = Activity(name: "동적휴식") {
        $0.fatigue -= Int.random(in: 5...10)
    }
    let plank: Activity = Activity(name: "플랭크") {
        $0.upperStrength += Int.random(in: 10...20)
        $0.fatigue += Int.random(in: 10...20)
    }
}
