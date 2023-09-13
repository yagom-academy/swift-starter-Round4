//
//  PersonWorkoutError.swift
//  CodeStarterCamp_Week4
//
//  Created by QL Jeong on 2023/09/11.
//

import Foundation

enum PersonWorkoutError: Error {
    case tiredness
}

extension PersonWorkoutError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .tiredness:
            return "피로도가 100 이상입니다."
        }
    }
}
