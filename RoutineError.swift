//
//  File.swift
//  CodeStarterCamp_Week4
//
//  Created by 이준영 on 2022/07/20.
//

import Foundation

enum RoutineError: Error {
    case wrongInput
    case fatigueAccumulation
    case noRoutine
}

extension RoutineError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .wrongInput:
            return "잘못된 입력 형식입니다. 바른 형식을 입력해야 합니다."
        case .noRoutine:
            return "아무 활동도 없는 루틴입니다."
        case .fatigueAccumulation:
            return "피로도가 100 이상입니다. 루틴을 수행할 수 없는 상태입니다."
        }
    }
}
