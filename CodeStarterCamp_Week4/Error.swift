//
//  Error.swift
//  CodeStarterCamp_Week4
//
//  Created by mingmac on 2022/05/10.
//

import Foundation

enum InputError: Error {
    case notString
    case notInt
}

enum FitnessCenterError: Error {
    case unreachedGoal
    case runAwayMember
    case invaildRoutine
}
