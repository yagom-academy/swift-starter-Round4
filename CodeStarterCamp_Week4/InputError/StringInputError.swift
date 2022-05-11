//
//  NamingError.swift
//  CodeStarterCamp_Week4
//
//  Created by 황지웅 on 2022/05/09.
//

import Foundation

enum StringInputError: Error {
    case nilName
    case emptyName
}

extension StringInputError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .nilName:
            return "잘못된 접근입니다."
        case .emptyName:
            return "이름을 입력해주세요. 빈칸은 안됩니다."
        }
    }
}
