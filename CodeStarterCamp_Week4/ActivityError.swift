//
//  ActivityError.swift
//  CodeStarterCamp_Week4
//
//  Created by ByungHoon Ann on 2022/11/09.
//

import Foundation

enum ActivityError: Error {
    case overFatigue
    case onlyInteger
    case wrongInput
    
    var errorMessage: String {
        switch self {
        case .overFatigue:
            return "피로도가 100 이상입니다. 루틴을 중단합니다."
        case .onlyInteger:
            return "양의 정수만 입력 가능합니다. 다시 입력해주세요."
        case .wrongInput:
            return "잘못된 입력 형식입니다. 다시 입력해주세요."
        }
    }
}


