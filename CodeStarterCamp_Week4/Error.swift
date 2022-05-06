//
//  FitnessCenterContingency.swift
//  CodeStarterCamp_Week4
//
//  Created by 이정민 on 2022/05/06.
//

import Foundation

enum FitnessCenterContingency: Error {
    case unRecognizedInputError
    case stringToIntConvertError
    case invalidNumberOfValuesError
    case notExistMemberError
    case exhaustedMemberError
    case notEnoughToTargetError
}

enum ErrorValue {
    static let stringToIntConvertErrorValue = -1
}
