//
//  activity.swift
//  CodeStarterCamp_Week4
//
//  Created by karen on 2023/03/19.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

enum ActivityError: Error {
    case invalidInput
    case nonPositiveInteger
    case tooTired
}
