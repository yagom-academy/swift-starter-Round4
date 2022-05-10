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
}

extension FitnessCenterContingency: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unRecognizedInputError:
            return "인식할 수 없는 값입니다."
        case .stringToIntConvertError:
            return "정수로 변환할 수 없습니다."
        case .invalidNumberOfValuesError:
            return "너무 적거나 많은 값을 입력했습니다."
        }
    }
}

enum ErrorValue {
    static let stringToIntConvertErrorValue = -1
}
