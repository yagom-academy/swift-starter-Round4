//
//  Error.swift
//  CodeStarterCamp_Week4
//
//  Created by 김인호 on 2022/05/11.
//

import Foundation

enum FitnessError: String, Error {
    case exhaustion = "회원님이 도망갔습니다."
    case underTarget = "목표치에 도달하지 못했습니다."
    case wrongInput = "잘못된 입력값입니다."
    case noMember = "루틴을 진행할 회원이 없습니다."
    case unexpectedError = "기타 오류가 발생했습니다."
}
