//
//  FitnessCenterContingency.swift
//  CodeStarterCamp_Week4
//
//  Created by 이정민 on 2022/05/06.
//

import Foundation

enum FitnessCenterContingency: Error {
    case unexpectedInputError
    case stringToIntConvertError
    case spillOverIndexError
}

enum ErrorMessage {
    static let unexpectedInputErrorMessage = {
        print("Error: 인식할 수 없는 값입니다.")
    }
    
    static let stringToIntConvertErrorMessage = {
        print("Error: 정수로 변환할 수 없습니다.")
    }
    
    static let spillOverIndexErrorMessage = {
        print("Error: 너무 많은 값을 입력했습니다.")
    }
}

enum ErrorValue {
    static let stringToIntConvertErrorValue = -1
}
