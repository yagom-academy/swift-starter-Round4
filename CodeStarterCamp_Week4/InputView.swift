//
//  InputView.swift
//  CodeStarterCamp_Week4
//
//  Created by 조민호 on 2021/12/29.
//

import Foundation

struct InputView {
    private enum InputError: Error {
        case valueIsNil
        case valueIsEmpty
        case valueMustConvertToInt
        case valueMustPositiveNumber
    }
    
    func inputNameOfNumber() throws -> String {
        print("안녕하세요. 야곰 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        
        guard let input = readLine() else {
            throw InputError.valueIsNil
        }
        
        return input
    }
    

}
