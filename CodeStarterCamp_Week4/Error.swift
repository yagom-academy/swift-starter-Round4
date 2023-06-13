//
//  Error.swift
//  CodeStarterCamp_Week4
//
//  Created by ChoiKwangWoo on 2023/06/11.
//

import Foundation

enum RoutineError: Error {
    case invalidInput
    case negativeNumber
    case fatigueOverload
}

extension RoutineError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidInput:
            return "숫자를 입력해주세요!"
        case .negativeNumber:
            return "1이상의 숫자를 입력해주세요!"
        case .fatigueOverload:
            return "피로도가 100 이상입니다. 루틴을 중단합니다."
        }
    }
}
