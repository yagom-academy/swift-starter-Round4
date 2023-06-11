//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func printLine(length: Int = 20) {
    let line: String = String(repeating: "-", count: length)
    print(line)
}

let bodyCondition: BodyCondition = BodyCondition()
var routine = Routine(name: "MadCow")

do {
    try routine.initiateRoutine(condition: bodyCondition)
} catch {
    print(error.localizedDescription)
}


