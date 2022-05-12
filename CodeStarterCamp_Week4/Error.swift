//
//  Error.swift
//  CodeStarterCamp_Week4
//
//  Created by Seong A Oh on 2022/05/10.
//

import Foundation

enum InputError: Error {
    case empty
    case outOfValue
    case invaildValue
}

extension InputError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .empty:
            return "값을 입력하지않았습니다. 값을 입력해주세요"
        case .invaildValue:
            return "입력할 수 없는 값입니다. 다시 입력하세요."
        case .outOfValue:
            return "값의 갯수가 적거나 큽니다."
        }
    }
}
