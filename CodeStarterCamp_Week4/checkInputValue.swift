//
//  checkInputValue.swift
//  CodeStarterCamp_Week4
//
//  Created by JSB on 2023/03/18.
//

import Foundation

func checkInputValue(_ inputString: String?) throws -> Int{
    guard let input = inputString else {
        throw RoutineInputError.routineInputIsNil
    }
    
    guard let inputToInt = Int(input) else {
        throw RoutineInputError.invalidInputType
    }
    
    guard inputToInt > 0 else {
        throw RoutineInputError.routineInputLessThanZero
    }
    
    return inputToInt
}
