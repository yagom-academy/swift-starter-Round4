//
//  KoreanNumber.swift
//  CodeStarterCamp_Week4
//
//  Created by ByungHoon Ann on 2022/11/09.
//

import Foundation

enum KoreanNumber: Int {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    
    var numberText: String {
        switch self {
        case .one:
            return "첫 번째"
        case .two:
            return "두 번쨰"
        case .three:
            return "세 번쨰"
        case .four:
            return "네 번째"
        case .five:
            return "다섯 번째"
        case .six:
            return "여섯 번째"
        case .seven:
            return "일곱 번째"
        case .eight:
            return "여덟 번째"
        case .nine:
            return "아홈 번째"
        case .ten:
            return "열 번째"
        }
    }
}
