//
//  BodyConditionError.swift
//  CodeStarterCamp_Week4
//
//  Created by 황지웅 on 2022/05/09.
//

import Foundation

enum IntegerInputError: Error {
    case nilCount
    case stringInput
    case negativeValue
    case emptyInput
    case overIndex
}

extension IntegerInputError: LocalizedError {
    var errorDescription: String {
        switch self {
        case .nilCount:
            return "잘못된 접근입니다."
        case .stringInput:
            return "숫자만 입력해주세요"
        case .negativeValue:
            return "양수만 입력해주세요"
        case .emptyInput:
            return "비어있는 값입니다. 다시 입력해주세요"
        case .overIndex:
            return "우리 피트니스 센터에서 할수 있는 운동 루틴이 아니에요"
            
        }
    }
}
