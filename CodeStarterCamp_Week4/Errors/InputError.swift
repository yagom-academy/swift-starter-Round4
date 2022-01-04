//
//  InputError.swift.swift
//  CodeStarterCamp_Week4
//
//  Created by 조민호 on 2021/12/30.
//

import Foundation

enum InputError: Error {
    case valueIsNil
    case valueIsEmpty
    case valueMustConvertToInt
    case valueMustPositiveNumber
}

extension InputError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .valueIsNil:
            return "빈 값은 입력이 불가능합니다. 다시 입력해주세요."
        case .valueIsEmpty:
            return "빈 값은 입력이 불가능합니다. 다시 입력해주세요."
        case .valueMustConvertToInt:
            return "숫자만 입력이 가능합니다. 다시 입력해주세요."
        case .valueMustPositiveNumber:
            return "양수만 입력이 가능합니다. 다시 입력해주세요."
        }
    }
}
