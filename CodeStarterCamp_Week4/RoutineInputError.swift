//
//  RoutineInputError.swift
//  CodeStarterCamp_Week4
//
//  Created by JSB on 2023/03/18.
//

import Foundation

enum RoutineInputError: Error {
    case routineInputLessThanZero
    case fatigueOver100
    case invalidInputType
    case routineInputIsNil
}
