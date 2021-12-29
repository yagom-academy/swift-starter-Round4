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
    
    func inputNameOfMember() throws -> String {
        print("안녕하세요. 야곰 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        
        guard let nameOfMember = readLine() else {
            throw InputError.valueIsNil
        }
        
        return nameOfMember
    }
    
    func inputGolasBodyCondition() throws -> [Int] {
        var goalsBodyConditions: [Int] = []
        
        print("운동 목표치를 순서대로 알려주세요. 예시) 상체근력:130,하체근력:120,근지구력:150")
        
        print("상체근력:", terminator:"")
        guard let golasUpperBodyStrength = readLine() else {
            throw InputError.valueIsNil
        }
        goalsBodyConditions.append(try convertInputValueToInt(input: golasUpperBodyStrength))
        
        print("하체근력:", terminator:"")
        guard let golasLowerBodyStrength = readLine() else {
            throw InputError.valueIsNil
        }
        goalsBodyConditions.append(try convertInputValueToInt(input: golasLowerBodyStrength))
        
        print("근지구력:", terminator:"")
        guard let golasMuscularEndurance = readLine() else {
            throw InputError.valueIsNil
        }
        goalsBodyConditions.append(try convertInputValueToInt(input: golasMuscularEndurance))
        
        return goalsBodyConditions
    }
}

extension InputView {
    private func convertInputValueToInt(input: String) throws -> Int {
        guard let intNumber = Int(input) else {
            throw InputError.valueMustConvertToInt
        }
        
        return intNumber
    }
}
