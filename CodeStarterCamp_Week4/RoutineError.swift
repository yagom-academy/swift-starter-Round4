//
//  RoutineError.swift
//  CodeStarterCamp_Week4
//
//  Created by 김예림 on 2023/06/13.
//

import Foundation

enum RoutineError: Error {
    case fatigueExceeded
    case invalidInput
    case otherError
}

extension RoutineError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .fatigueExceeded:
            return NSLocalizedString("피로도가 100 이상입니다. 루틴을 중단합니다.", comment: "Exceed fatigue")
        case .invalidInput:
            return NSLocalizedString("잘못된 입력 형식입니다. 다시 입력해주세요.", comment: "Invalid input")
        case .otherError:
            return NSLocalizedString("알 수 없는 에러가 발생했습니다.", comment: "Other Error")
        }
    }
}


