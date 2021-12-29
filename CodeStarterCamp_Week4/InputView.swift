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
        
        try checkValidInputStringValue(input: nameOfMember)
        
        return nameOfMember
    }
    
    func inputGolasBodyCondition() throws -> [Int] {
        var goalsBodyConditions: [Int] = []
        
        print("운동 목표치를 순서대로 알려주세요. 예시) 상체근력:130,하체근력:120,근지구력:150")
        
        goalsBodyConditions.append(try convertInputValueToInt(input: makeEachInputGolasBodyCondition(type: "상체근력")))
        goalsBodyConditions.append(try convertInputValueToInt(input: makeEachInputGolasBodyCondition(type: "하체근력")))
        goalsBodyConditions.append(try convertInputValueToInt(input: makeEachInputGolasBodyCondition(type: "근지구력")))
        
        return goalsBodyConditions
    }
    
    func makeEachInputGolasBodyCondition(type: String) throws -> String {
        print("\(type):", terminator:"")
        guard let golasBodyCondition = readLine() else {
            throw InputError.valueIsNil
        }
        try checkValidInputIntValue(input: golasBodyCondition)
        return golasBodyCondition
    }
}

extension InputView {
    private func checkValidInputIntValue(input: String) throws {
        do {
            guard input.isEmpty == false else {
                throw InputError.valueIsEmpty
            }
            
            guard Int(input) != nil else {
                throw InputError.valueMustConvertToInt
            }
            
            guard Int(input) ?? -1 > 0 else {
                throw InputError.valueMustPositiveNumber
            }
            
        } catch InputError.valueIsEmpty {
            print(InputError.valueIsEmpty)
        } catch InputError.valueMustConvertToInt {
            print(InputError.valueMustConvertToInt)
        } catch InputError.valueMustPositiveNumber {
            print(InputError.valueMustPositiveNumber)
        }
    }
    
    private func checkValidInputStringValue(input: String) throws {
        do {
            guard input.isEmpty == false else {
                throw InputError.valueIsEmpty
            }
            
        } catch InputError.valueIsEmpty {
            print(InputError.valueIsEmpty)
        }
    }
    
    private func convertInputValueToInt(input: String) throws -> Int {
        guard let intNumber = Int(input) else {
            throw InputError.valueMustConvertToInt
        }
        
        return intNumber
    }
}
