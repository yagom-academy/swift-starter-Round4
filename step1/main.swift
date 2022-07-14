//
//  main.swift
//  step1
//
//  Created by codenest on 2022/07/14.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
}
struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}
