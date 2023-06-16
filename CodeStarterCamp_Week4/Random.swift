//
//  Random.swift
//  CodeStarterCamp_Week4
//
//  Created by Lee minyeol on 2023/06/15.
//

import Foundation

enum Random {
    case fiveToTen
    case tenToTwenty
    case twentyToThirty
    
    var value: Int {
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
