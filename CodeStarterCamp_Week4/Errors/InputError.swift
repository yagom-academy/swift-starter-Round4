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
