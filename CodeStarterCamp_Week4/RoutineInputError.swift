//
//  RoutineInputError.swift
//  CodeStarterCamp_Week4
//
//  Created by QL Jeong on 2023/09/11.
//

import Foundation

enum RoutineInputError: Error {
    case cannotRead
    case notInt
    case notPositiveNumber
}

extension RoutineInputError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .cannotRead:
            return "읽을 수 없는 값 입니다."
        case .notInt:
            return "숫자가 아닙니다."
        case .notPositiveNumber:
            return "양수가 아닙니다."
        }
    }
}
