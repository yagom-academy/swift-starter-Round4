//
//  RoutineSelectError.swift
//  CodeStarterCamp_Week4
//
//  Created by 황지웅 on 2022/05/09.
//

import Foundation

enum RoutineSelectError: Error {
    case nilCount
    case stringInput
    case negativeValue
    case overIndex
    case emptyInput
}
