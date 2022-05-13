//
//  FitnessError.swift
//  CodeStarterCamp_Week4
//
//  Created by 홍승주 on 2022/05/11.
//

import Foundation

enum FitnessError: String, Error {
    case overFatigue = "피로도가 100을 넘었습니다."
    case noGoal
    case wrongInput = "올바른 입력을 해주세요"
    case emptyMember = "회원이 아닙니다."
    case etcError = "기타에러"
}
