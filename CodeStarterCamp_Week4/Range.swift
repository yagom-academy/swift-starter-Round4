//
//  Range.swift
//  CodeStarterCamp_Week4
//
//  Created by 김예림 on 2023/06/10.
//

import Foundation

enum Range {
    case fiveToTen
    case tenToTwenty
    case twentyToThirty
    
    func randomValue() -> Int {
        switch self {
        case .fiveToTen:
            return Int.random(in: 5...10)
        case .tenToTwenty:
            return Int.random(in: 10...20)
        case .twentyToThirty:
            return Int.random(in: 20...30)
        }
        
    }
}
