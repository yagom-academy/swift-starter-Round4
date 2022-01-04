//
//  Exercise.swift
//  CodeStarterCamp_Week4
//
//  Created by LIMGAUI on 2022/01/04.
//

import Foundation

struct Exercise {
    let name: String
    let action: () -> Void
}

enum Exercises {
    case sitUp
    case squart
    case runLong
    case pushUp
    case activeRest
    
    var name: String {
        switch self {
        case .sitUp:
            return "윗몸일으키기"
        case .squart:
            return "스쿼트"
        case .runLong:
            return "오래달리기"
        case .pushUp:
            return "푸쉬업"
        case .activeRest:
            return "동적휴식"
        }
    }
}
