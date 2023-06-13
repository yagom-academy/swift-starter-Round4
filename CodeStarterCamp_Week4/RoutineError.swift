//
//  RoutineError.swift
//  CodeStarterCamp_Week4
//
//  Created by 김예림 on 2023/06/13.
//

import Foundation

enum RoutineError: Error, CustomStringConvertible {
    case fatigueExceeded
    case invalidInput
    case otherError
    
    var description: String {
        switch self {
        case .fatigueExceeded:
            return "피로도가 100 이상입니다. 루틴을 중단합니다."
        case .invalidInput:
            return "잘못된 입력 형식입니다. 다시 입력해주세요."
        case .otherError:
            return "알 수 없는 에러가 발생했습니다."
        }
    }
}


