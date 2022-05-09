//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    var bodyCondition: BodyCondition
    
    init(name: String, bodyCondition: BodyCondition) {
        self.name = name
        self.bodyCondition = bodyCondition
    }
    
    func exercise(for set: Int, routine: Routine) {
        routine.startRoutine(based: bodyCondition)
    }
    
    func printMyBodyCondition() {
        print("현재 \(name)님의 컨디션입니다.")
        bodyCondition.informBodyCondition()
    }
}
