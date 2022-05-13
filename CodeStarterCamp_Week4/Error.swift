//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum PersonError: Error {
    case personBeDrained
}

enum FitnessCenterError: Error {
    case emptyMember
    case emptyGoalsBodyCondition
    case emptyChosenRoutine
    case emptyDecidedSet
    case memberBeDrained
}

enum KioskError: Error {
    case emptyData
    case forcedTermination
    case notEnglish
    case notNumber
    case notNaturalNumber
}
